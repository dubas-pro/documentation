# Customer Portal

The EspoCRM Customer Portal module adds a dedicated **"Messages"** tab, bringing real-time support and internal messaging to portal users.

---

## 1. Staff Messaging

- **Access Levels:** Per-user portal access controls:
  - *None*
  - *Staff Only*
  - *Staff Plus Company (Account) Peers*
- **Staff Discoverability:** Controls whether portal users can *initiate* chats with staff. Customers can always *reply* to staff who messaged them.
- **Staff Privacy:**
  - Optional suppression of staff read receipts.
  - Profile initials displayed instead of personal avatar photos.
- **Disable Customer Replies:** Staff can disable replies for specific customers at any time while retaining the ability to send outbound messages.
- **Portal Forms:** Send interactive forms in direct messages to update customer Contact records.

---

## 2. Live Support Chat in Portal

- **Widget Enablement:** Any widget marked **"Available in portals"** can serve portal customers.
- **Customer Initiation:** Started via *New Conversation → Customer Support*. Displays offline message outside working hours.
- **Automatic Verification:** Portal support chats are **automatically verified** and linked to the customer's Contact and Account (no pre-chat forms or codes required).
- **Console Integration:** Appears in the agent console as a standard conversation labeled **"Portal"** with full tool availability.
- **Customer UI:** Active support chats are pinned at the top of the portal list with a "Live" badge.
- **Sandboxed KB Reader:** Knowledge base articles open inside an in-page **script-less sandboxed frame**.
- **Transcript Privacy:** By default, completed chats disappear from the customer view upon closing. Admins can enable **"Keep support chat history"** per customer to retain read-only archived transcripts.

---

## 3. Portal Link Security & Permissions

When CRM record links appear in portal conversations (Team Chat or Live Support):

- **Authorized Access:** If the customer's portal role grants read access, the internal URL is transformed into the **record name linking to the portal's view**.
- **Restricted Access:** If unauthorized, the link is rendered as **"🔒 No access"**, ensuring internal CRM URLs never leak to the customer.
