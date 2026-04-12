## :material-script-text: Available Methods in KSeF Integration

### `util\ksefIssueInvoice`

*Supported as of version 1.2.0*

This method facilitates the direct issuance of an invoice through the KSeF integration. It is designed to be executed within formulas, making it an essential tool for building and implementing automated invoicing workflows.

**Parameters**

| Parameter | Description |
| :--- | :--- |
| `INVOICE_ID` | The unique identifier of the invoice you intend to issue. |
| `USER_ID` | The identifier of the user or system account authorizing the invoice issuance. |

!!! example "Usage Example"
    ```text
    util\ksefIssueInvoice(INVOICE_ID, USER_ID)
    ```
