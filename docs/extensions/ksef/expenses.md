# Expenses Management

!!! info "Coming in the next version"
    In the next version incoming invoices will be stored as Sales Pack Supplier Bills and Bill Credits. Until then, all incoming invoices are stored as Expenses, as described below.

For KSeF integration, a new entity called `Expenses` has been created. All incoming invoices are fetched and automatically added to the Expenses entity. You can also use it manually to manage incoming documents that are not handled by KSeF.

## :material-file-send: How Expenses are created?

### From KSeF

If your cron jobs are configured correctly, expenses should be fetched automatically.

You can also configure [daily re-fetching](#how-to-make-sure-that-you-have-all-expenses).

### Manually

You can also enter expenses manually in EspoCRM.

1. Go to Expenses.
2. Click on Create.
3. Fill the form.
4. Save.

### :material-book-information-variant: KSeF fields in expenses

- `ksefNumber` - KSeF number assigned to an invoice. Required on issued invoices.
- `ksefStatus` - status of invoice delivery to KSeF.
- `ksefPublicUrl` - public URL of the invoice status page in KSeF.
- `ksefProfile` - profile used to issue an invoice and send it to KSeF.
- `xmlFile` - XML file containing invoice details.

### :material-file-search: How to fetch expenses manually from KSeF?

1. Go to **Expenses** entity.
2. In the list view, click the `Fetch expenses from KSeF` button.
3. Choose period from which you want to fetch expenses.

!!!warning "Be careful!"
    Do not use this too often, as you may hit KSeF limits and get temporarily blocked.

### :material-file-download: How to download a single invoice?

1. Go to **Expenses** entity.
2. Click on `Download Invoice From KSeF`.
3. Enter the KSeF number of the invoice.

### :material-eye: Invoice preview

Expenses downloaded from KSeF have a `KSeF Preview` button. It opens the supplier's invoice in a new tab, in a readable form: seller, buyer, items, VAT summary, payment, contract and order numbers, attachments and everything else the supplier put in the invoice. Use **Print** (`Ctrl+P`) to save it as PDF.

The preview only helps you read the invoice. The original is the invoice in KSeF. Expenses created manually have no KSeF file, so the button is not shown.

### :material-content-duplicate: Duplicate protection

An expense cannot be saved when another expense from the same account has the same document number. This protects you from entering the same invoice twice – for example manually and from KSeF.

### :material-account-group: Default owner and team

In the KSeF Profile you can choose the user and the team to which new expenses are assigned automatically. See [KSeF Profiles](./profiles.md).

### :material-calendar-today: How to make sure that you have all expenses?

Sometimes there may be an issue with EspoCRM or your internet connection. Because of this, fetching expenses from KSeF may fail, and the standard cron job only fetches invoices from the last 10 minutes. For this purpose, we created another job called **Daily Fetch Of Expenses From KSeF**. You can configure it in [Scheduled Jobs](https://dubas.pro/redirect/#ScheduledJob/create).

## :material-content-duplicate: Duplicate detection

When you add an expense manually, EspoCRM checks whether an expense with the same **Number** from the same supplier already exists – for example one that was already fetched from KSeF. The supplier is matched by the account, and also by its tax ID, so a supplier entered twice as two accounts with the same NIP is still recognised.

If a match is found, the standard duplicate window lists the existing expenses. You can open one of them or save the new expense anyway. The same check runs when you change the number or supplier of an existing expense, and when you import expenses from a file with the option to skip duplicates.

Additional fields for the check can be selected in the duplicate check settings of the Expense entity in **Administration → Entity Manager**.

## :material-domain: Manually added expenses

Each expense belongs to a KSeF profile – the company it was issued to. Expenses fetched from KSeF get the profile automatically and it cannot be changed. For an expense added manually, choose the profile in the **KSeF Profile** field. When only one active profile has expenses enabled, it is set automatically. To assign a profile to many existing expenses at once, use **Mass Update** in the list view.

The profile decides which [document package](./download-documents.md) the expense goes to. Attach the invoice scan or PDF in the **File** field – files in **Attachments** are not added to the package.

### When the same invoice later arrives from KSeF

If an expense with the same number from the same supplier (matched by NIP) was added manually and later the invoice is fetched from KSeF, no second expense is created. The KSeF data is added to the existing one:

* the KSeF number, the XML file, the public link and the profile are filled in,
* amounts, dates and items are replaced with the data from KSeF, which is the legally binding version,
* the name, status, assigned user, teams, description and attached files stay as they were.

Expenses with the status Rejected or Canceled are not completed this way – a separate expense is created for the KSeF invoice.
