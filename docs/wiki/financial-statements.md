# Financial Statements in EspoCRM

At **dubas s.c.**, we are committed to maintaining a centralized and transparent data system. EspoCRM serves as the backbone of our internal operations, and one of the key features we have developed to support our financial workflows is the implementation of **Monthly and Annual Statements**. This documentation outlines how these statements function, how we use them, and the business benefits we've realized from their integration.

---

## Overview

To ensure complete traceability and efficient financial oversight, we have embedded financial tracking capabilities directly into EspoCRM. By introducing **Monthly Statements** and **Annual Statements**, we’ve created a robust system for managing and sharing key financial data.

---

## Why We Built Monthly & Annual Statements

The core goal was to:

- **Consolidate all financial-related data** within EspoCRM.
- **Streamline communication with our accounting team** by providing pre-structured and complete financial packages.
- **Automate calculations and data aggregation**, removing human error from financial reporting.
- **Track financial health** month by month and year by year.

---

## Annual Statements

Each year, EspoCRM automatically generates a new **Annual Statement** record. This record acts as a parent container for all Monthly Statements within the respective year.

### Stored Information:

| Field                     | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| **Year**                 | The calendar year the statement represents.                                 |
| **Total Income**         | Sum of all income from linked Monthly Statements.                           |
| **Total Expenses**       | Sum of all costs from linked Monthly Statements.                            |
| **Total Revenue**        | Total net revenue (Income - Expenses) for the year.                         |
| **Linked Monthly Statements** | List of all related Monthly Statements for the year.                  |

All values are **calculated automatically** based on related Monthly Statements.

---

## Monthly Statements

Each month, a **Monthly Statement** is automatically created and linked to its parent Annual Statement. It acts as the detailed breakdown of financial activities and documentation for that month.

### Fields and Data:

| Field                     | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| **Name**                 | Month identifier, e.g., `01.2025`.                                          |
| **Status**               | Processing status of the statement (see status table below).                |
| **Annual Statement**     | Link to the parent Annual Statement.                                        |
| **Incremental Income**   | New income recorded within the month.                                       |
| **Incremental Costs**    | New costs incurred during the month.                                        |
| **Incremental Revenue**  | Net revenue calculated as income minus costs for the current month.         |
| **Income**               | Total income associated with the month.                                     |
| **Costs**                | Total costs associated with the month.                                      |
| **Revenue**              | Net revenue (Income - Costs).                                               |
| **Package with Documents**| ZIP archive of all related documents sent to the accountant.               |

These values are **automatically calculated** based on internal records stored in EspoCRM.

### Related Entities:

Each Monthly Statement is also linked to the following modules for full traceability:

- **Internal Evidences**
- **Bills & Invoices**
- **Expenses**
- **Charges**

---

## Monthly Statement Status Flow

To ensure consistent processing, we’ve defined a clear status lifecycle:

| Status     | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| **Open**   | Initial state; statement is being populated.                               |
| **Pending**| Awaiting document upload, review, or further action.                       |
| **Confirmed**| All documents gathered; ZIP package is generated and sent automatically. |
| **Closed** | Final values added; statement finalized and locked.                        |

---

## Automation & Document Packaging

Once a Monthly Statement is marked as **Confirmed**, EspoCRM automatically performs the following actions:

- Collects all related documents from **Internal Evidences**, **Bills & Invoices**, **Expenses**, and **Charges**.
- Creates a **ZIP archive** of these documents.
- **Automatically emails the package** to our accounting partner.

When our accountant provides final numbers, we update the statement and mark it as **Closed**.

---

## Practical Example

Let’s consider the process for **January 2025**:

1. EspoCRM creates `Monthly Statement: 01.2025` linked to `Annual Statement: 2025`.
2. Throughout January, team members upload:
   - Internal evidences of payments
   - Scanned invoices
   - Logged expenses and charges
3. On January 31:
   - The statement is reviewed and marked as **Confirmed**
   - EspoCRM automatically creates the ZIP archive and sends it to the accountant
4. In early February, the accountant returns final financial figures
5. We update the Monthly Statement and mark it **Closed**

---

## Business Benefits

By developing this feature, we’ve significantly improved our operational efficiency:

- ✅ **Time Savings**: Automating the creation, calculation, and document packaging process saves hours each month.
- ✅ **Accuracy**: Eliminates manual errors in revenue, expense, and income calculations.
- ✅ **Accountability**: Each statement has a clear status and audit trail.
- ✅ **Transparency**: All financial documentation is linked and easily accessible.
- ✅ **Consistency**: Standardized reporting format across all months and years.

---

## Final Thoughts

The integration of Monthly and Annual Statements into EspoCRM has transformed our financial reporting. It ensures all stakeholders—from internal teams to external accountants—have the right data, at the right time, in the right format.

This is just one example of how we tailor EspoCRM to our unique business needs, empowering better decision-making and smooth operational workflows.
