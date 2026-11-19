# Customer Portal (Portal Klienta)

Moduł integracji z Portalem Klienta EspoCRM dodaje zakładkę **„Wiadomości”**, umożliwiając dwukierunkową komunikację oraz czat wsparcia na żywo dla zalogowanych klientów.

---

## 1. Komunikacja z Personelem

- **Poziomy dostępu:** Konfiguracja uprawnień per użytkownik portalu:
  - *Brak dostępu*
  - *Dostęp tylko do personelu*
  - *Dostęp do personelu oraz osób z tej samej firmy (Account)*
- **Wyszukiwalność pracowników (Discoverability):** Personel decyduje, czy klienci mogą *rozpoczynać* z nimi nowe konwersacje. Klienci zawsze mogą *odpowiedzieć* pracownikowi, który do nich napisał.
- **Prywatność personelu:**
  - Opcjonalne ukrywanie potwierdzeń odczytu przed klientami.
  - Wyświetlanie inicjałów zamiast zdjęć profilowych pracowników.
- **Blokowanie odpowiedzi:** Pracownicy mogą w dowolnym momencie wyłączyć możliwość odpowiadania konkretnemu klientowi. Pracownik nadal może wysyłać wiadomości jednokierunkowe.
- **Formularze w portalu:** Możliwość wysyłania formularzy w wiadomościach prywatnych z zapisem danych bezpośrednio do rekordu Kontaktu klienta.

---

## 2. Czat Wsparcia na Żywo w Portalu (Live Support)

- **Aktywacja widgetu:** Dowolny widget z flagą **„Dostępny w portalach”** może obsługiwać klientów portalu.
- **Uruchomienie:** Klienci rozpoczynają czat przez menu *Nowa konwersacja → Wsparcie klienta*. Poza godzinami pracy wyświetla się komunikat offline widgetu.
- **Automatyczna weryfikacja:** Konwersacja z portalu jest **automatycznie zweryfikowana** i powiązana z rekordem Kontaktu i Konta klienta bez konieczności wypełniania formularza wstępnego ani podawania kodów.
- **Widok w konsoli agenta:** Dla agenta jest to standardowa konwersacja w konsoli oznaczona jako **„Portal”** z pełnym dostępem do narzędzi konsoli.
- **Interface klienta:** Trwający czat jest przypięty na górze listy wiadomości klienta z odznaką „Na żywo”.
- **Bezpieczny czytnik bazy wiedzy:** Artykuły bazy wiedzy otwierają się w portalu w czytniku na stronie, renderowanym w **piaskownicy bez możliwości uruchamiania skryptów (script-less sandbox)**.
- **Prywatność historii czatu:** Domyślnie po zakończeniu czatu znika on z widoku klienta (transkrypcja zostaje w CRM). Administrator może włączyć opcję **„Zachowaj historię czatu wsparcia”** per klient – zarchiwizowane czaty są wtedy dostępne jako transkrypcje tylko do odczytu.

---

## 3. Bezpieczeństwo i Linki do Rekordów w Portalu

Gdy w konwersacji z klientem portalu pojawi się link do rekordu CRM:

- **Uprawniony dostęp:** Jeśli rola klienta w portalu pozwala na odczyt rekordu, wewnętrzny URL z CRM jest automatycznie zastępowany **nazwą rekordu z linkiem do widoku w portalu**.
- **Brak dostępu:** Jeśli klient nie ma uprawnień, link zostaje zastąpiony tekstem **„🔒 Brak dostępu”**, a wewnętrzny adres URL CRM nigdy nie jest eksponowany klientowi.
