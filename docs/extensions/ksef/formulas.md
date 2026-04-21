## :material-script-text: Available Methods in KSeF Integration

### `util\ksefIssueInvoice`

*Supported as of version 1.2.0*

This method schedules the issuance of an invoice through the KSeF integration. It is designed to be executed within formulas, making it an essential tool for building and implementing automated invoicing workflows.

**Parameters**

| Parameter | Description |
| :--- | :--- |
| `INVOICE_ID` | The unique identifier of the invoice you intend to issue. Required. |
| `USER_ID` | The identifier of the user or system account authorizing the invoice issuance. Optional. |

**Returns**

An object containing the following properties:

| Property | Type | Description |
| :--- | :--- | :--- |
| `result` | boolean | Indicates whether the invoice was successfully scheduled. |
| `message` | string \| null | Status message or error details, if applicable. |
| `jobId` | string \| null | The job identifier for tracking the asynchronous issuance process. |

!!! example "Usage Example"
    ```text
    util\ksefIssueInvoice(INVOICE_ID)
    ```
