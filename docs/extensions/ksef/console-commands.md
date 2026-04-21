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

    ---

### `fetch-expenses-from-ksef`

*Availability: Since version 1.5.0*

This command schedules background jobs to fetch expense invoices from KSeF for a selected date range. You can run it for one specific KSeF profile or for all active profiles.

#### Overview

The command validates input dates and then creates queue jobs (`q1`) using `FetchExpensesAfterProfileCreation`.
If `--ksefProfileId` is provided, only that profile is used. If not provided, jobs are scheduled for all active KSeF profiles.

#### Command Options

| Option | Required | Description | Accepted Values |
| :--- | :---: | :--- | :--- |
| `--from` | Yes | Start date for fetching expenses. Must be a real date. | `YYYY-MM-DD` |
| `--to` | No | End date for fetching expenses. If omitted, current date is used. Must be a real date when provided. | `YYYY-MM-DD` |
| `--ksefProfileId` | No | KSeF Profile ID. If omitted, all active profiles are processed. | Valid profile ID |

#### Usage Examples

!!! example "Single Profile"
    Schedule fetching expenses for one profile in a fixed range.

    ```bash
    php bin/command fetch-expenses-from-ksef --from="2024-01-01" --to="2026-04-31" --ksefProfileId="profile-id"
    ```

!!! example "All Active Profiles"
    Schedule fetching expenses for all active profiles from a start date until today.

    ```bash
    php bin/command fetch-expenses-from-ksef --from="2024-01-01"
    ```

!!! abstract "Generic Syntax"
    Replace values with your own parameters.

    ```bash
    php bin/command fetch-expenses-from-ksef --from='<FROM_DATE>' --to='<TO_DATE>' --ksefProfileId='<PROFILE_ID>'
    ```

#### Notes

- `--from` is mandatory.
- Dates must match `YYYY-MM-DD` and be valid calendar dates.
- If no active profiles are found (and no profile ID is passed), no jobs are created.
- A success summary is printed with the number of profiles scheduled.
