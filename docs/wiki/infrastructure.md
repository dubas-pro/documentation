# Our Infrastructure

We’ve built our infrastructure to be cost-effective, reliable, and scalable. Here’s a breakdown of how we’ve set things up:

## Server Setup
We rely on **Hetzner** as our server provider. Our setup includes a **VPS with 4vCPU Arm64, 8 GB RAM, and 80 GB of local disk space**. At just **5.99 EUR per month**, it’s an incredibly affordable solution that meets our needs without breaking the bank.

## Configuration
Our EspoCRM instance runs as a **Docker container**, which allows us to keep things lightweight and efficient. We’ve customized our stack to optimize performance, making EspoCRM faster and more flexible. Instead of relying on traditional cron jobs, we use **Websockets and Daemon** for real-time updates and smoother operations.

To further enhance our setup, we’ve integrated **external object storage** with EspoCRM. This not only improves performance but also ensures our data is managed efficiently.

## Authentication
For authentication, we use **Authentik** as our **SSO (Single Sign-On) provider**. This centralized authorization system not only secures access to EspoCRM but also manages permissions for multiple other services we use. It’s a seamless and secure way to handle user access across our tools.

## Backups
Data safety is a top priority for us. We back up our EspoCRM instance **daily** to **Azure Blob Storage**. Additionally, we store backups in multiple other locations for redundancy and added security. To manage this process, we use **restic**, a reliable and efficient backup tool that ensures our data is always protected.

This infrastructure has been a game-changer for us, balancing cost, performance, and reliability. If you’re considering a similar setup, we hope this gives you some useful insights!
