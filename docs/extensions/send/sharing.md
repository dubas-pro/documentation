---
title: Public Sharing Page
description: User experience, file download mechanics, and recipient access restriction pages.
---

# Public Sharing Page

The Public Sharing Page is the web interface displayed when a customer opens the **Public URL**.

---

## File Delivery Behavior

1. **Single File Delivery:** If a single file is shared and `forceListView` is disabled, the browser immediately initiates the file download.
2. **Multiple Files / List View:** If multiple files are shared (or `forceListView` is enabled), recipients are presented with the modern List View interface.

---

## Page Elements

* **Header & Metadata:** Displays sender name, share date, file counter badge, and total file size badge.
* **Introductory Text:** Displays custom global introductory messages or record notes.
* **"Download All" Button:** Allows recipients to download all files in a single ZIP archive.
* **File Table:** Interactive file list showing file type icons, names, individual file sizes, and single download buttons.
* **Security Badges & Footer:** Informational security notes and localized administrative footers.

---

## Access Restrictions & Privacy

For restricted links (`Internal`, `Portal`, `Authenticated`):

* **Login Required Page:** Unauthenticated users see a clean notification indicating required access levels.
* **URL Protection:** Login fallback pages **do not disclose** internal CRM login URLs.
* **Data Leak Prevention:** Unauthorized users cannot inspect file names, attachment counts, or sender notes.
* **Existence Masking:** Expired links return `404 Not Found` without revealing whether the link previously existed.
