## :octicons-command-palette-16: Dostępne polecenia konsolowe

Ta sekcja opisuje polecenia konsolowe udostępniane przez integrację KSeF, które pomagają zarządzać danymi systemowymi i je utrzymywać.

---

### `migrate-tax-id-to-ksef`

*Dostępne od wersji 1.2.0*

To polecenie umożliwia masową migrację istniejących numerów Tax ID ze starszego pola bazy danych do ustandaryzowanej struktury Tax ID wymaganej przez integrację KSeF.

#### Omówienie

Jeśli Twoja aplikacja wcześniej przechowywała Tax ID lub numery VAT w niestandardowym albo starszym polu (na przykład w polu o nazwie `tid`), to polecenie pozwala bezproblemowo mapować i przenosić te rekordy. Podczas migracji należy podać nazwę starszego pola oraz określić typ przenoszonego Tax ID.

#### Opcje polecenia

| Opcja | Wymagane | Opis | Akceptowane wartości |
| :--- | :---: | :--- | :--- |
| `--field` | Tak | Dokładna nazwa starszego pola, w którym obecnie są przechowywane Tax ID. | Ciąg znaków (np. `tid`) |
| `--type` | Tak | Konkretna klasyfikacja migrowanych Tax ID. | `NIP`, `VAT UE`, `Other` |

#### Przykłady użycia

!!! example "Basic Migration"
    Jeśli wcześniej używałeś pola `tid` do przechowywania europejskich numerów VAT, ustaw `tid` jako `--field` i `VAT UE` jako `--type`.

    ```bash
    bin/command migrate-tax-id-to-ksef --field='tid' --type='VAT UE'
    ```

!!! abstract "Generic Syntax"
    Podczas uruchamiania polecenia w swoim środowisku zastąp zmienne zastępcze konkretnymi parametrami bazy danych:

    ```bash
    bin/command migrate-tax-id-to-ksef --field='<OLD_TAX_ID_FIELD>' --type='<TYPE_OF_TAX_ID>'
    ```

    ---

### `fetch-expenses-from-ksef`

*Dostępne od wersji 1.5.0*

To polecenie planuje zadania w tle pobierające faktury kosztowe z KSeF dla wybranego zakresu dat. Możesz uruchomić je dla jednego konkretnego profilu KSeF albo dla wszystkich aktywnych profili.

#### Omówienie

Polecenie weryfikuje daty wejściowe, a następnie tworzy zadania kolejki (`q1`) przy użyciu `FetchExpensesAfterProfileCreation`.
Jeśli podano `--ksefProfileId`, używany jest tylko ten profil. Jeśli nie, zadania są planowane dla wszystkich aktywnych profili KSeF.

#### Opcje polecenia

| Opcja | Wymagane | Opis | Akceptowane wartości |
| :--- | :---: | :--- | :--- |
| `--from` | Tak | Data początkowa pobierania kosztów. Musi być prawidłową datą. | `YYYY-MM-DD` |
| `--to` | Nie | Data końcowa pobierania kosztów. Jeśli pominięta, używana jest bieżąca data. Po podaniu musi być prawidłową datą. | `YYYY-MM-DD` |
| `--ksefProfileId` | Nie | ID profilu KSeF. Jeśli pominięte, przetwarzane są wszystkie aktywne profile. | Prawidłowe ID profilu |

#### Przykłady użycia

!!! example "Single Profile"
    Zaplanuj pobieranie kosztów dla jednego profilu w określonym zakresie.

    ```bash
    php bin/command fetch-expenses-from-ksef --from="2024-01-01" --to="2026-04-31" --ksefProfileId="profile-id"
    ```

!!! example "All Active Profiles"
    Zaplanuj pobieranie kosztów dla wszystkich aktywnych profili od daty początkowej do dziś.

    ```bash
    php bin/command fetch-expenses-from-ksef --from="2024-01-01"
    ```

!!! abstract "Generic Syntax"
    Zastąp wartości własnymi parametrami.

    ```bash
    php bin/command fetch-expenses-from-ksef --from='<FROM_DATE>' --to='<TO_DATE>' --ksefProfileId='<PROFILE_ID>'
    ```

#### Uwagi

- `--from` jest obowiązkowe.
- Daty muszą mieć format `YYYY-MM-DD` i być poprawnymi datami kalendarzowymi.
- Jeśli nie zostaną znalezione żadne aktywne profile (i nie podano ID profilu), nie zostaną utworzone żadne zadania.
- Zostanie wyświetlone podsumowanie sukcesu z liczbą zaplanowanych profili.

---

### `regenerate-ksef-urls`

*Dostępne od wersji 1.5.0*

To polecenie regeneruje publiczne adresy URL KSeF, naprawiając podwójnie zakodowane linki dla konkretnej encji lub dla partii encji wybranego typu.

#### Omówienie

Polecenie obsługuje encje `Invoice` i `Expense`. Jeśli podano `--entityId`, przetwarzany jest tylko ten rekord. Jeśli go pominięto, polecenie skanuje do 1000 rekordów wybranego typu encji i aktualizuje każdy rekord, którego adres URL KSeF można poprawić.

#### Opcje polecenia

| Opcja | Wymagane | Opis | Akceptowane wartości |
| :--- | :---: | :--- | :--- |
| `--entityType` | Tak | Typ encji do przetworzenia. | `Invoice`, `Expense` |
| `--entityId` | Nie | Konkretne ID encji do przetworzenia. Jeśli pominięte, skanowane są wszystkie pasujące rekordy. | Prawidłowe ID encji |

#### Przykłady użycia

!!! example "Single Entity"
    Regeneruj adres URL KSeF dla jednej faktury.

    ```bash
    php bin/command regenerate-ksef-urls --entityType='Invoice' --entityId='record-id'
    ```

!!! example "Batch Regeneration"
    Regeneruj adresy URL KSeF dla maksymalnie 1000 rekordów kosztów.

    ```bash
    php bin/command regenerate-ksef-urls --entityType='Expense'
    ```

!!! abstract "Generic Syntax"
    Zastąp elementy zastępcze własnymi wartościami.

    ```bash
    php bin/command regenerate-ksef-urls --entityType='<ENTITY_TYPE>' --entityId='<ENTITY_ID>'
    ```

#### Uwagi

- `--entityType` jest obowiązkowe i musi mieć wartość `Invoice` lub `Expense`.
- Jeśli nie podano `--entityId`, polecenie przetwarza do 1000 rekordów dla wybranego typu encji.
- Rekordy bez hasha KSeF lub publicznego adresu URL są pomijane.
- Zaktualizowane encje są zapisywane bez wywoływania hooków.

