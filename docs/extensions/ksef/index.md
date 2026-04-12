---
title: Dubas KSeF Integration for EspoCRM
description: Manage KSeF invoices directly inside EspoCRM with our integration.
authors:
  - dubas s.c.
---

# Dubas KSeF Integration

![Dubas KSeF Integration](../../images/ksef.png)

## :material-information-outline: General Information

The Dubas KSeF Integration is a custom extension that enables seamless communication between EspoCRM and the Polish National e-Invoicing System (KSeF). With this extension, you can automatically download contractor invoices from KSeF directly into EspoCRM, as well as issue your own invoices to KSeF using the Sales Pack functionality. This solution streamlines your financial document management and ensures secure, efficient handling within your CRM.

!!! tip "Purchase"
    Please contact us [via our form](https://dashboard.dubas.pro/static/form/contact) if you would like to order this extension.

### Key Features

!!! warning "This product is new!"
    Please note that both this extension and the KSeF system are relatively new, and ongoing updates or changes to national standards may occur. We are committed to adapting the integration as needed and supporting individual use cases to ensure continued compatibility and reliability.

* **Total Data Security:** All your data remains secure within your EspoCRM instance. Communication occurs directly between your CRM and the KSeF system. Our integration does not transmit any financial or client information to third parties.
* **Automated Invoice Retrieval:** The integration automatically fetches invoices issued by your contractors from KSeF based on your schedule and preferences.
* **Sales Pack Compatibility:** Received invoices are stored in the Expenses entity, which was designed to be fully compatible with the Sales Pack and its Item List.
* **Manual Synchronization:** You can manually initiate the retrieval of invoices from KSeF at any time.
* **Unified Expense Management:** The Expenses module can be used for all invoices, not just those from KSeF. You can manually enter expenses from other sources as needed.
* **Direct Invoice Issuance:** Send invoices issued in the EspoCRM Sales Pack directly to the KSeF system.

### :material-map-marker-distance: Roadmap

* Authorization via certificates (required before 2027).
* Support for offline modes (requires certificate authorization).
* Support for Credit Notes (contingent upon Sales Pack entity compatibility with KSeF).
* Batch processing support for invoice issuance.

---

## :material-playlist-check: Requirements

* EspoCRM version **9.2.0** or higher.
* Sales Pack version **3.x** or higher.

---

## :material-book-plus-multiple: How to Configure a KSeF Profile

You can configure multiple KSeF Profiles, allowing you to manage several companies within a single EspoCRM instance.

1. Navigate to the **Administration** section.
2. Search for **KSeF Settings** and click on it.
3. Create a new KSeF Profile based on the specifications below.

### :material-book-information-variant: Field Explanations

#### Overview

* **Name:** The display name for the profile (using the company name is recommended).
* **Status:** Set to **Active** to enable the profile.
* **Tax ID:** Enter your NIP (Tax Identification Number). *Note: This cannot be changed after saving.*
* **Type:** Select the KSeF environment corresponding to your generated token (see environments below).
* **Profile Type:** Select **Own** if this represents your primary company.
* **Token:** Enter the authentication token generated in the KSeF portal.

#### Company Details

* **Company Name:** The full legal name of the company, which will be used on issued invoices.
* **Address:** The complete company address to be printed on invoices.
* **Email Address & Phone Number:** Additional contact details to include on issued invoices.

#### Expenses

* **Enable Expenses:** Toggle to allow invoices to be fetched into EspoCRM for this profile.
* **Fetch Since:** Specifies the starting date for retrieving historical invoices.
* **Create Accounts for Expenses:** Enable this to automatically create a new Account record if the integration cannot find an existing one matching the fetched Tax ID.

!!! warning "How we recognize Accounts and manage Tax IDs"
    [Please read this detailed article](./accounts.md) to understand how the integration matches and creates accounts.

---

## :material-cog-sync-outline: How to Configure the KSeF Cron Job

1. Navigate to the **Administration** section.
2. Click on **Scheduled Jobs**.
3. Create a new Scheduled Job.
4. Choose the task `Get Invoices From Ksef`.
5. Click **Save**.

By default, this job will automatically download expenses from KSeF every **5 minutes** for all active profiles.

---

## :material-lock-check: How to Generate a KSeF Token

[You can also use a Certificate (Note: Tokens will stop working after 2026)](./certificates.md)

1. Log in to the KSeF web application (links to environments are provided below).
2. Navigate to the **Tokens** section.
3. Generate a new token with permissions to **issue** and **read** invoices.
4. Securely save the generated token and paste it into your KSeF Profile in EspoCRM.

!!! example "Example of a KSeF Token"
    `20270115-EC-7FA3B1D200-AB12345F6A-01|nip-987654321|a1b2c3d4e5f60718293a4b5c6d7e8f90123456789abcdef0123456789abcdef0`

---

## :material-server-network: KSeF Environments

* **Production:** [https://ap.ksef.mf.gov.pl/web/](https://ap.ksef.mf.gov.pl/web/)
* **Demo:** [https://ap-demo.ksef.mf.gov.pl/web/](https://ap-demo.ksef.mf.gov.pl/web/)
* **Test:** [https://ap-test.ksef.mf.gov.pl/web/](https://ap-test.ksef.mf.gov.pl/web/)

---

## Related Articles

* [How to issue an invoice via KSeF](./issue-invoice.md)
* [How to download a package with financial documents](./download-documents.md)
* [How to configure a profile for the KSeF test environment](./test-profile.md)
* [How to manage accounts and tax IDs](./accounts.md)
