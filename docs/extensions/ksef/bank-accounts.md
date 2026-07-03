# :material-download-box: Bank accounts management in KSeF

This section covers the bank account entity introduced for managing financial operations in the CRM. The entity is fully integrated into EspoCRM and supports bank account data used in KSeF workflows.

## Bank account entity

Each bank account can store the following details:

- IBAN number
- SWIFT code
- bank name
- bank account name
- operation type

The operation type defines whether the bank account is used for inbound operations, such as expenses, or outbound operations, such as invoices.

## Linking bank accounts

Bank accounts can be linked to:

- Accounts
- Expenses
- Invoices
- KSeF Profiles

Multiple bank accounts can be linked to an account, allowing flexible use based on user needs.

If a profile is selected on an invoice, the system fetches the linked bank accounts according to the rules defined in that profile. The system can also use bank accounts linked directly to the account.

## Automatic processing

When new expenses are fetched from the government system, they are processed automatically and the corresponding bank accounts are linked or created if couldn't find already existing.

This keeps the financial data synchronized in the CRM and makes the bank accounts available without manual creation.

## Using bank accounts in invoices

When creating invoices, the system can automatically resolve the correct bank account from the selected profile or from the linked account. This streamlines financial operations and ensures consistent use of bank account data.
