# Dubas Chat: System Overview & Architecture

> A complete conversation layer built natively into EspoCRM: a website chat widget, an agent console, internal team messaging, and secure conversations with customers inside the EspoCRM portal. All of it shares one data model, one security model and one notification system.

---

## At a glance

| | |
|---|---|
| **Platform** | EspoCRM 10+, PHP 8.1+ (extension module, namespace `DubasChat`, v3.x) |
| **Frontend** | Vanilla JavaScript; no build step, no framework in the widget |
| **Real-time** | WebSocket when available, automatic fallback to long-polling |
| **Channels** | Website widget · Agent console · Team chat (internal) · Customer portal |
| **Integrations** | n8n (bot and AI suggestions), Web Push (VAPID), EspoCRM Workflows/BPM, developer hooks |
| **Languages** | Full i18n (English and Polish included); per-widget and per-language text overrides |
| **Security posture** | Untrusted-by-default visitor input, verified identity model, signed URLs, CSP-sandboxed widget, rate limiting, optional antivirus scanning |

---

## Why it exists

Most CRM chat integrations bolt a third-party SaaS widget onto the CRM and sync transcripts after the fact. DubasChat takes the opposite approach: **the conversation lives in the CRM from the first message**. The visitor, the agent, the Contact, the Account, the ticket, the knowledge base and the audit trail are all the same records. No external service holds customer data, and there is no sync to break.

---

## 1. Architecture

### Core design decisions

- **The widget is served from the CRM itself** (or from a dedicated chat domain configured with `dubasChatPublicUrl`) and embedded as an iframe. The host website never touches CRM cookies or APIs.
- **Real-time without infrastructure lock-in.** If EspoCRM WebSocket is enabled, updates are instant. If not, a version-based change tracker with long-polling delivers updates within seconds. Nothing breaks either way.
- **Heavy work happens after the response.** A `Deferred` runner executes hooks, bot calls and notifications after the HTTP response is sent, so visitors and agents never wait for integrations.
- **One write path.** Every message goes through `ConversationStore::write()`, and every status change goes through `ConversationStore::transition()`. Transitions are atomic conditional SQL updates, so two agents clicking "Take" at the same moment can never both win.
- **Lifecycle events are first-class.** Every meaningful change (waiting, assigned, transferred, missed, joined, verified, form submitted, closed and more) is recorded on the conversation. It fires a developer hook and is visible to EspoCRM Workflows and BPM.
- **Files travel as base64 JSON.** Uploads go through a single, auditable code path with type detection, whitelisting and optional malware scanning.

### Module layout (simplified)

- **Entities:** widgets, per-language widget locales, conversations, messages, participants, agent aliases, forms, canned responses, bans, visitors, team chats, team members, team messages, record references, block lists, push subscriptions.
- **Tools:** organised by domain: `Security`, `Widget`, `Visitor`, `Conversation`, `Agent`, `Attachment`, `Bot`, `Form`, `KnowledgeBase`, `Ticket`, `Invite`, `Push`, `TeamChat`, `I18n`.
- **Frontend:** the standalone widget (`loader.js`, `widget.js`), the agent console, shared team-chat logic used by both the console and the portal, a Web Push mixin, a service worker, and a global "watcher" that notifies users anywhere in the CRM.

---

## 2. Identity and Verification

**An email typed into a chat form proves nothing**, so DubasChat never treats it as verified identity.

- By default a conversation is **unverified**. Matching CRM records are only *suggested* to the agent (suggested Contact, Lead, Account) and are never linked automatically.
- A conversation becomes **verified** in one of these ways:
  1. **Verification code:** the agent requests it, and a one-time `XXXX-YYYY` code is delivered to the customer through a developer hook (email, SMS). It is valid for 10 minutes, allows 5 attempts and is stored only as an HMAC.
  2. **Invitation:** the agent creates a chat invite (link and code) addressed to a record's email.
  3. **Agent decision:** the agent explicitly verifies the person.
  4. **Host identity:** the website signs the logged-in user's identity with a per-widget secret (HMAC).
  5. **Portal:** customers chatting from the EspoCRM portal are verified by their CRM login.
- Only after verification are the conversation's Contact, Lead and Account links set for real.
- Contacts or Leads can be created automatically (`createContactAs`), but only from data the system can trust.

---

## 3. Record References & Audit Trail

Every CRM record mentioned in any conversation (team chats and customer chats) is stored as a reference:

- Detected automatically from links pasted into messages (full URLs or `#Entity/view/id`);
- Or **linked manually** by agents from the console;
- Shown with the record's name only to people who can read that record, and as "no access" to everyone else;
- Browsable by administrators with a filter by record (e.g. *"In which conversations was this Opportunity discussed?"*).

---

## 4. Web Push Notifications

Implemented from scratch in PHP, with no third-party push service SDK:

- **VAPID authentication:** Private key stored in internal system config, never exposed in UI.
- **Payload encryption per RFC 8291:** `aes128gcm` done in PHP.
- **Endpoint allowlist:** FCM, Mozilla, WNS, Apple (prevents SSRF).
- **Smart suppression:** No push while active in CRM (activity heartbeat ~35s).
- **Self-cleaning:** Subscriptions dropped after 404/410 errors or 60 days of inactivity; logout removes device subscription.
- **Portal-aware:** Notifications for portal customers open the correct portal URL.

---

## 5. Security Model

- **Public endpoints:** Host/origin checks, CSP with nonce, `frame-ancestors`, rate limits (IP, widget, conversation), minimum form fill time (2.5 s), bans.
- **Session tokens:** 24 random bytes, SHA-256 hashed, bound to device, 24h expiry.
- **Join codes:** Single-use with failure limits per IP/widget.
- **Content & Files:** Untrusted input escaping, spreadsheet injection prevention, file whitelist (no SVG/HTML), MIME content detection, optional **ClamAV** scanning, short-lived signed URLs.
- **Bot integrations:** HTTPS only, private IP blocking, DNS pinning, HMAC signed callbacks with replay protection.
- **Privacy & Retention:** IP/User-Agent anonymisation after retention period (default 180 days), scheduled purging of stale data.

---

## 6. Extensibility for Developers

Exposes clear extension points as standard EspoCRM hooks:

- **Customer chat hooks:** `afterChatEvent`, `afterVerificationRequested`, `afterInviteCreated`, `afterFormSubmitted` / `afterFormDeclined`.
- **Team chat hooks:** `afterTeamMembersAdded`, `afterTeamMessageSent`, `afterTeamFormSubmitted`.
- **Typed Helpers:** Hook results use typed objects (`DeliveryResult`, `FormHookResult`) with size limits.
- **No-code Automation:** EspoCRM Workflows and BPM can react directly to conversation lifecycle events.

---

## 7. Administration

- Configured through regular EspoCRM records and tabbed layouts (General, Agents, Schedule, Appearance, Texts and form, Features, Offline and tickets, Security).
- Permissions use EspoCRM roles with dedicated scopes (console, team chat, thread creation, message editing, portal messaging).
- Scheduled job (every 5 minutes) handles expirations, inactivity closing, abandon sweeps, purges and anonymisation.

---

## 8. Status and Roadmap (v3.x)

**Recently completed:**
- Live support chat inside the EspoCRM portal, with optional per-customer history.
- Record references across customer conversations, with portal-aware links and manual linking.
- Category management and related-record panel in the console.
- In-page image lightbox and a calmer notification sound.

**Planned or in progress:**
- Dedicated "portal agent" permission for staff answering portal support chats.
- Stricter API gating and additional rate limits on portal actions.
- Record-side panel showing all conversations mentioning a given record.
