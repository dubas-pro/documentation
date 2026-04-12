## :octicons-command-palette-16: Available Console Commands

This section details the console commands provided by the KSeF Integration to help you manage and maintain your system data.

---

### `migrate-tax-id-to-ksef`

*Availability: Since version 1.2.0*

This command facilitates the bulk migration of existing Tax IDs from a legacy database field into the standardized Tax ID structure required by the KSeF integration.

#### Overview

If your application previously stored Tax ID or VAT numbers in a custom or legacy field (for example, a field named `tid`), this command allows you to seamlessly map and transfer those records. During the migration process, you must specify the legacy field name and classify the type of Tax ID being transferred.

#### Command Options

| Option | Required | Description | Accepted Values |
| :--- | :---: | :--- | :--- |
| `--field` | Yes | The exact name of the legacy field currently storing the Tax IDs. | String (e.g., `tid`) |
| `--type` | Yes | The specific classification of the Tax IDs being migrated. | `NIP`, `VAT UE`, `Other` |

#### Usage Examples

!!! example "Basic Migration"
    If you were previously using a field named `tid` to store European VAT numbers, you will map `tid` as the `--field` and set the `--type` to `VAT UE`.

    ```bash
    bin/command migrate-tax-id-to-ksef --field='tid' --type='VAT UE'
    ```

!!! abstract "Generic Syntax"
    When running the command in your environment, replace the placeholder variables with your specific database parameters:

    ```bash
    bin/command migrate-tax-id-to-ksef --field='<OLD_TAX_ID_FIELD>' --type='<TYPE_OF_TAX_ID>'
    ```
