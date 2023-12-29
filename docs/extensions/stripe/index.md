---
title: Dubas Stripe Integration for EspoCRM
summary: A brief description of my document.
authors:
    - dubas s.c.
date: 2023-05-10
---
# Dubas Stripe Integration for EspoCRM
![Stripe](../../images/stripe.png)

Stripe is a reputable payment processing platform known for its security and flexibility. With our integration, you can easily incorporate Stripe's payment processing capabilities into your own systems or applications. Our experienced team is dedicated to providing seamless and efficient integration services that meet your unique business needs.

!!! tip "Order Now"
    You can purchase this extension in our [marketplace](https://devcrm.it/stripe).

## :material-cube-scan: Demo instance
You can check few features of this extension on our public demo. Go to [demo.devcrm.it](https://demo.devcrm.it) and login:

Username: **stripe**
Password: **dubas**

## :material-playlist-check:  Requirements
- EspoCRM in version 7.0.0 or higher.
- Publicly available EspoCRM instance – it’s required because stripe use webhooks to transfer some information and customers will have access to payment pages through EspoCRM.

## :material-view-grid-plus: Installation
1.	Log in to your EspoCRM and go to Administration section.
2.	Go to section Extensions.
3. Install extension which you received from us.

## :material-tune: Initial configuration
!!! danger ""
    We highly recommend configuring the extension with test credentials before proceeding with production details. This will allow you to thoroughly test and ensure the proper functioning of the extension.

1.	Go to **Administration > Integrations**.
2.	Choose Stripe integration.
3.	Enable Stripe integration.
4.	Open [Stripe Dashboard](https://dashboard.stripe.com/apikeys).
5.	Choose environment(Sandbox/Live).
6.	Copy **Publishable key** and paste it here
8.	Copy **Secret key** and paste it here.
9.	Save settings.
10.	Go to **Administration > Stripe Webhooks**.
13.	Create new webhook. Add name, choose events which you want to use (currently supported are `checkout.session.async_payment_failed`, `checkout.session.completed`, `checkout.session.async_payment_succeeded`, `payout.canceled`, `payout.created`, `payout.failed`, `payout.paid`), choose status **Register**, and field URL leave empty.
14.	Save webhook.

Now you can start using Stripe in your EspoCRM. You can add Stripe entities to your menu.
