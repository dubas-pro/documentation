# :material-download-box: Accounts management in KSeF

Every invoice sent to KSeF must say who the buyer is. In EspoCRM this information comes from the `taxId` field on the Account. The field has two parts: the **type** of the identifier and the identifier itself.

## Tax ID types

| Type | When to use it | What goes to KSeF |
|---|---|---|
| **NIP** | Polish companies and sole traders | Polish NIP |
| **VAT UE** | Buyers from other EU countries | EU VAT number with the country code, e.g. `DE123456789` |
| **Other** | Buyers from outside the EU | Foreign tax number together with the country from the billing address |
| **Private person** | Consumers buying privately | No identifier – the invoice is issued without the buyer's tax number |

!!! warning "The type is required"
    An invoice cannot be sent to KSeF when the Account has no tax ID type selected. Choose **Private person** for consumers – an empty type is treated as missing data, not as a private buyer.

!!! info "Identifier required for companies"
    For **NIP**, **VAT UE** and **Other** the identifier itself must be filled in. For **Private person** it is not needed – if one is entered, it is ignored.

## Automatic account matching and creation

When KSeF sends a new invoice to EspoCRM, the system automatically checks the Accounts view to find a matching customer based on the tax identifier from the `taxId` field. If no matching account is found, the system checks the KSeF Profile settings to see if automatic account creation is enabled. If enabled, a new account is created automatically; otherwise, the invoice is processed without creating a new account.

When creating invoices in EspoCRM, the system uses the `taxId` field to identify the buyer during transmission to KSeF. Make sure every customer you invoice has the correct tax ID type and identifier.

## Adding the taxId field to the Accounts view

To add the `taxId` field to your Accounts view, follow these steps:

1. Navigate to the **Administration** section in EspoCRM
2. Scroll down to **Layout Manager** and open it
3. Select the **Account** module
4. Add the `taxId` field to the detail view

This will enable the tax identifier functionality described above for your accounts.

!!! example "How we migrate tax id's from different field?"
    We're working on some script which will copy from other field tax number to `taxId`.

You can use [console command to migrate values from old tax id field](./console-commands.md).

## Additional fields

If you want to use any of below fields, please add them to detail view via [Layout Manager](https://dubas.pro/redirect/#Admin/layouts/scope=Account&type=detail).

- `Entity is a member of VAT group` - Indicates whether the entity belongs to a VAT group. Set this value to `true` when the entity is registered as part of a VAT group for tax reporting purposes. Default `false`. When it is set, add the group member to the invoice in **Additional Accounts** with the role **VAT group member - recipient** – otherwise the invoice will not be sent.

## Invoices for local government units

When you invoice a municipality (gmina, powiat) but the invoice concerns one of its units – for example a school – enter the municipality as the Account and add the unit in **Additional Accounts** on the invoice with the role **Local government unit - recipient**. KSeF will then deliver the invoice to the unit as well.

To avoid adding the unit on every invoice, set it once on the municipality's Account – see [Default additional accounts](#default-additional-accounts).

## :material-domain: Default KSeF profile

If you issue invoices from more than one company (several KSeF profiles) and a customer is always invoiced by the same one, open the customer's Account and choose **Default KSeF Profile** in the **KSeF** side panel.

* When you select this Account on a new invoice, the profile is filled in automatically – also on invoices created from a Sales Order or a Quote.
* A profile already chosen on the invoice is never replaced, and you can still change the filled-in profile before issuing.
* Inactive profiles and profiles without **Enable Invoices** are skipped.
* On manual [expenses](./expenses.md) from this Account the profile is used too, if it has **Enable Expenses**.

The KSeF profile decides which company issues the invoice, so check the seller in the [KSeF Preview](./invoices.md#preview-before-sending) before sending.

## :material-account-multiple-plus: Default additional accounts

Some customers always need the same additional parties on their invoices – a recipient unit, a payer or a VAT group member. Add them once in **Default Additional Accounts** in the **KSeF** side panel of the customer's Account, together with their roles.

When the Account is selected on a new invoice, these parties are copied to the invoice's **Additional Accounts** with the same roles. They are not copied when the invoice already has additional accounts, and you can edit or remove them on the invoice before issuing. Credit notes take additional accounts from the corrected invoice, as before.
