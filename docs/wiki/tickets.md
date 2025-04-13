# Ticketing System in EspoCRM

Our Ticketing System is a custom-built solution developed within the **EspoCRM** environment. It is designed to streamline communication with customers, manage support requests, and ensure compliance with data privacy regulations such as the **GDPR**. This system is tailored to our internal processes and deeply integrated with other tools in the EspoCRM ecosystem, making it efficient, flexible, and secure.

---

## 1. Background & Evolution

For many years, we relied on the **community edition of OTRS** as our primary ticketing tool. OTRS offered a wide range of useful features and served us well for a long time. However, with the discontinuation of the OTRS Community Edition by its developers, we faced a decision point: adopt a new external ticketing solution or build one that integrates seamlessly with our current environment.

By that time, our operations were already tightly integrated into **EspoCRM**, which we use for managing customer relationships, projects, tasks, and business processes. This made it a natural decision to develop our own **Ticketing System within EspoCRM**—allowing us to tailor functionality exactly to our needs and maintain full control over data and workflows.

---

## 2. Why Not Use the Built-in Case Entity?

EspoCRM includes a **Case** entity, which might seem like a good fit for managing tickets at first glance. However, in our organization, we define "Cases" as more complex, project-like issues that require resolution—such as:

- Coordinating with government institutions
- Preparing and responding to tenders
- Handling multi-step internal or external matters

Cases are structured and tracked differently from simple support or customer queries. That’s why we developed a **dedicated Ticket entity** specifically for:

- Customer support
- Technical issues
- General inquiries
- Day-to-day communication

This separation ensures that our processes remain clear and each entity serves its distinct purpose.

---

## 3. Ticket Entity: Key Features

The **Ticket entity** is designed to be simple yet powerful. It incorporates many features from the Case entity, with additional enhancements for customer interaction and usability.

### Core Fields and Relationships

Each ticket contains the following key fields:

- **Name:** The subject or title of the ticket.
- **Status:** Tracks the current state (e.g., New, In Progress, Pending, Closed).
- **Priority:** Determines urgency and response expectations.
- **Linked Entities:** Tickets can be linked to:
  - **Tasks** (which then appear in the task’s activity stream)
  - **Accounts**
  - **Contacts**
  - **Leads**
- **Description:** A text field for detailed information.
- **Attachments:** Support for uploading files or documents related to the ticket.

This structure enables cross-referencing and full visibility across related business processes.

---

## 4. Email Communication & Automation

We designed the communication process to be intuitive and efficient for our support agents while maintaining professionalism in customer interactions.

### Multiple Email Identities & Templates

- We manage **multiple support email addresses**, each associated with a different language or customer segment.
- The default address is `contact@dubas.pro`.
- A **dropdown menu** allows agents to quickly switch the sender address.
- **Email templates** are dynamically adjusted based on the selected address, ensuring consistent branding and tone across regions.

### Stream-Based Interaction

- **Incoming emails** are parsed into the ticket’s stream, allowing team members to view the entire history of interactions in one place.
- **Replies** are sent directly from the stream interface.
- Messages not marked as **internal** are automatically emailed to the customer using the correct template and formatting.

This approach allows seamless conversation tracking and faster response times.

---

## 5. Multi-Channel Support Access

Customers can interact with our support team through multiple channels:

- **Email Communication:** Replies are automatically added to the ticket stream.
- **Customer Dashboard Chat:** Authenticated customers can view and respond to tickets via our secure client portal. This offers a live, chat-like experience while maintaining full integration with the ticketing backend.

---

## 6. Secure Attachment Management (GDPR Compliant)

Being a **European company**, data privacy and compliance with **GDPR** are top priorities.

### Dubas Send Integration

Instead of sending attachments directly via email, we use our proprietary extension **Dubas Send**:

- **Files are uploaded** to the ticket stream, but are not attached to outbound emails.
- **Secure download links** are inserted into emails instead.
- **Access Control:** These links can be revoked at any time, giving us full control over who can download the file.
- **Support for Large Files:** Since we’re not limited by email attachment size restrictions, larger files can be sent more efficiently.

This ensures both **security** and **compliance**, while providing a better experience for customers and staff alike.

---

## 7. Ticket Escalation and SLA Enforcement

We’ve implemented a system to ensure tickets are addressed in a timely manner, based on their **priority level**.

### Automated Response Time Tracking

- The system automatically calculates a **required response time** based on ticket priority.
- If the assigned user does not respond within this timeframe, an **escalation notification** is sent to their **supervisor**.

This helps maintain high service standards and prevents tickets from being overlooked.

---

## 8. Pending Tickets Workflow

When further action or a customer reply is awaited, tickets can be placed in a **Pending** status.

### Smart Pending Behavior

- A checkbox allows agents to indicate that a reply was sent and the ticket is now waiting.
- If a **specific follow-up date** is set, a **reminder** will be triggered when the date arrives.
- If no date is set, the system automatically **closes the ticket after 7 days** of inactivity.
- Customers are **notified** upon closure and are given the option to **reopen** the ticket simply by replying.

This helps keep the ticket queue clean and manageable while ensuring customers remain informed.

---

## 9. Autoresponders & Work Calendar Integration

Our ticketing system includes **intelligent autoresponders** to improve transparency and customer satisfaction.

### Working Calendar-Based Messaging

- When a ticket is created, the system assigns it to an employee who is currently available, based on the **Working Calendar**.
- The autoresponder includes a **custom message** indicating:
  - The assigned agent’s name
  - Their availability (e.g., “You will receive a reply on the next working day”)
  - Expected wait times

This ensures customers are aware of realistic response times and helps manage expectations.

---

## 10. Roadmap & Future Enhancements

We continuously enhance our Ticketing System to address evolving needs. Here’s what’s planned:

### Support for Multiple Leads per Ticket

Currently, a ticket can be linked to only **one Lead**. However, in real-world scenarios, especially with larger companies, multiple contacts may be involved in the conversation. We plan to introduce:

- Support for **multiple Lead relationships**
- Better handling of **group conversations** across departments and teams

### AI-Driven Categorization and Prioritization

To further streamline support, we’re working on AI features that will:

- **Analyze ticket content**
- Automatically suggest or assign categories
- Predict and set appropriate priority levels

Due to GDPR considerations, we plan to implement this using our **own AI infrastructure**, ensuring full control over data processing and compliance.

---

## Summary

Our Ticketing System inside EspoCRM was built to meet the real-world challenges of customer communication, internal coordination, and regulatory compliance. By embedding it within our core CRM infrastructure, we gain full control, customization, and seamless integration—providing an exceptional experience for both our customers and our team.

As our system continues to evolve, we remain committed to simplicity, security, and efficiency.
