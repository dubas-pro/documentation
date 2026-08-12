# :material-tools: Dodatkowe parametry w pliku Config

## Jak ustawić nowy parametr Config?

1. Połącz się przez SSH/FTP
2. Otwórz katalog EspoCRM
3. Przejdź do folderu `data`
4. Otwórz plik `Config.php` ([Sprawdź pliki konfiguracyjne](https://docs.espocrm.com/administration/config-params/#config-files))
5. Dodaj dowolny z poniższych parametrów z odpowiednią wartością
6. Zapisz plik i zamknij go
7. Wyczyść pamięć podręczną i przebuduj aplikację

## Dostępne parametry

### Wartość statusu wystawionej faktury

**Klucz konfiguracji:** `ksefInvoiceIssuedStatusValue`

**Opis:** Określa niestandardową etykietę statusu przypisywaną do faktur po ich pomyślnym wystawieniu w systemie KSeF.

**Typ:** String

**Wartość domyślna:** `'Issued'`

**Zastosowanie:** Ten parametr pozwala dostosować tekst statusu reprezentującego stan wystawionej faktury. Jeśli nie zostanie skonfigurowany, system użyje domyślnej wartości "Issued". Możesz ją zmienić, aby dopasować do wymagań biznesowych lub potrzeb lokalizacyjnych.

!!! example "Example Configuration"
    `'ksefInvoiceIssuedStatusValue' => 'Sent'`

### Niestandardowe pole numeru konta

**Klucz konfiguracji:** `ksefAccountNumberField`

**Opis:** Określa, które pole Konta powinno być używane jako numer klienta (`NrKlienta`) na fakturach KSeF.

**Typ:** String

**Wartość domyślna:** `null` (nie ustawiono)

**Zastosowanie:** Ustaw ten parametr na nazwę niestandardowego pola Konta, które przechowuje numer klienta. Wartość jest używana tylko wtedy, gdy:

- skonfigurowane pole istnieje i zawiera wartość typu string,
- `additionalInvoiceInformation` jest włączone w profilu KSeF,
- oraz zawiera `Client number`.

Jeśli nie zostanie skonfigurowane (lub warunki nie zostaną spełnione), numer klienta nie zostanie dodany do payloadu faktury.

!!! example "Example Configuration"
    `'ksefAccountNumberField' => 'customClientNumber'`

### Niestandardowe pole numeru szansy sprzedaży

**Klucz konfiguracji:** `ksefOpportunityNumberField`

**Opis:** Określa, które pole Szansy sprzedaży powinno być używane jako numer szansy na fakturach KSeF.

**Typ:** String

**Wartość domyślna:** `null` (nie ustawiono)

**Zastosowanie:** Ustaw ten parametr na nazwę niestandardowego pola Szansy sprzedaży, które przechowuje numer szansy. Wartość jest używana tylko wtedy, gdy:

- skonfigurowane pole istnieje w powiązanym rekordzie Szansy sprzedaży,
- oraz pole zawiera wartość typu string.

Jeśli nie zostanie skonfigurowane (lub warunki nie zostaną spełnione), numer szansy nie zostanie dodany do payloadu faktury.

!!! example "Example Configuration"
    `'ksefOpportunityNumberField' => 'customOpportunityNumber'`
