# Our Infrastructure

We’ve built our infrastructure to be cost-effective, reliable, and scalable. Here’s a breakdown of how we’ve set things up:

## Server Setup
We rely on **Hetzner** as our server provider. Our setup includes a **VPS with 4vCPU Arm64, 8 GB RAM, and 80 GB of local disk space**. At just **5.99 EUR per month**, it’s an incredibly affordable solution that meets our needs without breaking the bank. We're using ansible to automate deployment of our services.

## Configuration
Our EspoCRM instance runs as a **Docker container**, which allows us to keep things lightweight and efficient. We’ve customized our stack to optimize performance, making EspoCRM faster and more flexible. Instead of relying on traditional cron jobs, we use **Websockets and Daemon** for real-time updates and smoother operations.

To further enhance our setup, we’ve integrated **external object storage** with EspoCRM. This not only improves performance but also ensures our data is managed efficiently.

## Authentication
To ensure secure and streamlined access to our services, we leverage **[Authentik](https://goauthentik.io/)** as our **centralized Single Sign-On (SSO) and Identity Provider (IdP)**. This modern, self-hosted solution enhances security while simplifying user management across our entire ecosystem, including **EspoCRM** and other integrated tools.

#### **Key Features & Benefits**
1. **Unified Access Control**
   - Single sign-on (**SSO**) allows users to log in once and access multiple services (e.g., EspoCRM, monitoring dashboards, internal tools) without repeated authentication.
   - Supports **OpenID Connect (OIDC)**, **SAML 2.0**, and **LDAP** for compatibility with most applications.

2. **Enhanced Security**
   - **Multi-Factor Authentication (MFA)**: Enforce MFA (TOTP, WebAuthn, or SMS) for sensitive systems.
   - **Password Policies**: Define complexity rules and expiration periods.
   - **Brute-Force Protection**: Automatically blocks repeated failed login attempts.

3. **Granular Permissions**
   - Role-based access control (**RBAC**) lets admins assign permissions (e.g., read-only vs. admin access) at the user or group level.
   - Integration with **EspoCRM roles** ensures seamless permission synchronization.

4. **Self-Service & Automation**
   - Users can reset passwords or enroll in MFA via a self-service portal.
   - **SCIM** support automates user provisioning/deprovisioning (e.g., revoke access when an employee leaves).

5. **Audit & Compliance**
   - Detailed logs track every authentication attempt, permission change, and admin action.
   - Supports compliance with **GDPR**, **HIPAA**, or other regulatory requirements.

#### **Why Authentik?**
- **Self-Hosted**: Full control over identity data (no reliance on third-party SaaS).
- **Extensible**: Works with legacy apps (via proxy) and modern protocols (OAuth/OIDC).
- **Transparent**: Open-source with active development and community support.

## Backups
Data safety is a **top priority** for our organization. To safeguard against data loss, corruption, or disasters, we implement a **multi-layered backup strategy** that combines automated daily backups, geographic redundancy, and encryption. Here’s how we ensure your data remains secure and recoverable:

#### **Backup Strategy**
1. **Daily EspoCRM Backups**
   - **Frequency**: Full backups of the EspoCRM instance (including databases, configurations, and attachments) are performed **daily**.
   - **Tool**: We use **[restic](https://restic.net/)**, a fast, secure, and deduplication-enabled backup tool, to efficiently store and version backups.
   - **Encryption**: All backups are encrypted *at rest* and *in transit* using AES-256 encryption, ensuring confidentiality.

2. **Redundant Storage Locations**
   - **Primary Storage**: Backups are uploaded to **Azure Blob Storage** (cool tier for cost efficiency) with versioning enabled.
   - **Secondary Copies**: For added resilience, backups are replicated to **at least one additional offsite location** (e.g., another cloud provider or on-premises NAS) to mitigate risks like provider outages or regional failures.

#### **Why Restic & Azure Blob?**
- **Restic**: Open-source, lightweight, and supports incremental backups (saving storage space).
- **Azure Blob**: Enterprise-grade durability (99.999999999% uptime SLA) with built-in redundancy (geo-replication optional).

## Monitoring
To ensure the reliability and availability of our services, we maintain a **self-hosted instance of [Uptime Kuma](https://github.com/louislam/uptime-kuma)**. This lightweight yet powerful monitoring tool allows us to:

- **Track Uptime & Downtime**: Continuously monitor the status of our services via HTTP(S), TCP, Ping, DNS, and more, alerting us immediately if a service goes down.
- **Receive Instant Alerts**: Configure notifications via email, Telegram, Discord, Slack, or other integrations to quickly respond to outages.
- **View Historical Data**: Analyze uptime/downtime trends and performance metrics over time to improve service stability.
- **Monitor Multiple Endpoints**: Keep tabs on various services (web apps, databases, APIs, etc.) from a single dashboard.
- **Self-Hosted & Privacy-Focused**: By hosting Uptime Kuma ourselves, we retain full control over monitoring data and avoid reliance on third-party SaaS platforms.

Our Uptime Kuma dashboard is accessible externally, providing real-time visibility into system health and ensuring we meet our uptime SLAs.

## Summary
This infrastructure has been a game-changer for us, balancing cost, performance, and reliability. If you’re considering a similar setup, we hope this gives you some useful insights!
