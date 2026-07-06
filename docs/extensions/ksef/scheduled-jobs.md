## :material-book-clock-outline: Available Scheduled Jobs

This section details the scheduled jobs (cron jobs) provided by the KSeF Integration to help you manage and maintain your system data.

---

## Scheduled Jobs Configuration

The KSeF Integration provides the following scheduled jobs that can be configured in your system:

### `GetInvoicesFromKsef`

This job gathers all active KSeF profiles and schedules fetching expenses for each one of them. It runs periodically to keep your invoice data synchronized with the KSeF system.

### `DailyFetchOfExpenses`

This job performs daily fetching of expenses from KSeF, ensuring your expense records are regularly updated from the KSeF service.

---

## Background Jobs

The KSeF Integration uses background jobs for processing various operations:

### `MonitorJob`

After an invoice is issued, this job monitors whether the issuance was successful or if it became stuck. If the issuance is stuck, it will automatically cancel the operation and allow the user to issue the invoice again.

### `CreateInvoiceInKsef`

This job creates an invoice via cron after a user clicks "Issue via KSeF". It handles the asynchronous processing of invoice creation in the KSeF system.

### `FetchExpensesAfterProfileCreation`

This job allows users to fetch invoices while a KSeF Profile is being created, based on the `fetchSince` parameter. It enables immediate synchronization of historical expense data during profile initialization.

### `GeneratePackageWithDocuments`

After a user clicks "Export Invoices" in a KSeF Profile, this job handles gathering and packaging documents. It notifies the user upon completion of the export process.

### `GetInvoicesFromKsef`

This job gathers all active profiles and schedules fetching expenses for each one of them, ensuring comprehensive invoice synchronization across all profiles.

### `GetInvoicesFromSingleKsefProfile`

This job fetches invoices from a specific single KSeF profile, allowing targeted synchronization when needed.
