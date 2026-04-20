# :material-tools: KSeF Profiles

This section guides you through setting up and managing KSeF Profiles. By configuring these profiles, you can handle multiple legal entities and various authentication methods within a single EspoCRM instance.

**Quick link:** [Open KSeF Profile Settings](https://dubas.pro/redirect/#KsefProfile)

---

## :material-book-plus-multiple: How to Configure a KSeF Profile

The integration supports multiple KSeF Profiles, enabling the management of several companies or branches from one centralized dashboard.

1. Navigate to the **Administration** section.
2. Search for **KSeF Settings** and open the section.
3. Click to create a new **KSeF Profile** using the field specifications below.

### :material-book-information-variant: Field Explanations

#### Overview

* **Name:** The internal display name (using the legal company name is recommended).
* **Status:** Set to **Active** to enable the profile for synchronization.
* **Tax ID (NIP):** Enter your Tax Identification Number.
    * *Note: This field is locked and cannot be edited after the profile is saved.*
* **Type:** Select the KSeF environment (Production, Demo, or Test) that matches your credentials.
* **Profile Type:** Select **Own** if this represents your primary business entity.
* **Authorization Type:** Choose between **Token** or **Certificate** based on your preferred security method.
* **Token:** Paste the authentication token generated in the KSeF portal.
* **Authorization Certificate:** The certificate used to establish a secure connection with the KSeF platform.
* **Offline Certificate:** The certificate used specifically for signing invoices in offline mode.

---

#### Company Details

* **Company Name:** The full legal name of the entity, as it should appear on issued invoices.
* **Address:** The complete registered address for invoice headers.
* **REGON & KRS Number:** Optional business identifiers to be included on the invoice.
* **Email & Phone Number:** Contact details displayed on the invoice for recipient communication.

---

#### Expenses (Incoming Invoices)

* **Enable Expenses:** Toggle this on to allow the system to fetch incoming invoices into EspoCRM.
* **Fetch Since:** The start date for retrieving historical invoice data.
* **Create Accounts for Expenses:** If enabled, the system will automatically create a new **Account** record if no existing record matches the Tax ID on a fetched invoice.
* **Assign Expenses To:** Specify the default user to whom newly imported expenses will be assigned.

!!! warning "Account Matching & Tax ID Management"
    To understand how the integration identifies existing accounts and prevents duplicates, [please read this detailed article](./accounts.md).

---

#### Invoices (Outgoing Invoices)

* **Enable Invoices:** Toggle this on to allow sending and issuing invoices via EspoCRM using this profile.
* **Default Payment Method:** Set the default method (e.g., Bank Transfer) for invoices issued under this profile.
* **Default Payment Channel:** Set the default bank account or channel. If configured, this will be mapped directly to the official KSeF XML schema.
* **Additional Information:** Choose which metadata (Client email, phone, reference numbers, etc.) should be appended to the KSeF invoice.
