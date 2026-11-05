# Purchase Documents

!!! info "New in 3.0.0"
    Starting with version 3.0.0, incoming invoices from KSeF are stored as Sales Pack **Supplier Bills** and **Bill Credits** instead of Expenses. This gives you payments, allocations and supplier balances out of the box. If you used Expenses before, see the [migration guide](./migration-3.md).

## :material-file-download: How incoming documents are stored

Every document fetched from KSeF is sorted automatically:

| Document in KSeF | Record in EspoCRM |
|---|---|
| Invoice (VAT, advance, settlement, simplified) | Supplier Bill |
| Correction decreasing the amount (return, discount) | Bill Credit |
| Correction increasing the amount | Supplier Bill |
| Zero-value correction (e.g. address change) | Bill Credit with zero amount |

A Bill Credit is linked to the corrected Supplier Bill (field **Bill**) when that bill already exists in EspoCRM. You can see all corrections of an invoice in the **Bill Credits** panel of the Supplier Bill.

Each document gets:

- items with tax codes and VAT calculated by Sales Pack,
- the supplier (see [Suppliers](#suppliers)),
- the original XML file, KSeF number and public KSeF link,
- supplier bank accounts and a payment QR code,
- status **Draft** – review the document and change its status to **Issued** when it is approved.

## :material-cog: Configuration

Open the KSeF profile and go to the **Incoming** tab:

- **Fetch incoming invoices** – enables automatic fetching for this profile.
- **Fetch since** – the earliest date used on the first run.
- **Create accounts for new suppliers** – when a supplier is not found, an Account is created together with the Supplier. When disabled, only the Supplier is created.
- **Incoming invoices owner** and **Default team** – assigned to every imported document.
- **Notify about new invoices** – the owner receives one notification after each fetch with the number of new documents.
- **Fetched until** – read only. Shows how far invoices have been fetched.

## :material-sync: How fetching works

Since 3.0.0 fetching is incremental. Each run continues from the moment the previous run finished, based on the date the invoice was **received by KSeF** (not the issue date). This means:

- invoices issued earlier but sent to KSeF later (e.g. in offline mode) are not missed,
- a missed or failed cron run does not create gaps,
- one faulty invoice does not stop the others. It is skipped, logged, and the owner receives a notification with the KSeF number and the reason.

To fetch manually, open **Supplier Bills** and click **Fetch Invoices From KSeF**. The date range in this dialog refers to the date the invoice was received by KSeF. To download a single document, use **Download Invoice From KSeF** and enter its KSeF number.

!!!warning "Be careful!"
    Do not fetch manually too often, as you may hit KSeF limits and get temporarily blocked.

## :material-account-tie: Suppliers

Suppliers are matched by tax ID (NIP):

1. An existing Supplier with the same tax ID is used.
2. Otherwise an Account with the same tax ID is looked up and its Supplier is used or created.
3. Otherwise a new Supplier is created – together with an Account if **Create accounts for new suppliers** is enabled.

## :material-content-duplicate: Duplicate protection

A Supplier Bill (or Bill Credit) cannot be saved when another document from the same supplier has the same number. The comparison ignores spaces and letter case, so `FV 1/2026` and `fv1/2026` are treated as the same number. Canceled documents are ignored.

If you entered an invoice manually and it later arrives from KSeF, no duplicate is created. The integration adds the KSeF number, XML file and bank accounts to your existing record.

## :material-cash-check: Payments and settlement

Pay Supplier Bills with an outbound payment allocated to the bill. When the allocations cover the whole amount, the status changes automatically:

| Document | Fully settled | Allocation removed |
|---|---|---|
| Invoice, Supplier Bill | Paid | back to Issued |
| Credit Note, Bill Credit | Resolved | back to Issued |

Only documents with status **Issued** are changed automatically. Drafts and canceled documents are not touched.

A Bill Credit is settled in one of two ways:

- **the bill is not paid yet** – allocate the Bill Credit to the Supplier Bill, then pay the remaining amount,
- **the bill was already paid** – register the refund from the supplier as an inbound payment and allocate it to the Bill Credit.

## :material-tag: Expense categories

Supplier Bills have an **Expense Category** field: Invoice, Receipt, Tax, Social Security, Other. Use it for documents that are not invoices, such as social security contributions (ZUS) or tax payments:

1. Create a supplier, e.g. "Zakład Ubezpieczeń Społecznych" or "Urząd Skarbowy".
2. Create a Supplier Bill with the declaration number as reference (e.g. `DRA 10/2026`).
3. Use the **Poza VAT** tax code so the document does not affect VAT reports.
4. Pay it like any other bill.

## :material-file-question: Pro forma invoices

A pro forma is not an invoice and is not sent to KSeF, so it should not be entered as a Supplier Bill:

- **pro forma received** – create a Purchase Order and attach the pro forma PDF. Register your payment to the supplier without allocation, and allocate it once the real invoice arrives from KSeF.
- **pro forma issued** – use a Quote or Sales Order with a pro forma PDF template. After receiving the payment, issue an advance or final invoice and allocate the payment to it.

## Related articles

* [Credit notes in KSeF](./credit-notes.md)
* [Migrating from Expenses](./migration-3.md)
