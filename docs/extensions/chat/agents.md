# Agent Console & Team Chat

The agent console is a full-screen workspace inside EspoCRM designed for customer engagement and internal communication.

---

## 1. Inbox & Routing

- **Queues:** Displays **Open** and **Recent** (last 24 hours) conversations; search by `#number`, name, email, or join code.
- **Routing Algorithms:**
  - *Broadcast:* Queue visible to all agents.
  - *Round Robin:* Persistent pointer surviving system restarts for fair distribution.
  - *Least Busy:* Routes to agents with the fewest active conversations.
- **Limits & Timeouts:** Per-agent chat limit and accept timeout settings.
- **Presence States:** Online, Away, Offline with automatic timeout on browser inactivity.
- **Queue Reminders:** Soft audio alerts triggered only when the console tab is in the background.

---

## 2. Conversation Handling

- **Core Actions:** Take, Join, Leave. Atomic SQL updates prevent race conditions when taking chats.
- **Transfers:** Configurable widget policy (never, offline target only, always). Features timeouts, decline/cancel options, and stay-in-chat flags.
- **Invite Colleagues:** Bring additional agents into active chats.
- **Whispers (Internal Notes):** Staff-only notes hidden from customers.
- **Agent Aliases:** Personas with custom display names, titles, and avatars per widget (e.g., "Sales Agent" vs "Support Team").
- **Canned Responses:** Categorized response templates with keyboard shortcuts.
- **Knowledge Base Cards:** Send article cards directly into customer conversations.
- **Ticket Integration:** Create pre-filled tickets (`Case` or custom entities) or link existing ones.
- **AI Reply Suggestions:** AI response prompts generated via n8n bot webhooks.
- **Management:** Mid-chat language switching and category updates with audit notes.
- **Bans:** Visitor/device or IP bans owned by the issuing agent.

---

## 3. Context Panel

The side panel delivers complete customer and session context:

- **Details:** Visitor data, verification state, suggested/linked CRM records, pre-chat answers, submitted forms, rating.
- **Team:** Active participants, transfer status, online colleagues.
- **Session:** Current page URL, title, referrer, IP, user agent, location, timezone.
- **Knowledge Base:** Search and send articles.
- **Related Records:** CRM entities mentioned in chat or linked manually by agents, with message deep-links.

---

## 4. CRM-Wide Notifications

- **Leader-Tab Watcher:** Operates across a single browser tab for the entire CRM, eliminating duplicate audio and visual alerts across multiple tabs.
- **Alert Channels:** Desktop notifications, soft two-tone audio chime, and Web Push for mobile devices and closed browsers.

---

## 5. Forms on Demand

Agents can send dynamic forms directly into live chats:

- **CRM Mapping:** Automatically maps responses to Contact or Lead fields (populates empty fields only from an allowlist).
- **Visitor Identification:** Identifies customers by email and attaches matching records.
- **Lifecycle:** Customers can submit or decline; agents can cancel pending forms.
- **State Preservation:** Drafted field values persist across incoming real-time messages.
- **Hooks:** Triggers external integrations (n8n, order lookups, scheduling) on form submission.

---

## 6. Team Chat (Internal Messaging)

Slack-like internal messaging for staff members.

### Conversations & Threads
- **Direct Messages (DMs):** One permanent conversation per user pair (deterministic ID hash).
- **Group Threads:** Multi-user threads with numeric IDs (`#12`), custom icons, colors, avatars, and backgrounds.
- **Roles & Governance:** Owner and Member roles. Protects the last remaining owner from removal.
- **Lifecycle:** Close, reopen, mute, and per-user archiving (auto-revives on new messages).

### Messaging & Formatting
- **Markdown Editor:** Bold, italic, strikethrough, code blocks, links, lists, quotes, keyboard shortcuts (Ctrl+B/I/K/E).
- **@mentions:** Dedicated unread mention counters.
- **Replies & Permalinks:** Message quoting and one-click timestamp permalinks.
- **Revision History:** Configurable edit window (default 15 mins) with complete revision audit trail for admins. Soft deletes.
- **Read Receipts:** Sent (✓) and Read (✓✓) indicators, plus real-time typing indicators.
- **Side Panels:** Media/document gallery with lightbox and related CRM record references.
