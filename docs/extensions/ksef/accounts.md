# :material-download-box: Accounts management in KSeF

KSeF supports various tax identifiers, including NIP, VIES, local, or none. To accommodate KSeF requirements, a dedicated field called `taxId` was introduced. When added to the Accounts view, this field allows you to specify the type of tax identifier and enter the identifier value itself.

## Automatic account matching and creation

When KSeF sends a new invoice to EspoCRM, the system automatically checks the Accounts view to find a matching customer based on the tax identifier from the `taxId` field. If no matching account is found, the system checks the KSeF Profile settings to see if automatic account creation is enabled. If enabled, a new account is created automatically; otherwise, the invoice is processed without creating a new account.

When creating invoices in EspoCRM, the system uses the `taxId` field to identify the correct tax identifier during transmission to KSeF. Make sure your CRM is properly configured to populate this field with the appropriate tax identifier for accurate document submission.

## Adding the taxId field to the Accounts view

To add the `taxId` field to your Accounts view, follow these steps:

1. Navigate to the **Administration** section in EspoCRM
2. Scroll down to **Layout Manager** and open it
3. Select the **Account** module
4. Add the `taxId` field to the detail view

This will enable the tax identifier functionality described above for your accounts.

!!! example "How we migrate tax id's from different field?"
    We're working on some script which will copy from other field tax number to `taxId`.
