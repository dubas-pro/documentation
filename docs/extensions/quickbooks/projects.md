---
title: QuickBooks Projects
summary: Documentation for QuickBooks Projects in Integration for EspoCRM
authors:
    - dubas s.c.
date: 2025-03-19
---
# QuickBooks Projects

QuickBooks Projects entity in QuickBooks Integration are responsible for gathering details under one roof. Unfortunately, QuickBooks doesn't support direct API requests for Projects so we can't create them automatically. If you want to track QuickBooks Projects in EspoCRM, you have to:

1. Create new Project in QuickBooks.
2. Get project ID from link https://qbo.intuit.com/app/projects/projectdetails?id=XXXXXXXXX where XXXXXXXXX is a project ID.
3. Go to EspoCRM and open QuickBooks Projects entity.
4. Create new Project with ID from QuickBooks.

After few seconds or minutes you'll see that new invoices are creating or linking to project in EspoCRM. It'll also sync payments.
