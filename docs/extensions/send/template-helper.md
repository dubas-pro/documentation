---
title: Email Template Integration
description: Automated file sharing via the {{dubasSend}} template helper in EspoCRM email templates.
---

# Email Template Helper (`{{dubasSend}}`)

The Dubas Send extension provides a native HTMLizer helper tag: `{{dubasSend}}`. This tool automatically converts email attachments or parent entity files into secure, trackable Send shares during email dispatch.

---

## Basic Syntax & Usage

The simplest call within an HTML email template requires no additional parameters:

```html
{{dubasSend}}

```

When invoked without explicit options, the helper automatically:

1. Detects `parentType` and `parentId` from the execution context of the email.
2. Copies all attachments linked to the parent entity.
3. Persists a new **Send** record with default configuration (30-day validity).
4. Renders a clean HTML table with download links directly into the email body.

---

## Advanced Usage with Parameters

Customize generated Send parameters directly inside the template tag:

```html
{{dubasSend
    expiryDateThresholdPeriod='14 days'
    maximumAccessCount=5
    forceListView=true
    language='en_US'
    name='Project Documentation'
    note='Please find the requested documentation attached via secure link below.'
}}

```

---

## Complete Parameter Reference

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `expiryDateThresholdPeriod` | `string` | `'30 days'` | Relative threshold period for link expiration from email generation time (e.g., `'7 days'`, `'48 hours'`). |
| `expiryDate` | `string` | `null` | Explicit expiration datetime string (overrides `expiryDateThresholdPeriod`). |
| `maximumAccessCount` | `int` | `0` | Maximum access cap (`0` = unlimited). |
| `forceListView` | `bool` | `null` | Forces list view rendering. Defaults to `true` automatically if attachment count > 1. |
| `forceFileDownload` | `bool` | `false` | For single file shares, forces immediate file download bypassing preview. |
| `language` | `string` | `'en_US'` | Language code for the public file page presented to the recipient (e.g., `'en_US'`, `'pl_PL'`). |
| `name` | `string` | `null` | Custom Send record name. Default pattern: *Attachments: [Parent Name]*. |
| `note` | `string` | `null` | Custom note note text displayed on the file download page. |
| `status` | `string` | `'Active'` | Initial status of the created Send record. |
| `accessToken` | `string` | `null` | Custom access token (automatically generated if omitted). |
| `parentType` | `string` | *Context* | Parent entity type (automatically retrieved from email context). |
| `parentId` | `string` | *Context* | Parent entity ID (automatically retrieved from email context). |

---

## Execution Logic & Safety

* **Note Parent Handling:** If the parent record is a `Note`, the helper checks the parent entity of the note itself and assigns the Send record accordingly.
* **File Size Formatting:** Attachment file sizes in the generated HTML table are formatted into human-readable units (KB, MB).
* **Empty Attachment Fallback:** If no attachments are found on the parent entity, the helper returns an empty string and no Send record is created.
