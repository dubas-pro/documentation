# Expenses Management

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

### :material-calendar-today: How to make sure that you have all expenses?

Sometimes there may be an issue with EspoCRM or your internet connection. Because of this, fetching expenses from KSeF may fail, and the standard cron job only fetches invoices from the last 10 minutes. For this purpose, we created another job called **Daily Fetch Of Expenses From KSeF**. You can configure it in [Scheduled Jobs](https://dubas.pro/redirect/#ScheduledJob/create).
