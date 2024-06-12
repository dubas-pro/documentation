# Setting-up for Administrators

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

## Configuring the web server

- [Apache](../web-server/apache/)
- [Nginx](../web-server/nginx/)
