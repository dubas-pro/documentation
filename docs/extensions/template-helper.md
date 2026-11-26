# Dubas Template Helper for EspoCRM
Template helpers for EspoCRM PDF and email templates: translations, amounts and numbers in words, Polish plural forms, dates, currencies, VAT, tax identifiers, bank accounts, address blocks and customizable QR codes (including payment QR codes).

## :material-book-plus-multiple: Getting started
1. Download the installer from our [website](https://devcrm.it/template-helper);
2. Install the extension;
3. Open the template manager for PDFs or emails;
4. Create a new template for testing purposes;
5. Use one of the helpers delivered by the extension. All available helpers are described below.

### Requirements
+ EspoCRM 10.x;
+ PHP `intl` extension (required by spelling, plural forms, dates and currency formatting).

### General rules
+ **Parameters** are passed as `name="value"` or `name=fieldName` (the value of a record field).
+ **Language** parameters take ICU locale codes, e.g. `en_US`, `pl_PL`, `de_DE`. The default is `en_US`.
+ **Numbers** can be raw numbers or values formatted with the decimal mark and thousand separator set in EspoCRM settings (e.g. `1 234,56`).
+ **Boolean** parameters accept `true`/`false`, `1`/`0` and `yes`/`no`.
+ **Missing or invalid input** makes a helper print nothing instead of breaking the template.

!!! tip "Plural forms"
    Several helpers accept word forms separated with `|`. The number of forms decides how they are used:

    | Forms | Meaning | Example |
    |---|---|---|
    | 1 | always the same word | `PLN` |
    | 2 | one \| other (English) | `dollar|dollars` |
    | 3 | one \| few \| many (Polish, Czech, Ukrainian…) | `złoty|złote|złotych` |
    | 4 | one \| few \| many \| other | `złoty|złote|złotych|złotego` |

    The correct form is chosen by the plural rules of the `language` parameter.

---

## :material-translate: Translations

### dubasTranslate
Prints the label of a field (or any label from the Label Manager) in a specific language.

`{{dubasTranslate scope='Task' category='fields' label='createdAt' language='de_DE'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| `scope` | yes | – | Scope from the Label Manager |
| `category` | yes | – | Category within the scope, e.g. `fields`, `labels` |
| `label` | yes | – | Label name to translate |
| `language` | no | `en_US` | Target language |

### dubasTranslateOption
Prints the label of an option of an enum-type field.

`{{dubasTranslateOption scope='Task' field='status' value='Canceled' language='de_DE'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| `scope` | yes | – | Scope from the Label Manager |
| `field` | yes | – | Name of the field with options |
| `value` | yes | – | Option value |
| `language` | no | `en_US` | Target language |

### dubasTranslateValue
Loads a record and prints the translated label of the current value of its enum-type field.

`{{dubasTranslateValue id scope='Task' field='status' language='pl_PL'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Record ID |
| `scope` | yes | – | Entity type of the record |
| `field` | yes | – | Name of the field with options |
| `language` | no | `en_US` | Target language |

### dubasTranslateAddressField
Translates the country of a DubasAddress field.

`{{dubasTranslateAddressField addressCountry language='pl_PL'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Country part of the DubasAddress field: the field name with the `Country` suffix (for a field called `address`, use `addressCountry`) |
| `language` | no | `en_US` | Target language |

!!! note
    Translation helpers switch the language only for their own output. The rest of the template keeps its language.

---

## :material-numeric: Numbers and amounts

### dubasSpellAmount
Spells an amount in words, with correctly inflected currency names.

```handlebars
{{dubasSpellAmount amount}}
{{dubasSpellAmount amount language='pl_PL' leftOperandText='złoty|złote|złotych' rightOperandText='grosz|grosze|groszy' separator='i'}}
{{dubasSpellAmount amount language='pl_PL' leftOperandText='złoty|złote|złotych' fractionFormat='digits'}}
```

For an amount of `123.45` the examples above print:

+ `one hundred twenty-three dollars and forty-five cents`
+ `sto dwadzieścia trzy złote i czterdzieści pięć groszy`
+ `sto dwadzieścia trzy złote 45/100`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Amount (use a currency-type field) |
| `leftOperandText` | no | `dollar|dollars` | Forms of the main currency unit |
| `rightOperandText` | no | `cent|cents` | Forms of the fractional unit |
| `separator` | no | `and` | Word between the main and fractional part |
| `fractionFormat` | no | `words` | `words` or `digits` (prints e.g. `45/100`, common on Polish invoices) |
| `language` | no | `en_US` | Language of the words |

Negative amounts are prefixed with the localized word for minus.

### dubasSpellNumber
Spells a number in words.

`{{dubasSpellNumber quantity language='pl_PL'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Number |
| `language` | no | `en_US` | Language of the words |

### dubasPlural
Prints the word form matching a number.

```handlebars
{{dubasPlural quantity forms='piece|pieces'}}
{{dubasPlural quantity forms='sztuka|sztuki|sztuk' language='pl_PL' withNumber=true}}
```

For `5` the second example prints `5 sztuk`.

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Number |
| `forms` | yes | – | Word forms separated with `|` (see *Plural forms* above) |
| `language` | no | `en_US` | Language whose plural rules are used |
| `withNumber` | no | `false` | Print the number before the word |

### dubasCurrency
Formats an amount with the currency symbol according to the locale.

`{{dubasCurrency amount currency=amountCurrency language='pl_PL'}}` → `1 234,56 zł`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Amount |
| `currency` | no | system default currency | ISO 4217 code, e.g. `PLN`, `EUR` |
| `decimals` | no | currency default | Number of decimal places |
| `language` | no | `en_US` | Locale used for formatting |

### dubasVat
Calculates gross, net or VAT amounts.

```handlebars
{{dubasVat amount rate=23 mode='gross' language='pl_PL'}}
{{dubasVat amount rate=8 mode='vatFromGross' raw=true}}
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Amount |
| `rate` | no | `23` | VAT rate in percent |
| `mode` | no | `gross` | `gross` (net → gross), `net` (gross → net), `vatFromNet`, `vatFromGross` |
| `decimals` | no | `2` | Rounding precision |
| `language` | no | `en_US` | Locale used for number formatting |
| `raw` | no | `false` | Print a plain number (`1234.56`) without locale formatting |

---

## :material-calendar: Dates

### dubasDateFormat
Formats a date or date-time using an ICU pattern, with month and day names in the chosen language.

```handlebars
{{dubasDateFormat dateInvoiced pattern="d MMMM y" language='pl_PL'}}
{{dubasDateFormat createdAt pattern="EEEE, d MMMM y, HH:mm" language='en_US' timezone='Europe/London'}}
```

The first example prints e.g. `25 listopada 2026`.

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Date (`YYYY-MM-DD`) or date-time (`YYYY-MM-DD HH:MM:SS`) |
| `pattern` | no | `d MMMM y` | [ICU date pattern](https://unicode-org.github.io/icu/userguide/format_parse/datetime/#date-field-symbol-table) |
| `language` | no | `en_US` | Language of month and day names |
| `timezone` | no | system time zone | Time zone for date-time values |

Useful pattern symbols:

| Symbol | Output |
|---|---|
| `d` / `dd` | day `5` / `05` |
| `MM` | month `11` |
| `MMMM` | month name in the form used in dates (e.g. Polish `listopada`) |
| `LLLL` | stand-alone month name (e.g. Polish `listopad`) |
| `y` | year `2026` |
| `EEEE` | weekday name |
| `HH:mm` | 24-hour time |
| `'text'` | literal text, e.g. `'r.'` |

!!! note
    Date-time values are treated as UTC (as stored by EspoCRM) and converted to the `timezone`. Date-only values are not shifted.

---

## :material-card-account-details: Identifiers and bank accounts

### dubasTaxId
Formats (and optionally validates) Polish company identifiers.

```handlebars
{{dubasTaxId vatNumber type='nip'}}              → 123-456-32-18
{{dubasTaxId vatNumber type='nip' vatEu=true}}   → PL1234563218
{{dubasTaxId regon type='regon' validate=true}}  → 123 456 785
{{dubasTaxId krs type='krs'}}                    → 0000012345
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Identifier, with or without separators |
| `type` | no | `nip` | `nip`, `regon` (9 or 14 digits) or `krs` |
| `validate` | no | `false` | Check the control digit; an invalid number prints nothing |
| `vatEu` | no | `false` | For NIP: print in EU VAT format (`PL` + digits) |

### dubasIban
Formats (and optionally validates) a bank account number.

```handlebars
{{dubasIban bankAccount}}               → PL61 1090 1014 0000 0712 1981 2874
{{dubasIban bankAccount style='nrb'}}   → 61 1090 1014 0000 0712 1981 2874
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | IBAN or a domestic number without a country code |
| `style` | no | `iban` | `iban` (groups of 4 with country code) or `nrb` (Polish domestic format) |
| `country` | no | `PL` | Country code added when the number has none |
| `validate` | no | `false` | Check the IBAN checksum; an invalid number prints nothing |

---

## :material-qrcode: QR codes

### dubasQrCode
Generates a QR code for any text, e.g. a link to an online invoice.

```handlebars
{{dubasQrCode "https://devcrm.it"}}
{{dubasQrCode siteUrl style='dots' finderStyle='circle' color='#5c6bc0' background='transparent' size='30mm'}}
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* or `text` | yes | – | Content of the code |
| `alt` | no | `QR` | Alternative text of the image |

The helper also accepts all [style parameters](#qr-style-parameters).

### dubasPaymentQr
Generates a payment QR code that banking apps can scan to fill in a transfer.

```handlebars
{{dubasPaymentQr standard='zbp' account='PL61 1090 1014 0000 0712 1981 2874' nip='1234563218'
    recipient='Dubas' title=number amount=grandTotalAmount size='35mm'}}

{{dubasPaymentQr standard='epc' account='DE89 3704 0044 0532 0130 00' bic='COBADEFFXXX'
    recipient='Dubas GmbH' title=number amount=grandTotalAmount}}
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| `standard` | no | `zbp` | `zbp` (Polish banks, PLN) or `epc` (SEPA, EUR) |
| `account` | yes | – | Recipient's account number |
| `amount` | no | `0` | Amount to pay |
| `recipient` | no | – | Recipient's name |
| `title` | no | – | Transfer title, e.g. invoice number |
| `nip` | no | – | Recipient's NIP (ZBP only) |
| `bic` | no | – | Recipient's BIC (EPC only, optional) |
| `alt` | no | `QR` | Alternative text of the image |

The helper also accepts all [style parameters](#qr-style-parameters).

Limits of the standards:

| | ZBP | EPC |
|---|---|---|
| Account | 26-digit Polish number | any IBAN |
| Amount | 0.00 – 9 999.99 | 0.01 – 999 999 999.99 EUR |
| Recipient | 20 characters | 70 characters |
| Title | 32 characters | 140 characters |

Longer texts are shortened automatically. If the account or amount does not fit the standard, the helper prints nothing and writes a warning to the EspoCRM log. EPC codes always use error correction level `M`, as the standard requires.

!!! warning
    Before using a payment QR code on real invoices, scan a test document with the banking apps your customers use.

### QR style parameters
Both QR helpers accept these parameters:

| Parameter | Default | Values |
|---|---|---|
| `style` | `rounded` | `rounded` (modules merged into smooth shapes), `dots`, `square` |
| `finderStyle` | `rounded` | Shape of the three corner markers: `rounded`, `circle`, `square` |
| `color` | `#000000` | Color of the modules |
| `finderColor` | same as `color` | Color of the corner markers' outer ring |
| `finderInnerColor` | same as `finderColor` | Color of the corner markers' center |
| `background` | `#ffffff` | Background color or `transparent` |
| `margin` | `2` | Quiet zone in modules (0–10) |
| `ecc` | `M` | Error correction level: `L`, `M`, `Q`, `H` |
| `size` | `120px` | Width and height with a unit: `px`, `mm`, `cm`, `pt`, `in` |

Colors accept `#rgb`, `#rrggbb`, `#rrggbbaa`, CSS color names and `rgb()`/`rgba()`.

!!! tip
    Keep enough contrast between `color` and `background`. Light codes on dark backgrounds and very light colors may not scan in some apps.

!!! note
    QR codes are embedded as SVG images, which the default PDF engine (Dompdf) supports.

---

## :material-format-text: Text and addresses

### dubasAddressBlock
Prints an address with lines ordered according to the country.

```handlebars
{{dubasAddressBlock street=billingAddressStreet postalCode=billingAddressPostalCode
    city=billingAddressCity state=billingAddressState country=billingAddressCountry}}
```

| Parameter | Required | Default | Description |
|---|---|---|---|
| `street` | no | – | Street; multiple lines are kept |
| `postalCode` | no | – | Postal code |
| `city` | no | – | City |
| `state` | no | – | State or region |
| `country` | no | – | Country name or two-letter code |
| `format` | no | detected from `country` | Force the format by country code, e.g. `US`, `GB`, `PL` |
| `showCountry` | no | `true` | Print the country as the last line |
| `inline` | no | `false` | Join lines with commas instead of line breaks |

Formats:

| Countries | Layout |
|---|---|
| US, CA, AU | `City, State Postal` |
| GB, IE | city, region and postal code on separate lines |
| other (PL, DE, FR…) | `Postal City` |

### dubasNl2br
Prints multi-line text (e.g. a description) with line breaks preserved.

`{{dubasNl2br description}}`

### dubasTruncate
Shortens long text.

`{{dubasTruncate description length=80}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Text |
| `length` | no | `100` | Maximum number of characters |
| `ellipsis` | no | `…` | Text added at the end |
| `wordSafe` | no | `true` | Do not cut words in half |

### dubasDefault
Prints a value, or a fallback when the value is empty.

`{{dubasDefault phoneNumber fallback='n/a'}}`

| Parameter | Required | Default | Description |
|---|---|---|---|
| *first argument* | yes | – | Value |
| `fallback` | no | `—` | Text printed when the value is empty |

---

## :material-update: Upgrading from older versions
+ **`dubasSpellAmount`**
    + The defaults changed from `dollars` / `cents` to `dollar|dollars` / `cent|cents`. An amount of 1 now prints `one dollar` instead of `one dollars`.
    + A single word in `leftOperandText` or `rightOperandText` works as before.
    + An empty or non-numeric amount prints nothing instead of `zero dollars and zero cents`.
+ **Translation helpers** no longer change the language of the rest of the template.
+ The extension requires EspoCRM 10.x.

## :material-lifebuoy: Support
This extension is shared without any support. The extension is available as it is.
If you want to order a service, all information about us is available on our website [https://devcrm.it/](https://devcrm.it/).
