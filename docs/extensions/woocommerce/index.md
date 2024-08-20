---
title: Dubas WooCommerce Integration for EspoCRM
summary: Comprehensive documentation for the WooCommerce integration with EspoCRM.
authors:
    - dubas s.c.
date: 2022-11-21
---

# Dubas WooCommerce Integration for EspoCRM
![WooCommerce Integration](../../images/woocommerce.png)

The WooCommerce integration is designed to seamlessly connect your WooCommerce store with EspoCRM. This integration enables you to import order information from WooCommerce into EspoCRM, facilitating advanced automation and order invoicing using the Advanced Pack and Sales Pack extensions.

!!! tip "Order Now"
    You can purchase this extension from our [marketplace](https://devcrm.it/woocommerce).

## :material-playlist-check: Requirements
- **EspoCRM** version 7.0.0 or higher.
- **PHP** version 7.4 or higher.
- A publicly accessible EspoCRM instance – this is necessary as WooCommerce uses webhooks to transfer information.
- SalesPack extension.

## :material-view-grid-plus: Installation
1. Log in to your EspoCRM and navigate to the **Administration** section.
2. Go to the **Extensions** section.
3. Install the extension that you received from us.

## :material-tune: Initial Configuration
1. Go to **Administration > Integrations**.
2. Select **WooCommerce integration**.
3. Enable WooCommerce integration.
4. Navigate to **WooCommerce > Settings > Advanced > REST API**.
5. Create API credentials for your EspoCRM instance and copy them.
6. Log in to your EspoCRM admin account and go to **Administration > Integrations**.
7. Paste the WooCommerce API keys into EspoCRM.
8. Save the settings.
9. Go to **Administration > WooCommerce Webhooks**.
10. Create two new webhooks for creating and updating orders.

Now you can start using WooCommerce within EspoCRM. You can add the WooCommerce Orders entity to your menu. To test the integration, create a new order on your WooCommerce website.
