# Paypal Payments
![Paypal Products](../../images/paypal-payments.png "Paypal Payments")

!!! warning
    This functionality is available from 0.3 version.

Paypal Payments are used in conjunction with Paypal Invoices and Paypal Transactions at this time. Paypal Paymant module does not require any action from your side at the moment. All you need to do is use `CHECKOUT.ORDER.APPROVED` or `INVOICING.INVOICE.PAID` webhooks. Thanks to that, when your client pay for invoice or transaction, EspoCRM will automatically retrieve the related payment information and place it in the Paypal Payments entity. 

In the future we also plan to add support for the Payments, Payouts and Refunds module.

If you want to configure webhook, check [How to create your first Paypal Webhook](webhooks.md#how-to-create-your-first-paypal-webhooks) tutorial.