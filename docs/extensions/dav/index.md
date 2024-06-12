---
title: DAV for EspoCRM
---

## Introduction

DAV is an HTTP protocol that allows the use of CalDAV, CardDAV, and WebDAV. Our integration adds DAV features to EspoCRM, enabling functionalities such as CalDAV for synchronizing events from the calendar in EspoCRM, CardDAV for syncing contacts and leads with your phone, and WebDAV for syncing files, like documents from your computer, with EspoCRM's Documents feature.

!!! tip "Order Now"
    You can buy this extension on our [marketplace](https://devcrm.it/product/dav/).

## Demo

Try out some features of this extension on our public demo.

Visit [demo.devcrm.it](https://demo.devcrm.it) and log in using the following credentials:

- Username: **dav**
- Password: **dubas**

URL for connecting from the DAV client: `https://demo.devcrm.it/dav/server.php`.

## Requirements

- EspoCRM version 7.4.0 or higher.
- PHP version 8.0 or higher with SOAP extension enabled.

!!! note "Note"
    Apache and Nginx configurations might need to be adjusted to allow the DAV protocol.

## Installation

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Upload your extension package (zip file).
4. Click Install button.

For more information, check out the Official EspoCRM documentation on [Managing Extensions](https://docs.espocrm.com/administration/extensions/).

## Setup

1. Login as an administrator.
2. Navigate to Administration > Integrations.
3. Select DAV integration.
4. Enable it.
5. Save settings.

## Access control

**Important:** By default, regular users don't have access to DAV integration. You need to create a role with the appropriate permissions and assign it to users who should have access to DAV services.

1. Go to Administration > Roles.
2. Select or create a role with the following required permission:

   - External Accounts

3. For granting calendar access:

   - CalDAV
   - Calendar
   - Calls and/or Meetings and/or Tasks

4. For granting contacts access:

   - CardDAV
   - Contacts and/or Leads

5. For granting documents access:

   - WebDAV
   - Documents and/or Knowledge Base
