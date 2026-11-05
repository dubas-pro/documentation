# Credit Notes in KSeF

!!! info "New in 3.0.0"
    Starting with version 3.0.0, Sales Pack Credit Notes can be issued to KSeF as correcting invoices (KOR).

## :material-calculator-variant: How corrections are sent

Corrections are sent using the **difference method**: every item of the credit note becomes one row in KSeF containing only the change, with a minus sign.

Example – an invoice for 3 monitors, the customer returns 1:

| | In EspoCRM (Credit Note) | Sent to KSeF |
|---|---|---|
| Quantity | 1 | -1 |
| Net | 100.00 | -100.00 |
| VAT 23% | 23.00 | -23.00 |
| Total | 123.00 | -123.00 |

Enter positive values in the credit note. The integration adds the minus sign automatically. VAT summaries are calculated per tax rate from the credit note items.

## :material-file-send: How to issue a correction

1. Open the invoice and create a Credit Note from it, or create a Credit Note and select the **Invoice** being corrected.
2. The KSeF profile is copied from the invoice automatically.
3. Keep only the items that change and enter the credited quantity or amount.
4. Fill in the **Reason** for the correction.
5. Click `Issue via KSeF`.

The corrected invoice must already have a KSeF number.

## :material-shield-check: Validation

Before saving and before sending, the integration checks that corrections do not exceed the invoice:

- each item must exist on the corrected invoice,
- the total credited amount of an item cannot exceed its invoiced amount,
- for returns (same unit price as on the invoice), the credited quantity cannot exceed the invoiced quantity,
- all previous credit notes of the invoice are included, except canceled ones.

Example: after a price reduction of 81.30 on an invoice for 10 × 100.00, a full return of 10 × 100.00 is rejected, because the remaining value is 918.70.

## :material-file-multiple: Several corrections to one invoice

Each correction is independent and always refers to the original invoice. You can issue as many credit notes as needed within the limits described above.

## :material-file-edit: Corrections without item changes

If only invoice data changes (e.g. the buyer's address), clear the **Items** option in the **Changes** field and leave the credit note without items. The correction is sent with a total of 0.00.

!!! warning "Wrong tax ID"
    A wrong buyer tax ID cannot be fixed with a correction. Issue a correction to zero and a new invoice to the correct buyer.

## :material-cash-refund: Settlement after a correction

- **The invoice is not paid** – allocate the Credit Note to the Invoice, then the customer pays the remaining amount.
- **The invoice is already paid** – create an outbound payment (refund) and allocate it to the Credit Note.

The statuses change automatically to **Paid** / **Resolved** when the documents are fully settled.

## :material-alert-outline: Limitations

- Corrections increasing the amount (Debit Notes) are not sent to KSeF yet.
- Summary corrections for a period (e.g. yearly discounts) are not supported. One credit note corrects one invoice.
- Invoices issued outside KSeF (without a KSeF number) cannot be corrected through KSeF yet.
- Corrections of buyer data are sent without the "before" data section (Podmiot2K).
