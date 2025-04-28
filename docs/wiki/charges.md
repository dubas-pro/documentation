# Charges Module

## Introduction

At our company, maintaining healthy cash flow and enforcing payment discipline are critical aspects of our financial management.
To support these objectives, we developed a custom **Charges** module within **EspoCRM**.
This module allows us to efficiently manage overdue invoices, calculate additional charges like interests, send formal payment demands, and control client access when necessary.

This document outlines the **implementation**, **usage**, and **benefits** of the Charges module, highlighting how it has streamlined our internal processes.

## Implementation of the Charges Module

### Purpose

The Charges module was designed to:

- Automatically calculate interests and other fees for overdue invoices.
- Generate clear, professional payment demand letters.
- Integrate charge management into our overall financial workflows.
- Enhance debt collection processes.

### Key Features

- Custom-built **Charges** entity within EspoCRM.
- Automatic charge creation based on overdue invoice conditions.
- PDF generation from multiple professional templates.
- Full payment tracking and financial record generation.
- Client account management (e.g., blocking accounts with unpaid charges).

### System Automation

When an invoice becomes overdue:

- The system **automatically generates a new Charge record**.
- The Charge amount is calculated based on:
  - The overdue invoice's value.
  - Predefined interest rates or penalty rules.
- A suitable **Payment Demand Letter** can be quickly created from a range of PDF templates.
- Upon payment, the Charge record is **marked as Paid**, and an **accountant note** is generated for bookkeeping.

If the Charge remains unpaid for an extended period:

- The system can **restrict customer access** or **flag the client account**, ensuring service continuity is tied to payment regularity.

---

## Usage of the Charges Module

### Charge Creation

- Charges are triggered **automatically** when an invoice passes its due date without full payment.
- Alternatively, users can create manual Charges for specific financial arrangements or disputes.

### Payment Demand Letter Generation

- Users can select from **multiple prepared PDF templates**.
- Templates include:
  - Basic reminder letters.
  - Formal payment demands.
  - Pre-legal action notices.
- Documents can be quickly generated and emailed directly from EspoCRM.

### Payment Processing

- When a customer settles their outstanding amount:
  - The Charge is updated to a **Paid** status.
  - An **accounting note** is generated, ensuring proper financial recording.

### Customer Management

- Unsettled Charges can **lead to automatic account blocking**.
- The customer's CRM profile reflects their financial standing, helping teams take informed actions regarding project continuation or support services.

---

## Practical Example

Imagine a customer has an overdue invoice of **€2,000** for services delivered:

- After 14 days past due date, a Charge is automatically created, adding a **5% late fee** (€100).
- A **Payment Demand Letter** is generated from a formal template and sent to the customer.
- If the customer pays the full €2,100, the system marks the Charge as **Paid** and logs an accountant note.
- If no payment is made after multiple notices, the customer's access to further services may be **temporarily suspended** until outstanding amounts are cleared.

---

## Benefits Experienced

### Improved Cash Flow Management

- Proactive charge management encourages customers to pay on time.
- Interests and fees help compensate for the financial impact of late payments.

### Streamlined Financial Processes

- Charge calculations, document generation, and customer communications are handled within EspoCRM, ensuring consistency and reducing administrative overhead.

### Enhanced Customer Accountability

- Automated procedures and formal reminders establish a professional, standardized approach to debt collection.
- Customers clearly understand the consequences of delayed payments.

### Legal and Accounting Compliance

- Formal Payment Demand Letters and properly booked Charges support potential legal proceedings if necessary.
- Accountant notes ensure all financial entries are properly documented for audits.

---

## Conclusion

The **Charges Module** has become a vital component of our financial operations at **devcrm.it**.
By automating the management of overdue invoices, calculating additional charges, and integrating client access control, we have significantly **improved cash flow**, **reduced manual work**, and **strengthened client payment discipline**.

This powerful yet user-friendly solution is another example of how our company leverages **custom EspoCRM development** to create real, measurable value — both for ourselves and for our customers.
