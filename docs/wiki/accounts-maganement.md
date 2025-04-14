# 📘 Managing Accounts in EspoCRM

## Overview

At **dubas.pro**, we prioritize **efficient and scalable customer management**. Over the years, we've developed an **enhanced Account profile system** within **EspoCRM** that helps us manage customers, business partners, and internal processes effectively.

EspoCRM’s native `Account` entity has been customized to meet our operational requirements while maintaining clarity, structure, and automation. This documentation provides a deep dive into how our system is set up, configured, and utilized  -  including custom fields, automation logic, practical business benefits, and implementation examples.

---

## 📂 Entity Scope: Who Is an Account?

We use the **Accounts entity** not only for customers but also for:

- **Business Partners**
- **Suppliers**
- **Internal Contractors**

If you've collaborated with dubas.pro in any way  -  chances are you're already an **Account** in our EspoCRM.

---

## 🏗️ Custom Field Enhancements

We've extended the standard `Account` entity with the following fields to centralize client intelligence.

### 🗂️ General Fields

| **Field**                    | **Description**                                                                 |
|-----------------------------|---------------------------------------------------------------------------------|
| **Timezone**                | Set during account creation or later. Shows local time using custom logic.     |
| **Status**                  | Enum (`Active`, `Inactive`, `Blocked`, etc.). Affects access and automations.  |
| **Main Representative**     | Auto-linked `Contact`. Prefills related records (tasks, meetings).             |
| **Client ID**               | Random 8-digit ID generated via `beforeSave` hook.                             |
| **Tax ID / REGON**          | Business registration identifiers for compliance and invoicing.               |
| **Language of Communication** | Enum: `Polish` or `English`. Used to localize emails and notifications.     |
| **PDF from Government Registry** | File uploaded during onboarding for legal verification.                |
| **Payment Method**          | Enum (`Bank transfer`, `PayPal`, `Stripe`, etc.). Stored as customer preference. |
| **Payment Deadline**        | Integer (default: `7` days). Defines allowed time to settle payments.          |

---

### 💡 Dynamic / Calculated Fields

| **Field**                   | **Description**                                                                 |
|----------------------------|---------------------------------------------------------------------------------|
| **Income (Current Year)**  | Total revenue linked to the account for the current fiscal year.               |
| **Total Income**           | All-time income from the account.                                               |
| **Balance**                | Total outstanding invoice amount.                                               |
| **Overdue Balance**        | Amount past due date.                                                           |
| **% of Overdue Invoices**  | Calculated ratio of overdue invoices to total balance.                         |

These fields are **read-only** and auto-updated via **scheduled jobs** or **custom services**.

---

### 🔗 Relationship Panels & Tabs

| **Tab / Panel**             | **Contents & Purpose**                                                                 |
|----------------------------|----------------------------------------------------------------------------------------|
| **Contacts / Portal Users**| Standard EspoCRM relationship for primary and secondary contacts.                     |
| **Documents, Cases**       | Default tabs showing all related documentation and client cases.                      |
| **Licenses**               | Shows licensed products or services. Custom relationship to `License` entity.         |
| **Tickets**                | Displays support tickets; defaults to open tickets for visibility.                    |
| **Finances**               | Aggregates financial data: Expenses, Subscriptions, Opportunities, Charges, etc.      |
| **Time Tracker**           | Lists all time entries connected through projects, tasks, or support sessions.        |
| **Contracts & Correspondence** | Tracks legal agreements, registered letters, and key communication history.     |

## 🤖 Automations & Workflow Enhancements

We use **EspoCRM’s BPM engine, formula fields, and custom hooks** to build robust automations around Accounts.

### Examples

#### Credit Control Logic

For customers with high overdue balances:

- Payment terms switch from **post-paid** to **pre-paid**.
- Future projects or services are flagged until the balance is cleared.

#### Language-Based Notifications

Emails, task descriptions, and portal messages are automatically localized. Templates use placeholders and translation keys depending on `language` field.

---

## 🛠️ Implementation Benefits

Our custom Account management system has brought tangible benefits:

- ✅ **Unified Data**: All client-related data is centralized and accessible in one place.
- ✅ **Reduced Errors**: Automated calculations and validations reduce human error.
- ✅ **Faster Support**: Support agents can instantly assess account state, licenses, and open tickets.
- ✅ **Improved Compliance**: Government documents and legal contracts are archived per account.
- ✅ **Localized Communication**: Clear language distinction ensures smoother international collaboration.
- ✅ **Credit Control**: Automations prevent risky financial behaviors proactively.

---

## 🧭 Conclusion

Our custom approach to **Account management in EspoCRM** not only simplifies customer handling but also creates a strong backbone for operational, financial, and support processes.

By combining native features with advanced customizations, automations, and thoughtful UX, we've turned Accounts into a **central business intelligence node** in our CRM ecosystem.
