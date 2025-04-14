# Subscription Management in EspoCRM

## Overview

At **dubas.pro**, we provide a wide range of CRM-related services and customizations. To manage our recurring services more efficiently, we developed a custom **Subscription** entity within **EspoCRM**. This allows us to keep track of all subscription-based services internally without relying on any external billing or subscription management software.

## Why We Built Our Own Subscription System

Managing multiple clients and services with varying billing cycles and subscription terms can quickly become complex. External tools often lack flexibility, add overhead, or require additional integrations. By creating a custom subscription module in EspoCRM, we:

- Centralize all subscription data in one place.
- Automate billing processes.
- Improve accuracy in renewal tracking.
- Gain full control and customization based on our business logic.

## Subscription Entity Structure

Each subscription record is a self-contained unit with comprehensive information:

### Core Fields
- **Name**: Custom label for internal reference.
- **Number**: Unique identifier for each subscription.
- **Status**: Current state (e.g., Active, Inactive, Cancelled).
- **Start Date**: When the subscription begins.
- **End Date**: When the subscription is set to end.
- **Description**: Additional notes or service details.

### Relationships
- **Linked Account**: The organization the subscription is billed to.
- **Contact Person**: Primary contact associated with the subscription.

### Billing Details
- **Billing Type**:
  - `Prepaid`: Billed in advance.
  - `Postpaid`: Billed after service.
- **Billing Period**:
  - Options: Weekly, Monthly, Quarterly, Yearly.
  - *(Planned feature: custom schedules similar to cron jobs for more granular control).*
- **Next Billing Date**: When the next invoice or sales order is due.
- **Billing Method**:
  - Determines the type of document generated (e.g., Invoice, Sales Order).
  - Sales packs can trigger automatic document creation.

## How the Automation Works

We’ve implemented a **Scheduled Job** in EspoCRM that runs daily. The job handles billing and document generation in an automated manner.

### Daily Billing Workflow
1. **Verification**: The job checks if any subscriptions have a billing date matching today.
2. **Document Creation**: If matched, the system generates a document (invoice or sales order) based on the billing method.
3. **Account Billing**: The document is linked to the appropriate account and contact.
4. **Next Renewal Date**: The system calculates and updates the next billing date based on the selected billing period.

### Example Use Case
Let’s say we offer a **monthly support plan** for CRM maintenance:

- **Subscription Name**: Premium Support Plan
- **Linked Account**: ABC Corporation
- **Billing Period**: Monthly
- **Billing Method**: Invoice
- **Billing Type**: Prepaid
- **Next Billing Date**: April 15, 2025

On April 15, the system automatically:
- Creates an invoice for the upcoming month.
- Sends the invoice to ABC Corporation.
- Updates the next billing date to May 15, 2025.

## Benefits to Our Business

By bringing subscription management in-house, we've realized several operational benefits:

- **Efficiency**: Drastically reduced manual billing processes.
- **Accuracy**: Minimized billing errors and missed renewals.
- **Scalability**: Easy to onboard new clients and services.
- **Customization**: Tailor subscription logic and document generation to our specific needs.
- **Centralization**: One CRM to manage customers, services, and billing.

## Future Enhancements

We are continually improving our subscription framework. Planned upgrades include:

- **Custom Billing Schedules**: More flexible billing timelines using cron-like configuration.
- **Reminder Notifications**: Alerts to clients and team members ahead of billing cycles.
- **Analytics Dashboard**: Visual reports on active subscriptions, churn rates, and revenue.

## Conclusion

Our custom Subscription entity in EspoCRM is a cornerstone of our internal operations. It enables us to deliver recurring services with precision and transparency, while maintaining full control over our processes. As our service offerings expand, our subscription module will evolve to meet new business demands.

> For more information or a custom subscription solution for your CRM, contact us at [devcrm.it](https://devcrm.it).
