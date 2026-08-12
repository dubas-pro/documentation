## :material-script-text: Dostępne metody w integracji KSeF

### `util\ksefIssueInvoice`

*Obsługiwane od wersji 1.2.0*

Ta metoda planuje wystawienie faktury za pośrednictwem integracji KSeF. Została zaprojektowana do użycia w formułach, co czyni ją niezbędnym narzędziem do tworzenia i wdrażania zautomatyzowanych procesów fakturowania.

**Parametry**

| Parametr | Opis |
| :--- | :--- |
| `INVOICE_ID` | Unikalny identyfikator faktury, którą chcesz wystawić. Wymagane. |
| `USER_ID` | Identyfikator użytkownika lub konta systemowego autoryzującego wystawienie faktury. Opcjonalne. |

**Zwraca**

Obiekt zawierający następujące właściwości:

| Właściwość | Typ | Opis |
| :--- | :--- | :--- |
| `result` | boolean | Informuje, czy wystawienie faktury zostało pomyślnie zaplanowane. |
| `message` | string \| null | Komunikat statusu lub szczegóły błędu, jeśli dotyczy. |
| `jobId` | string \| null | Identyfikator zadania do śledzenia asynchronicznego procesu wystawiania. |

!!! example "Przykład użycia"
    ```text
    util\ksefIssueInvoice(INVOICE_ID)
    ```
