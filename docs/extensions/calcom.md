---
title: Dubas Cal.com Integration for EspoCRM
description: Sync all meetings scheduled by your Customers thanks to Cal.com integration with your EspoCRM!
authors:
    - dubas s.c.
---
# Dubas Cal.com Integration
<!-- ![Dubas Send Extension](../images/send.png) -->
## :material-information-outline: General Information
The Cal.com Integration for EspoCRM offers a robust solution to streamline your scheduling and customer relationship management tasks. This extension integrates seamlessly with EspoCRM, providing both cloud and self-hosting options to suit your needs. It enhances your ability to manage calls, meetings, and customer interactions efficiently, making it an ideal tool for businesses of all sizes. By automating key processes and improving collaboration, the Cal.com Integration ensures that you have a comprehensive view of your customer engagements, enabling more effective communication and better overall CRM management.

!!! info
    There is a product page for this extension: [https://devcrm.it/product/cal-com/](https://devcrm.it/product/cal-com/)

## :material-playlist-check:  Requirements
- EspoCRM in version 7 or higher.
- PHP in version 7.3 or higher.
- Admin access to Cal.com’s cloud version or a self-hosted Cal.com application.

<!--
## :material-cube-scan: Demo
You can check this extension on our demo instance: [demo.devcrm.it](https://demo.devcrm.it)
Username: **send**
Password: **dubas** -->

## :material-video-box: Video Presentation
<div class="video-wrapper">
  <iframe width="1280" height="400" src="https://www.youtube.com/embed/dt7-OB9e7Fk" frameborder="0" allowfullscreen></iframe>
</div>

## Installation

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Upload your extension package (zip file).
4. Click Install button.

For more information, check out the Official EspoCRM documentation on [Managing Extensions](https://docs.espocrm.com/administration/extensions/).

## Setup

1. Login as an administrator.
2. Navigate to Administration.
3. Search for `Cal.com Webhooks`.
4. Create new webhook - fill only name, choose Active status and hit save.
5. Log in to Cal.com administration panel.
6. Go to section Webhooks.
7. Create new webhook for your account.
8. Go back to Webhook created in EspoCRM and copy `Endpoint` url. Paste it in Cal.com webhook settings as a `Subscriber URL`.
9. Go back to Webhook created in EspoCRM and copy `Secret`. Paste it in Cal.com webhook settings as a `secret`.
10. Choose from list events which should trigger webhook submission.
11. Save webhook.
