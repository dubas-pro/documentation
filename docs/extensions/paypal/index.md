---
title: Dubas PayPal Integration for EspoCRM
---

PayPal Integration was originally developed for internal use within our company. After many months of developing this extension and running internal tests, we decided to release the PayPal integration as an extension.

!!! tip "Order Now"
    You can purchase this extension in our [marketplace](https://devcrm.it/product/paypal/).

![PayPal](../../images/paypal.png)

## Demo

You can check few features of this extension on our public demo. Go to [demo.devcrm.it](https://demo.devcrm.it) and login:

- Username: **paypal**
- Password: **dubas**

## Requirements

- EspoCRM in version 6.0.0 or higher.
- PHP in version 7.2 or higher.
- Publicly available EspoCRM instance – it’s required because PayPal use webhooks to transfer some information.
- SalesPack extension if you want to use PayPal Invoices.

## Installation

1. Log in to your EspoCRM and go to Administration section.
2. Go to section Extensions.
3. Install extension which you received from us.

## Setup

1. Go to **Administration > Integrations**.
2. Choose PayPal integration.
3. Enable PayPal integration.
4. Open [My apps&credentials](https://developer.paypal.com/developer/applications) PayPal website.
5. Choose environment(Sandbox/Live).
6. Click on buton **Create app**.
7. Enter name of the app.
8. Copy **Client ID** and paste it in your PayPal integration settings.
9. Copy **Secret** and paste it in your PayPal integration settings.
10. Choose environment – it must be the same as you selected before in the second step.
11. Save settings.
12. Go to **Administration > PayPal Webhooks**.
13. Create new webhook. Add name, choose events which you want to use, choose status **Activate**, and field URL leave empty.
14. Save webhook.

Now you can start using PayPal in your EspoCRM. You can add PayPal entities to your menu.
