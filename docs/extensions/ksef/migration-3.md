# Migrating from Expenses (3.0.0)

!!! info "Applies to 3.0.0"
    Version 3.0.0 replaces Expenses with Sales Pack Supplier Bills and Bill Credits for incoming documents. Existing Expenses are not deleted – they are copied, and each Expense keeps a link to the document it was migrated to.

## :material-clipboard-check: Before you start

1. **Make a database backup.**
2. Run the migration on a copy of your instance first.
3. Make sure Sales Pack **4.x** is installed.
4. Set a **default payment method** in each KSeF profile (used for Expenses with status Paid).
5. Run **Rebuild** and **Clear Cache** after installing version 3.0.0.

## :material-console: Running the migration

Run the commands from the EspoCRM root directory:

```bash
php command.php migrate-expenses-to-supplier-bills --dry-run --limit=20
php command.php migrate-expenses-to-supplier-bills --dry-run
php command.php migrate-expenses-to-supplier-bills
```

| Option | Description |
|---|---|
| `--dry-run` | Processes every record and reports the result, but saves nothing. |
| `--limit=N` | Processes only N records. |
| `--payment-method=ID` | Payment method for Expenses with status Paid, if it cannot be determined automatically. |

The command can be run multiple times. Already migrated Expenses are skipped.

## :material-swap-horizontal: What is migrated

Expenses downloaded from KSeF are rebuilt from their original XML file, which also corrects data saved by earlier versions. Other Expenses are copied with their items.

| Expense type | Result |
|---|---|
| Invoice, Receipt | Supplier Bill |
| Correction decreasing the amount | Bill Credit |
| Correction increasing the amount | Supplier Bill |
| Taxes, Mandatory Insurance, Other | Supplier Bill with the matching Expense Category |
| Order | not migrated |

| Expense status | New status |
|---|---|
| Draft, Pending, In Review | Draft |
| Confirmed, Booked | Issued |
| Paid | Paid, with a payment and allocation |
| Rejected, Canceled | Canceled |

Expenses without an account (e.g. taxes or social security) are assigned to collective suppliers: "Urząd Skarbowy", "Zakład Ubezpieczeń Społecznych" or "Inne zobowiązania", with the **Poza VAT** tax code.

## :material-file-search: Reading the report

| Message | Meaning |
|---|---|
| `skipped: Expense has no account and no KSeF XML` | The Expense has no supplier – complete it and run the migration again. |
| `grand total … differs from source …` | The new total differs from the source document. Review the record. |
| `no items created` | Items could not be created – report it to us. |
| `payment: No payment method found` | Set a default payment method in the KSeF profile or use `--payment-method`. |

## :material-check-all: After the migration

- Check a few migrated documents: items, VAT, totals and payment status.
- Each Expense shows the migrated document in the **Supplier Bill** or **Bill Credit** field.
- New incoming invoices are fetched to Supplier Bills automatically.
