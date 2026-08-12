# Zarządzanie wydatkami

W ramach integracji z KSeF utworzono nową encję o nazwie `Expenses`. Wszystkie przychodzące faktury są pobierane i automatycznie dodawane do encji Expenses. Możesz też używać jej ręcznie do zarządzania dokumentami przychodzącymi, które nie są obsługiwane przez KSeF.

## :material-file-send: Jak tworzone są Expenses?

### Z KSeF

Jeśli zadania cron są skonfigurowane poprawnie, wydatki powinny być pobierane automatycznie.

Możesz też skonfigurować [codzienne ponowne pobieranie](#how-to-make-sure-that-you-have-all-expenses).

### Ręcznie

Możesz również wprowadzać wydatki ręcznie w EspoCRM.

1. Przejdź do Expenses.
2. Kliknij Create.
3. Wypełnij formularz.
4. Zapisz.

### :material-book-information-variant: Pola KSeF w expenses

- `ksefNumber` - numer KSeF przypisany do faktury. Wymagany dla wystawionych faktur.
- `ksefStatus` - status dostarczenia faktury do KSeF.
- `ksefPublicUrl` - publiczny adres URL strony statusu faktury w KSeF.
- `ksefProfile` - profil używany do wystawienia faktury i wysłania jej do KSeF.
- `xmlFile` - plik XML zawierający szczegóły faktury.

### :material-file-search: Jak ręcznie pobrać expenses z KSeF?

1. Przejdź do encji **Expenses**.
2. W widoku listy kliknij przycisk `Fetch expenses from KSeF`.
3. Wybierz okres, z którego chcesz pobrać wydatki.

!!!warning "Uwaga!"
    Nie używaj tego zbyt często, ponieważ możesz osiągnąć limity KSeF i zostać tymczasowo zablokowany.

### :material-calendar-today: Jak upewnić się, że masz wszystkie expenses?

Czasami może wystąpić problem z EspoCRM lub połączeniem internetowym. W takiej sytuacji pobieranie wydatków z KSeF może się nie powieść, a standardowe zadanie cron pobiera tylko faktury z ostatnich 10 minut. W tym celu utworzyliśmy dodatkowe zadanie o nazwie **Daily Fetch Of Expenses From KSeF**. Możesz je skonfigurować w [Scheduled Jobs](https://dubas.pro/redirect/#ScheduledJob/create).
