# Widget Czatu na Stronie WWW (Web Chat)

Widget czatu na stronę internetową to lekki, autonomiczny interfejs JavaScript osadzany w witrynie klienta lub bezpośrednio na stronach EspoCRM.

---

## 1. Osadzanie i Dostępność

- **Kod osadzenia:** Jednoliniowy skrypt generowany automatycznie na rekordzie widgetu.
- **Zabezpieczenie domen (`allowedDomains`):** Kontroluje, które witryny mogą osadzać widget (egzekwowane przez nagłówek CSP `frame-ancestors`). Sam CRM jest zawsze dozwolony, co umożliwia uruchamianie widgetu wewnątrz EspoCRM.

---

## 2. Wygląd i Personalizacja

- **Motywy:** 5 wbudowanych stylów (niebieski, zielony, fioletowy, pomarańczowy, ciemny) oraz pełna **customowa paleta kolorów** (główny, tło, tekst, osobne kolory dymków dla gościa i agenta).
- **Stylistyka:** Wybór kroju czcionki (systemowa, szeryfowa, zaokrąglona), promień zaokrąglenia rogów, pozycja (lewy lub prawy dolny róg).
- **Wielojęzyczność:** Domyślny język widgetu oraz rekordy lokalizacji per język nadpisujące dowolny tekst lub etykietę. Odwiedzający mogą przełączać język w widgecie.
- **Etykiety `@key`:** Dowolna etykieta w formularzach i tekstach widgetu może odwoływać się do klucza tłumaczenia.
- **Format czasu:** 12/24-godzinny format zgodny z ustawieniami EspoCRM.

---

## 3. Konfiguracja Przed Rozpoczęciem Czatu

- **Kreator formularza wstępnego (Pre-chat):** Pola tekstowe, email, telefon, liczba, data, lista rozwijana (select), pole tekstowe (textarea) oraz checkbox. Flaga wymagalności, placeholdery oraz opcja układu dwukolumnowego („połowa szerokości”).
- **Kategoria/Temat:** Pole tematu sterowane opcjami z rzeczywistego pola CRM (np. kategoria zgłoszenia), pozwalające trasować czat do konkretnego zespołu.
- **Zgody rodo/privacy:** Checkbox zgody z możliwością konfiguracji własnej treści.
- **Harmonogram pracy:** Niestandardowy harmonogram tygodniowy, kalendarz pracy EspoCRM lub połączenie obu (tryby „oba” lub „dowolny”), obsługa stref czasowych i dni wolnych.

---

## 4. Obsługa Bezczynności i Tryb Offline

- **Tryb offline:** Gdy żaden agent nie jest dostępny, widget przekształca się w formularz zgłoszeniowy (z polityką ponownego użycia leada lub zawsze nowego leada, domyślnymi wartościami zgłoszenia i przypisaniem do zespołu) lub ukrywa się całkowicie.
- **Integracja z botem (n8n):** Tryby „najpierw bot” lub „bot w trybie offline”.

---

## 5. Funkcjonalności w Podczas Rozmowy

- **Załączniki:** Przesyłanie plików i zrzutów ekranu ze schowka z limitem rozmiaru ustawianym per widget.
- **Wyszukiwanie w bazie wiedzy:** Bezpośrednio w widgecie, z ograniczeniem do wybranych kategorii. Artykuły podzielone są na *publiczne* oraz *na żądanie* (widoczne dla gościa dopiero po rekomendacji agenta).
- **Przycisk spotkania:** Szybki link do strony rezerwacji terminów.
- **Ocena i opinia:** Formularz oceny i komentarza po zakończeniu konwersacji.
- **Podgląd pisania na żywo (Sneak peek):** Agenci widzą tekst wpisywany przez odwiedzającego w czasie rzeczywistym przed wysłaniem. Opcję można wyłączyć na poziomie widgetu (agenci widzą wtedy „…”).
- **Wykrywanie porzuceń:** Czaty, w których gość opuścił stronę przed odpowiedzią agenta, są automatycznie zamykane po skonfigurowanym czasie.

---

## 6. Śledzenie Odwiedzających i Czat Proaktywny

- **Lista odwiedzających:** Widok na żywo osób przebywających obecnie na stronie (per widget, tryb opt-in).
- **Wiadomość proaktywna:** Agenci mogą wysłać proaktywną wiadomość, która otwiera okno czatu odwiedzającemu, z konfigurowalnym czasem ważności.
- **Geolokalizacja:** Przybliżony kraj, region i miasto ustalane przez zewnętrzny serwis geo oraz strefa czasowa odwiedzającego.
