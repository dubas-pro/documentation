# Website Chat Widget (Web Chat)

The website chat widget is a lightweight, standalone JavaScript interface embedded on host websites or directly inside EspoCRM pages.

---

## 1. Embedding & Allowed Domains

- **Embed Code:** One-line script generated directly on the widget record.
- **Domain Security (`allowedDomains`):** Controls which sites may embed the widget via CSP `frame-ancestors`. The CRM itself is always allowed, enabling the widget to run on CRM pages.

---

## 2. Look and Feel

- **Themes:** 5 built-in themes (blue, green, violet, orange, dark) plus a **custom palette** (primary, background, text, separate bubble colors for visitor and agent).
- **Styling Options:** Font family (system, serif, rounded), corner radius, left or right positioning.
- **Multi-language Support:** Default widget language plus per-language locale records overriding texts and labels. Visitors can switch languages directly in the widget.
- **`@key` Translations:** Any form label or widget text can reference translation keys resolved in the visitor's language.
- **Time Format:** 12/24-hour display matching CRM settings.

---

## 3. Pre-Chat Configuration

- **Pre-chat Form Builder:** Text, email, phone, number, date, select, textarea, and checkbox fields. Supports required flags, placeholders, and a "half width" two-column layout.
- **Topic/Category Field:** Can be driven by options from a CRM field (e.g., ticket category) to route chats to specific teams.
- **Consent Checkbox:** Configurable privacy/consent checkbox with custom text.
- **Working Hours:** Custom weekly schedule, EspoCRM working-time calendar, or a combination ("both" or "either" modes), with timezone and holiday list support.

---

## 4. Offline and Bot Fallbacks

- **Offline Mode:** When no agents are available, the widget transforms into a ticket form (with lead reuse or always-new-lead policy, default values, and team assignment) or hides completely.
- **Bot Mode (n8n):** Supports "bot first" or "bot when offline" workflows.

---

## 5. In-Chat Features

- **Uploads & Screenshots:** File uploads and clipboard screenshot pasting with per-widget size limits.
- **Knowledge Base Search:** Native search inside the widget restricted to selected categories. Features *public* and *on-request* articles (visible only after an agent recommends them).
- **Meeting Link:** Integrated button for booking pages or meeting links.
- **Ratings:** Post-conversation rating and feedback comments.
- **Sneak Peek:** Real-time preview of what the visitor is typing before sending. Can be disabled per widget (agents see "…").
- **Abandon Detection:** Automatically closes chats where the visitor left before an agent answered after a set time.

---

## 6. Visitor Tracking & Proactive Chat

- **Live Visitor List:** Real-time list of visitors currently on the website (per widget, opt-in).
- **Proactive Messaging:** Agents can trigger a chat window pop-up for visitors with a configurable validity window.
- **Geolocation:** Approximate country, region, city via geo service, plus visitor timezone.
