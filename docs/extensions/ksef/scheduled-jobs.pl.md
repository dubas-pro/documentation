## :material-book-clock-outline: Dostępne zadania harmonogramu

Ta sekcja opisuje zadania harmonogramu (zadania cron) dostarczane przez integrację KSeF, aby pomóc w zarządzaniu i utrzymaniu danych systemowych.

---

## Konfiguracja zadań harmonogramu

Integracja KSeF udostępnia następujące zadania harmonogramu, które można skonfigurować w systemie:

### `GetInvoicesFromKsef`

To zadanie zbiera wszystkie aktywne profile KSeF i planuje pobieranie wydatków dla każdego z nich. Uruchamiane jest okresowo, aby utrzymywać dane faktur zsynchronizowane z systemem KSeF.

### `DailyFetchOfExpenses`

To zadanie codziennie pobiera wydatki z KSeF, zapewniając regularną aktualizację rekordów wydatków z usługi KSeF.

---

## Zadania w tle

Integracja KSeF wykorzystuje zadania w tle do przetwarzania różnych operacji:

### `MonitorJob`

Po wystawieniu faktury to zadanie monitoruje, czy wystawienie zakończyło się sukcesem, czy też utknęło. Jeśli wystawienie utknie, automatycznie anuluje operację i pozwala użytkownikowi ponownie wystawić fakturę.

### `CreateInvoiceInKsef`

To zadanie tworzy fakturę przez cron po kliknięciu przez użytkownika opcji „Wystaw przez KSeF”. Obsługuje asynchroniczne przetwarzanie tworzenia faktury w systemie KSeF.

### `FetchExpensesAfterProfileCreation`

To zadanie umożliwia pobieranie faktur podczas tworzenia profilu KSeF, na podstawie parametru `fetchSince`. Umożliwia natychmiastową synchronizację historycznych danych wydatków podczas inicjalizacji profilu.

### `GeneratePackageWithDocuments`

Po kliknięciu przez użytkownika opcji „Eksportuj faktury” w profilu KSeF to zadanie odpowiada za zebranie i spakowanie dokumentów. Powiadamia użytkownika po zakończeniu procesu eksportu.

### `GetInvoicesFromKsef`

To zadanie zbiera wszystkie aktywne profile i planuje pobieranie wydatków dla każdego z nich, zapewniając pełną synchronizację faktur we wszystkich profilach.

### `GetInvoicesFromSingleKsefProfile`

To zadanie pobiera faktury z pojedynczego, określonego profilu KSeF, umożliwiając w razie potrzeby synchronizację celowaną.
