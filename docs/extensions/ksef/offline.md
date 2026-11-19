# :material-wifi-off: Offline mode

Sometimes KSeF is not available – the Ministry's servers may be down or your internet connection may fail. So that you can still issue invoices, the law allows the **offline24 mode**: the invoice is issued immediately and sent to KSeF later, no later than the next business day.

## :material-certificate: What you need

Offline mode works only when your KSeF Profile has an active **Offline certificate**. See [Authorization](./authorization.md) for how to get one and add it to the profile.

Without the certificate, an invoice that cannot reach KSeF ends with the **Error during Transmission** status and you have to send it again later.

## :material-file-send: What happens when KSeF is unavailable

1. You click `Issue via KSeF` as usual.
2. The integration cannot connect to KSeF, so it issues the invoice in offline mode.
3. The invoice gets the status **Pending for offline delivery** and two QR codes – the second one confirms the invoice in offline mode.
4. You receive a notification with the deadline for sending the invoice to KSeF.
5. You can already send the invoice to your customer. Remember to put **both** QR codes on the PDF – see [Invoices](./invoices.md#how-to-properly-label-pdf-invoice).

The same applies to credit notes.

!!! info "Wrong token or certificate is not an outage"
    If KSeF rejects your token or authorization certificate, the invoice is **not** issued offline. You will see an error instead – check the KSeF Profile settings and try again.

## :material-sync: Sending to KSeF later

The integration sends offline invoices to KSeF automatically every 15 minutes, as soon as KSeF is available again. You do not have to do anything.

- When the invoice is accepted, it gets its KSeF number, the status changes to **Completed** and you receive a notification.
- When the deadline is today or has already passed and the invoice is still waiting, you receive a reminder once a day.
- If KSeF rejects the invoice, the status changes to **Rejected by KSeF** and you receive a notification with the reason. Such an invoice needs your attention – [contact us](https://dubas.pro/form/contact) if you are not sure what to do.

!!! warning "Scheduled job required"
    Automatic sending uses the scheduled job **Send offline24 documents to KSeF**. It is created automatically when the extension is installed. Check in **Administration → Scheduled Jobs** that it exists and is **Active**.

## :material-calendar-clock: Deadline

An offline invoice must reach KSeF **no later than the next business day** after its issue date. Weekends and public holidays are not counted. The deadline is shown on the invoice in the **KSeF Offline Delivery Deadline** field.
