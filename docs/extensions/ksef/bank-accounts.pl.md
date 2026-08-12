# :material-download-box: Zarządzanie rachunkami bankowymi w KSeF

Ta sekcja opisuje encję rachunku bankowego wprowadzoną do zarządzania operacjami finansowymi w CRM. Encja jest w pełni zintegrowana z EspoCRM i obsługuje dane rachunków bankowych wykorzystywane w przepływach KSeF.

!!! example "Przekierowanie"
    [Otwórz Rachunek Bankowy w swoim EspoCRM](https://dubas.pro/redirect/#KsefBankAccount)

## Encja rachunku bankowego

Każdy rachunek bankowy może przechowywać następujące dane:

- numer IBAN
- kod SWIFT
- nazwa banku
- nazwa rachunku bankowego
- typ operacji

Typ operacji określa, czy rachunek bankowy jest używany do operacji przychodowych (np. wydatki), czy rozchodowych (np. faktury).

## Powiązania rachunków bankowych

Rachunki bankowe można powiązać z:

- Kontaktami (Accounts)
- Wydatkami (Expenses)
- Fakturami (Invoices)
- Profilami KSeF

Do jednego konta (Account) można podpiąć wiele rachunków bankowych, co zapewnia elastyczność w użyciu w zależności od potrzeb użytkownika.

Jeśli na fakturze wybrano profil, system pobiera powiązane rachunki bankowe zgodnie z regułami zdefiniowanymi w tym profilu. System może również użyć rachunków powiązanych bezpośrednio z kontem.

## Automatyczne przetwarzanie

Gdy z systemu rządowego pobierane są nowe wydatki, są one automatycznie przetwarzane, a odpowiadające im rachunki bankowe są powiązywane lub tworzone, jeśli nie znaleziono istniejących.

Dzięki temu dane finansowe w CRM są zsynchronizowane, a rachunki bankowe dostępne bez ręcznego tworzenia.

## Użycie rachunków bankowych na fakturach

Podczas tworzenia faktur system może automatycznie wybrać odpowiedni rachunek bankowy z wybranego profilu lub z rachunków powiązanych z kontem. Ułatwia to operacje finansowe i zapewnia spójne wykorzystanie danych rachunków bankowych.
