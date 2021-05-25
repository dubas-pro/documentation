# Paypal Invoices
![Paypal Invoices](../../images/paypal-invoices.png "Paypal Invoices")

It’s possible that you’ll have to enable Paypal Invoice entity in your Paypal integration settings. 
## How to create your first Paypal Invoice?
1.	Go to **Paypal Invoices**.
2.	Fill mandatory fields. You can read more about fields below in section **Explanation of fields**.
3.	Save with **Draft** status to fetch all information from invoice.
4.	Change status to **Register in Paypal** and save. 
5.	After status of your invoice change to **Registered in Paypal**, send your customer URL for recipient.
## Explanation of fields
1.	**Invoice** – link to invoice from SalesPack.
2.	**Number** – unique numer of invoice. Can’t create two invoices with same number.
3.	**Reference** - the reference data.
4.	**Date of Invoice** – date when invoice should be issued.
5.	**Due Date** – due date of invoice.
6.	**Paypal Id** – id assigned by Paypal.
7.	**Direct URL** – URL for api actions.
8.	**Invoicer view URL** – URL for invoicer.
9.	**Recipient view URL** – URL for recipient.
10.	**Note to invoice recipient** – note to the invoice recipient. Also appears on the invoice notification email.
11.	**Private memo** – private bookkeeping memo for the user.
12.	**Terms and conditions** – terms for specific invoice.
13.	**Currency** – currency of invoice.
14.	**Allow Tip** – allow customer to send a tip.
15.	**Allow partial payment** – allow customer to pay in rates.
16.	**Account** – link to specific account.
17.	**Invoice Items** – linked items from invoice.
18.	**Status** – check available statuses below.
19.	**Amount** – amount of invoice.
20.	**Tax calculated** after discount
21.	**Unit price includes tax**
22.	**Minimum partial payment** – minimal amount.
## Clarification of statuses
1.	**Draft** – EspoCRM will not send any information to Paypal on this stage. Great option to prepare invoices for the future.
2.	**Register in Paypal** – EspoCRM at this stage will send all information to Paypal.
3.	**Registered in Paypal** – invoice with this stage is registered in Paypal and can be paid.
4.	**Pending for Paypal response** – invoice pending for confirmation of action from Paypal.
5.	**Cancel** – EspoCRM with this status will send request for cancellation to Paypal.
6.	**Cancelled** – Paypal confirmed cancellation of invoice.
7.	**Paid** – invoice is paid.
8.	**Remove from Paypal** – EspoCRM will send request for removal of invoice to Paypal.
9.	**Removed from Paypal** – Paypal confirmed removal of invoice.
