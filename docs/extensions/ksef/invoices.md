# Invoices Management

![KSeF Integration](../../images/ksef-issue-invoice.png "KSeF Integration")

## :material-file-send: How to issue Invoice via KSeF?

!!! warning "Sales Pack required"
    Please keep in mind that feature will not work if you don't have Sales Pack extension.

!!! info "Enable invoices first"
    This feature will only work if you enable invoices in KSeF profile (details above).

!!! danger "Review issued invoice!"
    Please keep in mind that software may contain bugs and mistakes. Check your specific usecase with [test profile](./test-profile.md) before you start using with production KSeF Profile.

1. Go to **Invoices**.
2. Create new Invoice.
3. Choose KSef Profile.
4. After everything is fine, invoice will be scheduled for sending to KSeF.

Unfortunatelly we can't pass invoice to KSeF in few seconds, that's why it's working in background. After invoice will be issued, field KSeF Status will be set to **Completed**.

### :material-book-information-variant: KSeF fields in invoices

- `ksefNumber` - KSeF number assigned to an invoice. Required on issued invoices.
- `ksefStatus` - status of invoice delivery to KSeF.
- `ksefPublicUrl` - public url to status page of invoice in KSeF.
- `ksefProfile` - profile which is used to issue an invoice and pass to KSeF.
- `upoFile` - XML file which confirm delivery to KSeF.
- `xmlFile` - XML file which contains invoice details.

### :material-bank-plus: How to set additional params for invoice?

Go to Layout manager and add proper fields into the detail view:

- Cash Method
- Reverse Charge
- Split Payment Mechanism
- Excemption Type - you can set also `Excemption Description`
- Relevant Period - if you want to specify different date than issuance, choose `Relevant Date` or `Period`. In such scenario, add also additional fields: `Date of Delivery or Service Completion` or/and `Period Start Date` and `Period End Date`

### :material-currency-usd: How to issue invoices in different currencies?

1. Enable additional [currencies in settings](https://dubas.pro/redirect/#Admin/currency)
2. Enter proper [currency rates](https://dubas.pro/redirect/#CurrencyRecord/list/fromSettings=true) for each currency - you can also do it automatically (check out below)
3. While creating new invoice, before adding anything to item list, change currency from PLN to something else

### :material-github: How to automatically update currency rates?

You can download our free extension to keep updated currency rates:
https://github.com/dubas-pro/ext-nbp-exchange-rates/releases
