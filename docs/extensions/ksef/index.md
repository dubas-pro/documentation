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
    Please contact us [via our form](https://dubas.pro/form/contact) if you would like to order this extension.

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
* Sales Pack version **4.x** or higher.

---

## How to start?

1. Purchase and install **[Sales Pack extension](https://dubas.pro/link/sp)**
2. Install KSeF extension
3. [Configure KSeF Profile](./profiles.md#how-to-configure-a-ksef-profile)
4. [Configure automatic expenses fetching](#how-to-configure-the-ksef-cron-job)
5. [Add optional fields to Invoices](./invoices.md#how-to-set-additional-params-for-invoice)

**[Now you can issue your first invoice!](./invoices.md#how-to-issue-invoice-via-ksef)**

## :material-cog-sync-outline: How to Configure the KSeF Cron Job

1. Navigate to the **Administration** section.
2. Click on **Scheduled Jobs**.
3. Create a new Scheduled Job.
4. Choose the task `Get Invoices From Ksef`.
5. Click **Save**.

By default, this job will automatically download expenses from KSeF every **5 minutes** for all active profiles.


---

## :material-server-network: KSeF Environments

* **Production:** [https://ap.ksef.mf.gov.pl/web/](https://ap.ksef.mf.gov.pl/web/)
* **Demo:** [https://ap-demo.ksef.mf.gov.pl/web/](https://ap-demo.ksef.mf.gov.pl/web/)
* **Test:** [https://ap-test.ksef.mf.gov.pl/web/](https://ap-test.ksef.mf.gov.pl/web/)

---

## Related Articles

* [Invoices management](./invoices.md)
* [Expenses management](./expenses.md)
* [How to download a package with financial documents](./download-documents.md)
* [How to configure a profile for the KSeF test environment](./test-profile.md)
* [How to manage accounts and tax IDs](./accounts.md)
