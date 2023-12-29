# PayPal Webhooks

![PayPal Webhooks](../../images/paypal-webhooks.png "PayPal Webhooks")

## :material-book-plus-multiple: How to create your first PayPal Webhooks?

1. Go to **PayPal Webhooks** in Administration section.
2. Create new **PayPal Webhook**.
3. Fill name, choose events which you want to use, change status to **Activate** and leave Listener Url empty.
4. Save.

Now you’re ready to receive information about events in PayPal.

## :material-folder-information-outline: Explanation of fields

1. **Status** – status of webhook. You can check clarification of statuses below.
2. **Event** – events after which PayPal will send information to EspoCRM.
3. **Listener Url** – automatically generate URL for webhooks.
4. **Direct Url** – Direct URL for webhook actions.
5. **Webhook Id** – ID assigned by paypal.
6. **PayPal Webhook Records** – linked webhook records(subentity).

## :material-form-dropdown: Clarification of statuses

1. **Draft** – EspoCRM on this stage will not send any information to PayPal.
2. **Activate** – EspoCRM will send all information about webhook to PayPal.
3. **Active** – on this stage webhook is active.
4. **Remove** – EspoCRM will send request for removal to PayPal.
5. **Removed** – this stage mean that PayPal removed webhook.
6. **Failed** – this stage mean that PayPal couldn’t register webhook.
