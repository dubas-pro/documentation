# :material-tools: Additional params in Config file

## How to set new Config param?

1. Go to SSH/FTP
2. Open EspoCRM directory
3. Go to `data` folder
4. Open `Config.php` ([Check config files](https://docs.espocrm.com/administration/config-params/#config-files))
5. Add any below param with proper value
6. Save file and quit
7. Clear cache & rebuild

## Available params

### Invoice Issued Status Value

**Configuration Key:** `ksefInvoiceIssuedStatusValue`

**Description:** Defines the custom status label to be assigned to invoices when they are successfully issued in the KSeF system.

**Type:** String

**Default Value:** `'Issued'`

**Usage:** This parameter allows you to customize the status text that represents an issued invoice state. If not configured, the system will use the default value "Issued". You can override this to match your business requirements or localization needs.

!!! example "Example Configuration"
    `'ksefInvoiceIssuedStatusValue' => 'Sent'`

### Custom Account Number Field

**Configuration Key:** `ksefAccountNumberField`

**Description:** Defines which Account field should be used as the client number (`NrKlienta`) in KSeF invoices.

**Type:** String

**Default Value:** `null` (not set)

**Usage:** Set this parameter to the name of a custom Account field that stores the client number. The value is used only when:

- the configured field exists and contains a string value,
- `additionalInvoiceInformation` is enabled in the KSeF profile,
- and it includes `Client number`.

If not configured (or conditions are not met), the client number is not added to the invoice payload.

!!! example "Example Configuration"
    `'ksefAccountNumberField' => 'customClientNumber'`

### Custom Opportunity Number Field

**Configuration Key:** `ksefOpportunityNumberField`

**Description:** Defines which Opportunity field should be used as the opportunity number in KSeF invoices.

**Type:** String

**Default Value:** `null` (not set)

**Usage:** The opportunity number is added to the invoice when **References to related documents** is selected in the KSeF profile. EspoCRM opportunities have no number field by default, so the integration looks for the number in this order and uses the first field that exists and is filled in:

1. the field set in this parameter,
2. `number`,
3. `dubasNumber`.

Set this parameter only if the number is kept in a field with a different name. If none of the fields is filled in, the opportunity number is skipped.

!!! example "Example Configuration"
    `'ksefOpportunityNumberField' => 'customOpportunityNumber'`

### Custom Contact Number Field

**Configuration Key:** `ksefContactNumberField`

**Description:** Defines which Invoice field holds the number of the billing contact sent together with the billing contact details.

**Type:** String

**Default Value:** `null` (not set)

**Usage:** Used only when **Billing contact details** is selected in **Additional Information** of the KSeF profile and the invoice has a billing contact.

!!! example "Example Configuration"
    `'ksefContactNumberField' => 'billingContactEmployeeNumber'`
