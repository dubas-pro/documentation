## :octicons-number-24: Tax rates in KSeF Integration

*As of version 1.2.0*

To ensure full compatibility between the KSeF integration and the [Sales Pack](https://dubas.pro/link/sp) extension, we have implemented comprehensive support for tax rates. This alignment ensures that tax data is mapped correctly when transmitting invoices to the National e-Invoice System.

---

## :octicons-gear-24: Configuring Sales Pack

!!! danger "Mandatory Requirement"
    Enabling **Tax Code** support in Sales Pack is strictly required to properly issue invoices via KSeF. Failure to do so may result in validation errors during the export process.

### Enabling Tax Codes
When enabled, only pre-defined tax codes can be selected for individual line items, ensuring data consistency across your documents.

#### Quick Setup
You can jump directly to the settings using this shortcut:
[#Admin/salesPackSettings](https://dubas.pro/redirect/#Admin/salesPackSettings) - tick the **Tax Codes** checkbox and click **Save**.

#### Manual Step-by-Step
1. Navigate to **Administration**.
2. Search for `Sales Pack` and select **Settings**.
3. Locate the **Tax Codes** checkbox, ensure it is checked, and click **Save**.

Once active, you can manage your rates via the [Tax Codes (shortcut)](https://dubas.pro/redirect/#TaxCode) entity.

---

## :octicons-plus-circle-24: Creating Tax Codes Manually

When creating or editing Tax Codes for use with the KSeF integration, you must link the internal rate to the official KSeF classification:

1. Open the **Tax Code** record.
2. Locate the **KSeF Rate** field in the right-side panel.
3. Select the appropriate rate from the dropdown to ensure correct mapping.

!!! warning "The rate and the KSeF Rate must match"
    The VAT calculated by EspoCRM must agree with the KSeF Rate of the tax code. For example, a tax code with rate 23% must have KSeF Rate `23`, and tax codes with KSeF Rate `zw`, `np`, `oo` or `0%` must have rate 0%. If they do not match, the invoice will not be sent to KSeF.

### Which KSeF Rate to choose

| KSeF Rate | Use for |
|---|---|
| `23`, `22`, `8`, `7`, `5`, `4`, `3` | Standard and reduced rates |
| `0 KR` | 0% domestic supply |
| `0 WDT` | 0% intra-community supply – the buyer must have an EU VAT number |
| `0 EX` | 0% export |
| `zw` | Exempt – the invoice must include the legal basis of the exemption |
| `oo` | Domestic reverse charge |
| `np I` | Outside the scope of Polish VAT |
| `np II` | Services to EU businesses (art. 100 ust. 1 pkt 4) |

For `oo` and `np II` the "reverse charge" annotation is added to the invoice automatically.

---

## :octicons-download-24: Import Default Polish Tax Codes

To expedite the setup process, we provide a pre-configured CSV file containing standard Polish tax rates mapped to KSeF requirements.

### Import Instructions

1. **Download:** [Download the CSV file](http://cdn.dubas.pro/csv/Ksef_TaxCode.csv).
2. **Navigate:** Go to the [Import (shortcut)](https://dubas.pro/redirect/#Admin/import) section in the Administration panel.
3. **Entity Selection:** Choose `Tax Codes` as the target entity.
4. **Upload:** Attach the downloaded CSV file.
5. **Progress:** Scroll to the bottom and click **Next**.
6. **Review:** Verify the field mapping on the summary screen.
7. **Finalize:** Scroll down and click **Run import**.

!!! success "Verification"
    After the import is complete, check the Tax Codes list to ensure the `KSeF Rate` field is populated for each imported record.
