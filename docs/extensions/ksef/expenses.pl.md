# Zarządzanie wydatkami

!!! info "W następnej wersji"
    W następnej wersji faktury przychodzące będą zapisywane jako faktury i korekty zakupowe z Sales Pack. Do tego czasu wszystkie faktury przychodzące trafiają do Wydatków, tak jak opisano poniżej.

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

### :material-file-download: Jak pobrać pojedynczą fakturę?

1. Przejdź do encji **Wydatki**.
2. Kliknij `Pobierz fakturę z KSeF`.
3. Wpisz numer KSeF faktury.

### :material-eye: Podgląd faktury

Wydatki pobrane z KSeF mają przycisk `Podgląd KSeF`. Otwiera on fakturę dostawcy w nowej karcie, w czytelnej postaci: sprzedawca, nabywca, pozycje, podsumowanie VAT, płatność, numery umów i zamówień, załączniki i wszystko inne, co dostawca umieścił na fakturze. Użyj **Drukuj** (`Ctrl+P`), aby zapisać ją jako PDF.

Podgląd służy tylko do odczytania faktury. Oryginałem jest faktura w KSeF. Wydatki dodane ręcznie nie mają pliku KSeF, więc przycisku na nich nie ma.

### :material-content-duplicate: Ochrona przed duplikatami

Nie można zapisać wydatku, jeśli inny wydatek od tego samego kontrahenta ma ten sam numer dokumentu. Chroni to przed dwukrotnym wprowadzeniem tej samej faktury – na przykład ręcznie i z KSeF.

### :material-account-group: Domyślny opiekun i zespół

W profilu KSeF możesz wybrać użytkownika i zespół, do których nowe wydatki będą przypisywane automatycznie. Zobacz [Profile KSeF](./profiles.md).

### :material-calendar-today: Jak upewnić się, że masz wszystkie expenses?

Czasami może wystąpić problem z EspoCRM lub połączeniem internetowym. W takiej sytuacji pobieranie wydatków z KSeF może się nie powieść, a standardowe zadanie cron pobiera tylko faktury z ostatnich 10 minut. W tym celu utworzyliśmy dodatkowe zadanie o nazwie **Daily Fetch Of Expenses From KSeF**. Możesz je skonfigurować w [Scheduled Jobs](https://dubas.pro/redirect/#ScheduledJob/create).

## :material-content-duplicate: Wykrywanie duplikatów

Przy ręcznym dodawaniu wydatku EspoCRM sprawdza, czy w bazie nie ma już wydatku o tym samym **numerze** od tego samego dostawcy – na przykład pobranego wcześniej z KSeF. Dostawca jest porównywany po koncie, a także po jego NIP, więc rozpoznany zostanie również dostawca wprowadzony dwukrotnie jako dwa konta z tym samym NIP.

Jeśli zostanie znaleziony pasujący wydatek, standardowe okno duplikatów pokaże istniejące wpisy. Możesz otworzyć jeden z nich albo mimo to zapisać nowy wydatek. Ta sama kontrola działa przy zmianie numeru lub dostawcy istniejącego wydatku oraz przy imporcie wydatków z pliku z opcją pomijania duplikatów.

Dodatkowe pola do sprawdzania można wybrać w ustawieniach sprawdzania duplikatów encji Expense w **Administracja → Menedżer encji**.

## :material-domain: Wydatki dodane ręcznie

Każdy wydatek należy do profilu KSeF – firmy, na którą wystawiono fakturę. Wydatki pobrane z KSeF dostają profil automatycznie i nie można go zmienić. Przy wydatku dodanym ręcznie wybierz profil w polu **Profil KSeF**. Jeśli tylko jeden aktywny profil ma włączone wydatki, zostanie ustawiony automatycznie. Aby przypisać profil wielu istniejącym wydatkom naraz, użyj **Masowej aktualizacji** w widoku listy.

Od profilu zależy, do którego [pakietu dokumentów](./download-documents.md) trafi wydatek. Skan lub PDF faktury dołącz w polu **Załącznik** – pliki z pola **Załączniki** nie trafiają do pakietu.

### Gdy ta sama faktura przyjdzie później z KSeF

Jeśli wydatek o tym samym numerze od tego samego dostawcy (porównywanego po NIP) został dodany ręcznie, a później faktura zostanie pobrana z KSeF, drugi wydatek nie powstanie. Dane z KSeF zostaną dopisane do istniejącego:

* uzupełniany jest numer KSeF, plik XML, link publiczny i profil,
* kwoty, daty i pozycje są zastępowane danymi z KSeF, które są wersją wiążącą,
* nazwa, status, przypisany użytkownik, zespoły, opis i dołączone pliki pozostają bez zmian.

Wydatki ze statusem Odrzucony lub Anulowany nie są uzupełniane – dla faktury z KSeF powstaje osobny wydatek.
