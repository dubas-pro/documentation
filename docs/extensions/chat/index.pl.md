# Dubas Chat: Przegląd i Architektura Systemu

> Kompletna warstwa konwersacyjna wbudowana natywnie w EspoCRM: widget czatu na stronę WWW, konsola agenta, wewnętrzny czat zespołowy oraz bezpieczne konwersacje z klientami w portalu EspoCRM. Wszystkie moduły współdzielą jeden model danych, jeden model uprawnień i jeden system powiadomień.

---

## W skrócie

| | |
|---|---|
| **Platforma** | EspoCRM 10+, PHP 8.1+ (moduł rozszerzenia, przestrzeń nazw `DubasChat`, v3.x) |
| **Frontend** | Vanilla JavaScript; brak kroku budowania (no build step), brak frameworka w widgecie |
| **Czas rzeczywisty** | WebSocket (gdy dostępny), automatyczny fallback do long-polling |
| **Kanały** | Widget na stronie · Konsola agenta · Czat zespołowy (wewnętrzny) · Portal klienta |
| **Integracje** | n8n (bot i sugestie AI), Web Push (VAPID), EspoCRM Workflows/BPM, hooki programistyczne |
| **Języki** | Pełne i18n (wbudowany język angielski i polski); nadpisywanie tekstów per widget i per język |
| **Bezpieczeństwo** | Brak zaufania do danych wejściowych gościa, zweryfikowana tożsamość, podpisane adresy URL, widget w piaskownicy CSP, limitowanie żądań (rate limiting), opcjonalne skanowanie antywirusowe |

---

## Dlaczego powstał

Większość integracji czatu z systemami CRM polega na doklejeniu zewnętrznego widgetu SaaS i późniejszej synchronizacji transkrypcji. DubasChat przyjmuje odwrotne podejście: **konwersacja żyje w CRM od pierwszej wiadomości**. Odwiedzający, agent, Kontakt, Konto, zgłoszenie, baza wiedzy i ścieżka audytu korzystają z tych samych rekordów. Żadna zewnętrzna usługa nie przechowuje danych klientów i nie ma ryzyka awarii synchronizacji.

---

## 1. Architektura

### Kluczowe decyzje projektowe

- **Widget jest serwowany bezpośrednio z CRM** (lub z dedykowanej domeny czatu skonfigurowanej przez `dubasChatPublicUrl`) i osadzany jako `iframe`. Strona nadrzędna nigdy nie ma dostępu do ciasteczek ani API systemu CRM.
- **Czas rzeczywisty bez uzależnienia od infrastruktury.** Jeśli WebSocket w EspoCRM jest włączony, aktualizacje są natychmiastowe. W przeciwnym razie mechanizm śledzenia zmian oparty na wersjonowaniu z obsługą long-polling dostarcza wiadomości w parę sekund.
- **Ciężkie zadania wykonywane po wysłaniu odpowiedzi.** Wykonawca `Deferred` uruchamia hooki, wywołania botów i powiadomienia po wysłaniu odpowiedzi HTTP, dzięki czemu odwiedzający i agenci nie czekają na integracje.
- **Jedna ścieżka zapisu.** Każda wiadomość przechodzi przez `ConversationStore::write()`, a każda zmiana stanu przez `ConversationStore::transition()`. Zmiany stanu to atomowe zapytania SQL, więc dwaj agenci klikający „Przejmij” w tym samym momencie nigdy nie wygrają jednocześnie.
- **Zdarzenia cyklu życia są kluczowe.** Każda istotna zmiana (oczekiwanie, przypisanie, przekazanie, przeoczenie, dołączenie, weryfikacja, wysłanie formularza, zamknięcie i inne) jest rejestrowana w konwersacji. Wyzwala ona hook programistyczny i jest widoczna dla EspoCRM Workflows oraz BPM.
- **Pliki przesyłane jako JSON w base64.** Przesyłanie plików odbywa się przez pojedynczą, audytowalną ścieżkę kodu z detekcją typów, listą dozwolonych rozszerzeń i opcjonalnym skanowaniem pod kątem złośliwego oprogramowania.

### Struktura modułu (uproszczona)

- **Encje:** widgety, lokalizacje językowe widgetów, konwersacje, wiadomości, uczestnicy, aliasy agentów, formularze, gotowe odpowiedzi, blokady (bany), odwiedzający, czaty zespołowe, członkowie zespołów, wiadomości zespołowe, referencje do rekordów, listy blokowanych, subskrypcje push.
- **Narzędzia** zorganizowane według domen: `Security`, `Widget`, `Visitor`, `Conversation`, `Agent`, `Attachment`, `Bot`, `Form`, `KnowledgeBase`, `Ticket`, `Invite`, `Push`, `TeamChat`, `I18n`.
- **Frontend:** autonomiczny widget (`loader.js`, `widget.js`), konsola agenta, wspólna logika czatu zespołowego używana przez konsolę i portal, miksin Web Push, service worker oraz globalny „watcher” powiadamiający użytkowników w dowolnym miejscu CRM.

---

## 2. Tożsamość i weryfikacja

**Adres email wpisany w formularzu czatu o niczym nie świadczy**, dlatego DubasChat nigdy nie traktuje go jako potwierdzonej tożsamości.

- Domyślnie konwersacja jest **niezweryfikowana**. Dopasowane rekordy CRM są agentowi jedynie *sugerowane* (sugerowany Kontakt, Lead, Konto) i nigdy nie łączą się automatycznie.
- Konwersacja staje się **zweryfikowana** na jeden z poniższych sposobów:
  1. **Kod weryfikacyjny:** agent go żąda, a jednorazowy kod `XXXX-YYYY` jest dostarczany do klienta przez hook programistyczny (email, SMS). Jest ważny przez 10 minut, pozwala na 5 prób i jest przechowywany wyłącznie jako hash HMAC.
  2. **Zaproszenie:** agent tworzy zaproszenie do czatu (link i kod) zaadresowane na adres email rekordu.
  3. **Decyzja agenta:** agent ręcznie i jawnie weryfikuje tożsamość rozmówcy.
  4. **Tożsamość ze strony nadrzędnej:** witryna podpisuje tożsamość zalogowanego użytkownika kluczem prywatnym widgetu (HMAC).
  5. **Portal:** klienci rozmawiający z poziomu portalu EspoCRM są weryfikowani przez swoje konto logowania w CRM.
- Powiązania z Kontaktem, Leadem i Kontem są ustawiane na stałe dopiero po pomyślnej weryfikacji.
- Kontakty lub Leady mogą być tworzone automatycznie (`createContactAs`), ale wyłącznie z danych, którym system może zaufać.

---

## 3. Ścieżka audytu i referencje do rekordów

Każdy rekord CRM wspomniany w dowolnej konwersacji (czaty zespołowe i czaty z klientami) jest zapisywany jako referencja:

- Wykrywana automatycznie z linków wklejonych w wiadomościach (pełne adresy URL lub `#Entity/view/id`);
- Ręcznie powiązana przez agentów z poziomu konsoli;
- Widoczna z nazwą rekordu tylko dla osób z uprawnieniami do jego odczytu, a dla pozostałych jako „brak dostępu”;
- Możliwa do przeglądania przez administratorów z filtrem według rekordu (np. *"W których konwersacjach omawiano tę Szansę?"*).

---

## 4. Powiadomienia Web Push

Zaimplementowane od zera w PHP, bez użycia zewnętrznych SDK usług push:

- **VAPID:** prywatny klucz przechowywany w konfiguracji systemowej, nieeksponowany w UI.
- **Szyfrowanie ładunku (RFC 8291):** `aes128gcm` wykonywane w PHP.
- **Biała lista punktów końcowych:** FCM, Mozilla, WNS, Apple (ochrona przed SSRF).
- **Inteligentne tłumienie:** brak powiadomień push, gdy użytkownik aktywnie korzysta z CRM (heartbeat aktywności wynosi ok. 35 sekund).
- **Samoczyszczenie:** subskrypcje są usuwane po błędach 404/410 lub 60 dniach bezczynności; wylogowanie usuwa subskrypcję urządzenia.
- **Obsługa portalu:** powiadomienia dla klientów portalu otwierają właściwy URL portalu.

---

## 5. Model bezpieczeństwa

- **Publiczne punkty końcowe:** Weryfikacja hosta i origin, CSP z nonse, `frame-ancestors`, rate limiting (IP, widget, konwersacja), minimalny czas wypełniania formularza (2,5 s), bany.
- **Tokeny sesyjne:** 24 losowe bajty, przechowywane wyłącznie jako hasze SHA-256, związane z urządzeniem, wygasające po 24h.
- **Kody dołączenia:** Jednorazowe z limitami błędnych prób.
- **Zawartość i pliki:** Eskapowanie danych wejściowych, ochrona przed spreadsheet injection, biała lista plików (brak SVG/HTML), detekcja MIME z zawartości, skanowanie **ClamAV**, krótkotrwałe podpisane URL-e.
- **Integracje bota:** Wyłącznie HTTPS, blokowanie prywatnych IP, przypięcie DNS (DNS-rebinding protection), podpisywanie HMAC wywołań zwrotnych z ochroną przed powtórzeniami.
- **Prywatność i retencja:** Anonimizacja adresów IP i user agentów po skonfigurowanym czasie (domyślnie 180 dni), automatyczne sprzątanie wygasłych tokenów i kodów.

---

## 6. Rozszerzalność dla programistów

DubasChat udostępnia jasne punkty rozszerzeń jako standardowe hooki EspoCRM.

- **Hooki czatu z klientem:** `afterChatEvent`, `afterVerificationRequested`, `afterInviteCreated`, `afterFormSubmitted` / `afterFormDeclined`.
- **Hooki czatu zespołowego:** `afterTeamMembersAdded`, `afterTeamMessageSent`, `afterTeamFormSubmitted`.
- **Obiekty pomocnicze:** Wyniki hooków używają typowanych obiektów (`DeliveryResult`, `FormHookResult`) z limitami rozmiaru.
- **No-code:** Zdarzenia cyklu życia na rekordzie konwersacji pozwalają na automatyzację w EspoCRM Workflows i BPM.

---

## 7. Administracja i konfiguracja

- Konfiguracja przez zwykłe rekordy EspoCRM oraz zakładkowe układy szczegółów (Ogólne, Agenci, Harmonogram, Wygląd, Teksty i formularz, Funkcje, Offline i zgłoszenia, Bezpieczeństwo).
- Dedykowane zakresy uprawnień ról EspoCRM: dostęp do konsoli, czat zespołowy, tworzenie wątków, edycja wiadomości, czat w portalu.
- Zaplanowane zadanie (co 5 minut) obsługuje wygaszanie tokenów, nieaktywne czaty, sprzątanie porzuconych rozmów i anonimizację.

---

## 8. Status i roadmapa (v3.x)

**Ostatnio ukończono:**
- Czat wsparcia na żywo w portalu EspoCRM z opcjonalną historią per klient.
- Referencje do rekordów w konwersacjach z klientami, z linkami dostosowanymi do portalu oraz ręcznym wiązaniem.
- Zarządzanie kategoriami i panel powiązanych rekordów w konsoli.
- Wbudowany lightbox dla obrazów i łagodniejszy dźwięk powiadomień.

**W trakcie realizacji / planowane:**
- Dedykowane uprawnienie „agent portalu” dla personelu odpowiadającego na czaty w portalu.
- Dalsze wzmacnianie bezpieczeństwa API czatu zespołowego i limitów żądań w portalu.
- Panel po stronie rekordu pokazujący wszystkie konwersacje, w których dany rekord został wspomniany.
