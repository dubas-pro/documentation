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

**Usage:** Set this parameter to the name of a custom Opportunity field that stores the opportunity number. The value is used only when:

- the configured field exists on the related Opportunity record,
- and the field contains a string value.

If not configured (or conditions are not met), the opportunity number is not added to the invoice payload.

!!! example "Example Configuration"
    `'ksefOpportunityNumberField' => 'customOpportunityNumber'`
