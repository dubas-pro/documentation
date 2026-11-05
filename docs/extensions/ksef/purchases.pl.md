# Dokumenty zakupowe

!!! info "Nowość w 3.0.0"
    Od wersji 3.0.0 faktury przychodzące z KSeF są zapisywane jako **Faktury zakupowe** (Supplier Bills) i **Korekty zakupowe** (Bill Credits) z Sales Pack, a nie jako Wydatki. Dzięki temu masz od razu płatności, rozliczenia i salda dostawców. Jeśli wcześniej korzystałeś z Wydatków, zobacz [instrukcję migracji](./migration-3.md).

## :material-file-download: Jak zapisywane są dokumenty przychodzące

Każdy dokument pobrany z KSeF jest automatycznie przydzielany:

| Dokument w KSeF | Rekord w EspoCRM |
|---|---|
| Faktura (VAT, zaliczkowa, rozliczeniowa, uproszczona) | Faktura zakupowa |
| Korekta zmniejszająca (zwrot, rabat) | Korekta zakupowa |
| Korekta zwiększająca | Faktura zakupowa |
| Korekta zerowa (np. zmiana adresu) | Korekta zakupowa na 0 zł |

Korekta zakupowa jest powiązana z korygowaną fakturą (pole **Faktura korygowana**), jeśli ta faktura jest już w EspoCRM. Wszystkie korekty danej faktury widać w panelu **Korekty zakupowe** na fakturze.

Każdy dokument otrzymuje:

- pozycje z kodami VAT i podatkiem wyliczonym przez Sales Pack,
- dostawcę (zobacz [Dostawcy](#dostawcy)),
- oryginalny plik XML, numer KSeF i publiczny link do faktury w KSeF,
- rachunki bankowe dostawcy i kod QR do płatności,
- status **Wersja robocza** – sprawdź dokument i zmień status na **Zatwierdzona**, gdy go zaakceptujesz.

## :material-cog: Konfiguracja

Otwórz profil KSeF i przejdź do zakładki **Przychodzące**:

- **Pobieraj faktury przychodzące** – włącza automatyczne pobieranie dla tego profilu.
- **Pobieraj faktury od dnia** – najwcześniejsza data używana przy pierwszym pobraniu.
- **Twórz konta dla nowych dostawców** – gdy dostawca nie zostanie znaleziony, razem z Dostawcą tworzone jest Konto. Gdy wyłączone, tworzony jest tylko Dostawca.
- **Opiekun faktur przychodzących** i **Domyślny zespół** – przypisywane do każdego zaimportowanego dokumentu.
- **Powiadamiaj o nowych fakturach** – opiekun dostaje po każdym pobraniu jedno powiadomienie z liczbą nowych dokumentów.
- **Pobrano do** – tylko do odczytu. Pokazuje, do kiedy faktury zostały pobrane.

## :material-sync: Jak działa pobieranie

Od wersji 3.0.0 pobieranie jest przyrostowe. Każde uruchomienie zaczyna od momentu, w którym skończyło poprzednie, według daty **przyjęcia faktury w KSeF** (a nie daty wystawienia). Dzięki temu:

- faktury wystawione wcześniej, a wysłane do KSeF później (np. w trybie offline), nie są pomijane,
- pominięte lub nieudane uruchomienie crona nie tworzy luk,
- jedna błędna faktura nie blokuje pozostałych. Jest pomijana, zapisywana w logu, a opiekun dostaje powiadomienie z numerem KSeF i przyczyną.

Aby pobrać faktury ręcznie, otwórz **Faktury zakupowe** i kliknij **Pobierz faktury z KSeF**. Zakres dat w tym oknie dotyczy daty przyjęcia faktury w KSeF. Aby pobrać pojedynczy dokument, użyj **Pobierz fakturę z KSeF** i wpisz jej numer KSeF.

!!!warning "Uwaga!"
    Nie pobieraj ręcznie zbyt często, ponieważ możesz osiągnąć limity KSeF i zostać tymczasowo zablokowany.

## :material-account-tie: Dostawcy

Dostawcy są dopasowywani po NIP:

1. Używany jest istniejący Dostawca z tym samym NIP.
2. W przeciwnym razie wyszukiwane jest Konto z tym samym NIP i używany (lub tworzony) jest jego Dostawca.
3. W przeciwnym razie tworzony jest nowy Dostawca – razem z Kontem, jeśli włączono **Twórz konta dla nowych dostawców**.

## :material-content-duplicate: Ochrona przed duplikatami

Nie można zapisać faktury (ani korekty) zakupowej, jeśli inny dokument od tego samego dostawcy ma ten sam numer. Porównanie ignoruje spacje i wielkość liter, więc `FV 1/2026` i `fv1/2026` są traktowane jako ten sam numer. Dokumenty anulowane są pomijane.

Jeśli wprowadzisz fakturę ręcznie, a później przyjdzie ona z KSeF, duplikat nie powstanie. Integracja dopisze numer KSeF, plik XML i rachunki bankowe do istniejącego rekordu.

## :material-cash-check: Płatności i rozliczenia

Faktury zakupowe opłacasz płatnością wychodzącą rozliczoną z fakturą. Gdy rozliczenia pokryją całą kwotę, status zmienia się automatycznie:

| Dokument | Rozliczony w całości | Usunięte rozliczenie |
|---|---|---|
| Faktura, faktura zakupowa | Opłacona | powrót do Zatwierdzona |
| Faktura korygująca, korekta zakupowa | Rozliczona | powrót do Zatwierdzona |

Automatycznie zmieniane są tylko dokumenty w statusie **Zatwierdzona**. Wersje robocze i dokumenty anulowane pozostają bez zmian.

Korektę zakupową rozliczasz na jeden z dwóch sposobów:

- **faktura nie jest jeszcze opłacona** – rozlicz korektę z fakturą zakupową, a potem zapłać pozostałą kwotę,
- **faktura była już opłacona** – zarejestruj zwrot od dostawcy jako płatność przychodzącą i rozlicz ją z korektą.

## :material-tag: Kategorie kosztów

Faktury zakupowe mają pole **Kategoria kosztu**: Faktura, Paragon, Podatek, ZUS, Inne. Używaj go dla dokumentów, które nie są fakturami, np. składek ZUS lub płatności podatków:

1. Utwórz dostawcę, np. „Zakład Ubezpieczeń Społecznych” albo „Urząd Skarbowy”.
2. Utwórz fakturę zakupową z numerem deklaracji jako numerem dokumentu dostawcy (np. `DRA 10/2026`).
3. Użyj kodu podatkowego **Poza VAT**, aby dokument nie wpływał na raporty VAT.
4. Opłać go jak każdą inną fakturę.

## :material-file-question: Faktury pro forma

Pro forma nie jest fakturą i nie trafia do KSeF, dlatego nie należy wprowadzać jej jako faktury zakupowej:

- **otrzymana pro forma** – utwórz Zamówienie zakupu i załącz PDF pro formy. Zarejestruj płatność do dostawcy bez rozliczenia, a rozlicz ją, gdy z KSeF przyjdzie właściwa faktura.
- **wystawiona pro forma** – użyj Oferty lub Zamówienia sprzedaży z szablonem PDF „Faktura pro forma”. Po otrzymaniu wpłaty wystaw fakturę zaliczkową lub końcową i rozlicz z nią płatność.

## Powiązane artykuły

* [Faktury korygujące w KSeF](./credit-notes.md)
* [Migracja z Wydatków](./migration-3.md)
