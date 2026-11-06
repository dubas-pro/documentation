---
title: Managing Sends
description: Detailed field definitions, access control levels, and record options for Dubas Send.
---

# Managing Send Records

The **Send** entity stores and manages all file-sharing packages created within EspoCRM.

!!! example "Go to Send entity"
    [#Send](https://dubas.pro/redirect/#Send)

---

## Field Definitions

| Field | Technical Name | Description |
| :--- | :--- | :--- |
| **Name** | `name` | Internal title identifying the Send record. |
| **Parent** | `parent` / `parentType`, `parentId` | Linked parent record (e.g., *Account*, *Opportunity*, *Email*, *Note*). |
| **Expiry Date** | `expiryDate` | Expiration date and time. Expired links return a HTTP 404 error. |
| **Status** | `status` | Record status (e.g., *Active*, *Expired*, *Disabled*). |
| **Note** | `note` | Optional text note presented to the recipient on the download page. |
| **Attachments** | `attachments` | Files explicitly attached to this Send record. |
| **Language** | `language` | Interface language for the public file page. |
| **Maximum Access Count** | `maximumAccessCount` | Maximum allowed downloads/views (`0` = unlimited). |
| **Access** | `accessLevel` | Granular permission requirement (see section below). |
| **Force List View** | `forceListView` | Forces the list view layout even if only one file is shared. |
| **Force File Download** | `forceFileDownload` | For single files, bypasses the preview page and triggers immediate download. |
| **Public URL** | `publicUrl` | Auto-generated unique web link to be shared with the client. |
| **Access Token** | `accessToken` | Cryptographic access token securing the endpoint. |
| **Access Count** | `accessCount` | Total number of views/downloads performed by recipients. |

---

## Access Levels (`accessLevel`)

Secure your shares by assigning strict authorization requirements:

* **Public (anyone with the link):** Accessible to anyone possessing the URL.
* **Internal:** Restricted to authenticated internal CRM users.
* **Portal:** Restricted to authenticated Customer Portal users.
* **Authenticated:** Accessible to any logged-in user (CRM or Portal).

!!! note "Account Linking Rules"
    When `Portal` or `Authenticated` access is selected and the Send record is linked to an **Account**, access is limited strictly to portal users associated with that specific Account.
