# Konsola Agenta i Czat Zespołowy

Konsola agenta to pełnoekranowe środowisko pracy wewnątrz EspoCRM przeznaczone do obsługi klientów oraz komunikacji wewnętrznej.

---

## 1. Skrzynka Odbiorcza i Trasowanie

- **Kolejki czatów:** Widok konwersacji **otwartych** i **niedawnych** (ostatnie 24h); wyszukiwanie po `#numerze`, nazwisku, adresie email lub kodzie dołączenia.
- **Algorytmy trasowania:**
  - *Broadcast:* Kolejka widoczna dla wszystkich agentów.
  - *Round Robin:* Wskaźnik zapamiętywany po restarcie systemu dla sprawiedliwego podziału.
  - *Least Busy:* Trasowanie do agenta z najmniejszą liczbą aktywnych czatów.
- **Limity i limity czasu:** Indywidualny limit czatów per agent oraz czas na akceptację (accept timeout).
- **Statusy obecności:** Dostępny (Online), Zaraz wracam (Away), Niedostępny (Offline) z automatycznym wygasaniem przy bezczynności przeglądarki.
- **Przypomnienia:** Dźwiękowe przypomnienia z kolejki odtwarzane tylko wtedy, gdy karta konsoli działa w tle.

---

## 2. Obsługa Konwersacji

- **Akcje podstawowe:** Przejmij (Take), Dołącz (Join), Opuść (Leave). Atomowe zapytania SQL zapobiegają wygraniu przejęcia przez dwóch agentów naraz.
- **Przekazywanie (Transfers):** Konfigurowalna polityka akceptacji na poziomie widgetu (nigdy, tylko gdy cel jest offline, zawsze). Obejmuje limity czasu, odrzucanie, anulowanie i opcję pozostania w konwersacji.
- **Zapraszanie współpracowników:** Możliwość dołączenia innego agenta do trwającej rozmowy.
- **Szepty (Internal notes):** Notatki wewnętrzne widoczne tylko dla personelu.
- **Aliasy agentów:** Persony z własną nazwą wyświetlaną, stanowiskiem i awatarem per widget (np. „Jan - Sprzedaż” na jednej marce, „Wsparcie” na drugiej).
- **Gotowe odpowiedzi:** Szybkie szablony wiadomości ze skrótami klawiszowymi i kategoriami.
- **Karty bazy wiedzy:** Wysyłanie kart artykułów bezpośrednio na czat do klienta.
- **Integracja ze zgłoszeniami (Tickets):** Tworzenie nowego zgłoszenia (`Case` lub encja customowa) z wstępnie wypełnionym szkicem lub podpinanie istniejącego.
- **Sugestie AI:** Sugestie odpowiedzi generowane przez webhook bota n8n.
- **Zarządzanie konwersacją:** Zmiana języka konwersacji i kategorii czatu z notatką audytową.
- **Blokady (Bany):** Blokowanie odwiedzających po urządzeniu lub adresie IP.

---

## 3. Panel Kontekstowy

Panel boczny konsoli udostępnia pełen kontekst klienta i sesji:

- **Szczegóły:** Dane odwiedzającego, stan weryfikacji tożsamości, sugerowane i połączone rekordy CRM, odpowiedzi z pre-chat, ocena.
- **Zespół:** Uczestnicy rozmowy, stan przekazania, koledzy dostępni online.
- **Sesja:** Aktualny URL strony, tytuł, referrer, IP, user agent, lokalizacja, strefa czasowa.
- **Baza wiedzy:** Wyszukiwarka i wysyłanie artykułów.
- **Powiązane rekordy:** Rekordy CRM wspomniane w czacie oraz rekordy powiązane ręcznie przez agenta z odsyłaczami do konkretnych wiadomości.

---

## 4. Powiadomienia w Całym CRM

- **Leader-Tab Watcher:** Mechanizm działający w jednej karcie przeglądarki w całym CRM, eliminujący duplikowanie dźwięków i powiadomień z wielu otwartych kart.
- **Kanały alertów:** Powiadomienia pulpitowe, dwutonowy sygnał dźwiękowy oraz powiadomienia Web Push na urządzenia mobilne i zamknięte przeglądarki.

---

## 5. Formularze na Żądanie (Dynamic Forms)

Agenci mogą wysyłać interaktywne formularze w trakcie konwersacji:

- **Mapowanie do CRM:** Automatyczne mapowanie pól na encje Contact lub Lead (tylko w puste pola z białej listy).
- **Identyfikacja:** Możliwość zidentyfikowania klienta po emailu i podpięcia rekordu.
- **Statusy:** Klient może wysłać lub odrzucić formularz; agent może go anulować.
- **Trwałość danych:** Wpisane wartości nie znikają podczas nadejścia nowej wiadomości na żywo.
- **Hooki:** Wyzwalanie automatyzacji (n8n, rezerwacje, sprawdzanie zamówień) po wysłaniu formularza.

---

## 6. Czat Zespołowy (Komunikacja Wewnętrzna)

Wewnętrzny komunikator w stylu Slacka dostępny dla pracowników.

### Konwersacje i Wątki
- **Wiadomości prywatne (DM):** Jedna stała konwersacja dla pary użytkowników (wyznaczana deterministycznym hashem ID).
- **Wątki grupowe:** Konwersacje wieloosobowe z numeracją (`#12`), własną ikoną, kolorem, awatarem i tłem.
- **Zarządzanie i role:** Właściciel i członek. Ochrona ostatniego właściciela wątku.
- **Stany czatu:** Zamykanie, ponowne otwieranie, wyciszanie i archiwizacja (automatyczne przywracanie przy nowej wiadomości).

### Wiadomości i Formatowanie
- **Edytor Markdown:** Pogrubienie, kursywa, przekreślenie, kod, linki, listy, cytaty, skróty klawiszowe (Ctrl+B/I/K/E).
- **Wzmianki (@mentions):** Osobne liczniki nieprzeczytanych wzmianek.
- **Odpowiedzi i linki:** Odpowiedzi z cytowaniem oraz mikrolinki (permalinki) do wiadomości.
- **Historia edycji:** Konfigurowalne okno edycji (domyślnie 15 min) z zachowaniem pełnej historii wersji dla adminów. Miękkie usuwanie.
- **Statusy odczytu:** Potwierdzenia (✓ wysłano, ✓✓ przeczytano) oraz wskaźniki pisania na żywo.
- **Panele boczne:** Galeria plików i dokumentów z lightboxem oraz panel powiązanych rekordów CRM.
