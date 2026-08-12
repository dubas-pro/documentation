# :material-download-box: Zarządzanie kontami w KSeF

KSeF obsługuje różne identyfikatory podatkowe, w tym NIP, VIES, lokalny lub brak identyfikatora. Aby dostosować się do wymagań KSeF, wprowadzono dedykowane pole `taxId`. Po dodaniu go do widoku Konta pole to umożliwia określenie typu identyfikatora podatkowego oraz wpisanie jego wartości.

## Automatyczne dopasowywanie i tworzenie kont

Gdy KSeF przesyła nową fakturę do EspoCRM, system automatycznie sprawdza widok Konta, aby znaleźć pasującego klienta na podstawie identyfikatora podatkowego z pola `taxId`. Jeśli nie zostanie znalezione pasujące konto, system sprawdza ustawienia profilu KSeF, aby ustalić, czy włączono automatyczne tworzenie kont. Jeśli tak, nowe konto zostaje utworzone automatycznie; w przeciwnym razie faktura jest przetwarzana bez tworzenia nowego konta.

Podczas wystawiania faktur w EspoCRM system wykorzystuje pole `taxId` do prawidłowego wskazania identyfikatora podatkowego podczas transmisji do KSeF. Upewnij się, że CRM jest poprawnie skonfigurowany i uzupełnia to pole właściwym identyfikatorem podatkowym, aby zapewnić poprawne przesyłanie dokumentów.

## Dodawanie pola taxId do widoku Konta

Aby dodać pole `taxId` do widoku Konta, wykonaj następujące kroki:

1. Przejdź do sekcji **Administracja** w EspoCRM
2. Przewiń do **Menedżera układu** i otwórz go
3. Wybierz moduł **Konto**
4. Dodaj pole `taxId` do widoku szczegółów

Spowoduje to włączenie opisanej powyżej funkcjonalności identyfikatora podatkowego dla Twoich kont.

!!! example "Jak migrować identyfikator podatkowy z innego pola?"
    Pracujemy nad skryptem, który skopiuje numer podatkowy z innego pola do `taxId`.

Możesz skorzystać z [polecenia konsoli do migracji wartości ze starego pola identyfikatora podatkowego](./console-commands.md).

## Dodatkowe pola

Jeśli chcesz używać któregokolwiek z poniższych pól, dodaj je do widoku szczegółów za pomocą [Menedżera układu](https://dubas.pro/redirect/#Admin/layouts/scope=Account&type=detail).

- `Entity is a member of VAT group` - Określa, czy podmiot należy do grupy VAT. Ustaw tę wartość na `true`, gdy podmiot jest zarejestrowany jako część grupy VAT na potrzeby raportowania podatkowego. Domyślnie `false`.
