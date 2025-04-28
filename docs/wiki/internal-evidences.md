# Internal Evidences

## Introduction

In our continuous effort to enhance internal processes and improve operational efficiency, our company has developed and implemented a custom **Internal Evidence** module within **EspoCRM**. This module plays a critical role in the management of financial records, specifically for non-invoiced transactions, currency differences, and payment fees.

The purpose of this document is to provide a detailed overview of our implementation, describe the usage, and highlight the benefits we have experienced since adopting the Internal Evidence module.

---

## Implementation of the Internal Evidence Module

### Purpose

The Internal Evidence module was designed to:
- **Record all financial entries** not directly tied to standard invoices or receipts.
- **Track and manage** payment platform fees (e.g., PayPal).
- **Document currency exchange differences** between invoice issuance and payment receipt.

### Key Features

- Custom-built EspoCRM module tailored to booking needs.
- Automatic calculations for currency differences and payment fees.
- Seamless integration with monthly financial statement preparation.
- PDF generation for official documentation and accountant reporting.

### System Automation

Initially, all currency differences and payment platform fees were calculated manually, leading to:

- High risk of human error.
- Significant time consumption.

Through custom **scripts** integrated with EspoCRM:

- The entire calculation process is **automated**.
- Upon payment receipt, all fees and currency exchange differences are immediately computed and recorded.
- Internal evidences are generated and managed **without manual intervention**.

---

## Usage of the Internal Evidence Module

### Monthly Evidence Creation

At the end of each month:
A new Internal Evidence record is **automatically created**.
The record consolidates:

- All PayPal payment fees.
- All currency exchange rate differences.
- Any other miscellaneous financial entries not tied to standard invoicing.

### Data Linkage

Each Internal Evidence is:

- **Linked** to the proper monthly statement.
- **Automatically closed** on the last day of the month.

### Document Management

Upon closing, the system:

- **Generates a PDF** containing all the financial details.
- **Bundles** the PDF into a monthly package with other financial documents for our accounting department.

### Practical Example

Imagine an invoice issued for **$1,000** USD. At the time of payment, the exchange rate may have shifted, resulting in a PLN difference. Additionally, if PayPal charges a fee for this transaction:

The Internal Evidence module automatically captures:

- The PLN amount received after exchange.
- The PayPal fee applied.
- The currency difference compared to the issued invoice.

These values are then consolidated and included in the monthly report for accounting.

---

## Benefits Experienced

### Efficiency and Time-Saving

- **Eliminated manual calculations** of fees and currency differences.
- **Reduced administrative workload**, allowing our team to focus on higher-value tasks.

### Accuracy and Compliance

- **Minimized human error** in financial reporting.
- Ensured **full compliance** with Polish accounting standards, particularly regarding foreign currency transactions.

### Improved Accounting Processes

- **Faster monthly closings** with pre-packaged documentation ready for the accountant.
- **Improved transparency** in transaction records and financial reporting.

### Enhanced Scalability

- As our transaction volume grows, the system **scales effortlessly** without the need for additional manual labor.

---

## Conclusion

The implementation of the Internal Evidence module within EspoCRM has significantly transformed our financial booking and reporting processes. By automating the calculation of PayPal fees, currency rate differences, and consolidating all monthly internal financial records, we have achieved **greater efficiency**, **accuracy**, and **compliance**.

This internal innovation has not only optimized our internal workflows but also positioned us for future growth without the traditional bottlenecks associated with manual financial record-keeping.
