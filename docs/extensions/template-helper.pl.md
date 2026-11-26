# Dubas Template Helper dla EspoCRM
Helpery do szablonów PDF i e-mail w EspoCRM:
+ tłumaczenia;
+ kwoty i liczby słownie;
+ odmiana przez liczbę;
+ daty, waluty i VAT;
+ NIP, REGON, KRS i numery kont;
+ bloki adresowe;
+ konfigurowalne kody QR, także do płatności.

## :material-book-plus-multiple: Pierwsze kroki
1. Pobierz instalator z naszej [strony](https://devcrm.it/template-helper);
2. Zainstaluj rozszerzenie;
3. Otwórz menedżer szablonów PDF lub e-mail;
4. Utwórz nowy szablon do testów;
5. Użyj w szablonie jednego z helperów opisanych poniżej.

### Wymagania
+ EspoCRM 10.x;
+ rozszerzenie PHP `intl` (potrzebne do zapisu słownego, odmiany, dat i formatowania walut).

### Zasady ogólne
+ **Parametry** przekazujesz jako `nazwa="wartość"` lub `nazwa=nazwaPola` (wartość pola rekordu).
+ **Język** podajesz kodem ICU, np. `pl_PL`, `en_US`, `de_DE`. Domyślnie `en_US`.
+ **Liczby** mogą być surowe albo sformatowane wg separatora dziesiętnego i tysięcy ustawionego w EspoCRM (np. `1 234,56`).
+ **Parametry logiczne** przyjmują `true`/`false`, `1`/`0` oraz `yes`/`no`.
+ **Brakujące lub błędne dane** sprawiają, że helper nic nie wypisuje, zamiast psuć szablon.

!!! tip "Odmiana przez liczbę"
    Część helperów przyjmuje formy słowa rozdzielone znakiem `|`. Liczba form decyduje o sposobie użycia:

    | Liczba form | Znaczenie | Przykład |
    |---|---|---|
    | 1 | zawsze to samo słowo | `PLN` |
    | 2 | jeden \| wiele (angielski) | `dollar|dollars` |
    | 3 | jeden \| kilka \| wiele (polski, czeski, ukraiński…) | `złoty|złote|złotych` |
    | 4 | jeden \| kilka \| wiele \| ułamek | `złoty|złote|złotych|złotego` |

    Właściwą formę wybierają reguły języka z parametru `language`.

---

## :material-translate: Tłumaczenia

### dubasTranslate
Wypisuje etykietę pola (lub dowolną etykietę z Menedżera etykiet) w wybranym języku.

`{{dubasTranslate scope='Task' category='fields' label='createdAt' language='de_DE'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| `scope` | tak | – | Zakres z Menedżera etykiet |
| `category` | tak | – | Kategoria w zakresie, np. `fields`, `labels` |
| `label` | tak | – | Nazwa etykiety |
| `language` | nie | `en_US` | Język docelowy |

### dubasTranslateOption
Wypisuje etykietę opcji pola typu lista.

`{{dubasTranslateOption scope='Task' field='status' value='Canceled' language='de_DE'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| `scope` | tak | – | Zakres z Menedżera etykiet |
| `field` | tak | – | Nazwa pola z opcjami |
| `value` | tak | – | Wartość opcji |
| `language` | nie | `en_US` | Język docelowy |

### dubasTranslateValue
Wczytuje rekord i wypisuje przetłumaczoną etykietę aktualnej wartości jego pola typu lista.

`{{dubasTranslateValue id scope='Task' field='status' language='pl_PL'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | ID rekordu |
| `scope` | tak | – | Typ encji rekordu |
| `field` | tak | – | Nazwa pola z opcjami |
| `language` | nie | `en_US` | Język docelowy |

### dubasTranslateAddressField
Tłumaczy kraj z pola DubasAddress.

`{{dubasTranslateAddressField addressCountry language='pl_PL'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Część „kraj” pola DubasAddress: nazwa pola z sufiksem `Country` (dla pola `address` użyj `addressCountry`) |
| `language` | nie | `en_US` | Język docelowy |

!!! note
    Helpery tłumaczeń zmieniają język tylko dla własnego wyniku. Reszta szablonu zachowuje swój język.

---

## :material-numeric: Liczby i kwoty

### dubasSpellAmount
Zapisuje kwotę słownie, z poprawną odmianą nazw waluty.

```handlebars
{{dubasSpellAmount amount}}
{{dubasSpellAmount amount language='pl_PL' leftOperandText='złoty|złote|złotych' rightOperandText='grosz|grosze|groszy' separator='i'}}
{{dubasSpellAmount amount language='pl_PL' leftOperandText='złoty|złote|złotych' fractionFormat='digits'}}
```

Dla kwoty `123.45` powyższe przykłady wypiszą:

+ `one hundred twenty-three dollars and forty-five cents`
+ `sto dwadzieścia trzy złote i czterdzieści pięć groszy`
+ `sto dwadzieścia trzy złote 45/100`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Kwota (użyj pola typu waluta) |
| `leftOperandText` | nie | `dollar|dollars` | Formy jednostki głównej |
| `rightOperandText` | nie | `cent|cents` | Formy jednostki ułamkowej |
| `separator` | nie | `and` | Słowo między częścią główną a ułamkową |
| `fractionFormat` | nie | `words` | `words` lub `digits` (wypisuje np. `45/100`, jak na polskich fakturach) |
| `language` | nie | `en_US` | Język zapisu słownego |

Kwoty ujemne poprzedza słowo „minus” w wybranym języku.

### dubasSpellNumber
Zapisuje liczbę słownie.

`{{dubasSpellNumber quantity language='pl_PL'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Liczba |
| `language` | nie | `en_US` | Język zapisu słownego |

### dubasPlural
Wypisuje formę słowa pasującą do liczby.

```handlebars
{{dubasPlural quantity forms='piece|pieces'}}
{{dubasPlural quantity forms='sztuka|sztuki|sztuk' language='pl_PL' withNumber=true}}
```

Dla `5` drugi przykład wypisze `5 sztuk`.

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Liczba |
| `forms` | tak | – | Formy słowa rozdzielone `|` (patrz *Odmiana przez liczbę*) |
| `language` | nie | `en_US` | Język, którego reguły odmiany są użyte |
| `withNumber` | nie | `false` | Wypisz liczbę przed słowem |

### dubasCurrency
Formatuje kwotę z symbolem waluty zgodnie z ustawieniami regionalnymi.

`{{dubasCurrency amount currency=amountCurrency language='pl_PL'}}` → `1 234,56 zł`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Kwota |
| `currency` | nie | domyślna waluta systemu | Kod ISO 4217, np. `PLN`, `EUR` |
| `decimals` | nie | wg waluty | Liczba miejsc po przecinku |
| `language` | nie | `en_US` | Ustawienia regionalne formatowania |

### dubasVat
Wylicza kwotę brutto, netto lub VAT.

```handlebars
{{dubasVat amount rate=23 mode='gross' language='pl_PL'}}
{{dubasVat amount rate=8 mode='vatFromGross' raw=true}}
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Kwota |
| `rate` | nie | `23` | Stawka VAT w procentach |
| `mode` | nie | `gross` | `gross` (netto → brutto), `net` (brutto → netto), `vatFromNet`, `vatFromGross` |
| `decimals` | nie | `2` | Dokładność zaokrąglenia |
| `language` | nie | `en_US` | Ustawienia regionalne formatowania |
| `raw` | nie | `false` | Wypisz zwykłą liczbę (`1234.56`) bez formatowania regionalnego |

---

## :material-calendar: Daty

### dubasDateFormat
Formatuje datę lub datę z godziną wg wzorca ICU, z nazwami miesięcy i dni w wybranym języku.

```handlebars
{{dubasDateFormat dateInvoiced pattern="d MMMM y 'r.'" language='pl_PL'}}
{{dubasDateFormat createdAt pattern="EEEE, d MMMM y, HH:mm" language='pl_PL' timezone='Europe/Warsaw'}}
```

Pierwszy przykład wypisze np. `25 listopada 2026 r.`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Data (`RRRR-MM-DD`) lub data z godziną (`RRRR-MM-DD GG:MM:SS`) |
| `pattern` | nie | `d MMMM y` | [Wzorzec daty ICU](https://unicode-org.github.io/icu/userguide/format_parse/datetime/#date-field-symbol-table) |
| `language` | nie | `en_US` | Język nazw miesięcy i dni |
| `timezone` | nie | strefa czasowa systemu | Strefa czasowa dla dat z godziną |

Przydatne symbole wzorca:

| Symbol | Wynik |
|---|---|
| `d` / `dd` | dzień `5` / `05` |
| `MM` | miesiąc `11` |
| `MMMM` | nazwa miesiąca w dopełniaczu, jak w datach (`listopada`) |
| `LLLL` | nazwa miesiąca w mianowniku (`listopad`) |
| `y` | rok `2026` |
| `EEEE` | nazwa dnia tygodnia |
| `HH:mm` | godzina w formacie 24-godzinnym |
| `'tekst'` | stały tekst, np. `'r.'` |

!!! note
    Daty z godziną są traktowane jako UTC (tak zapisuje je EspoCRM) i przeliczane na strefę z `timezone`. Same daty nie są przesuwane.

---

## :material-card-account-details: Identyfikatory i numery kont

### dubasTaxId
Formatuje (i opcjonalnie sprawdza) NIP, REGON i KRS.

```handlebars
{{dubasTaxId vatNumber type='nip'}}              → 123-456-32-18
{{dubasTaxId vatNumber type='nip' vatEu=true}}   → PL1234563218
{{dubasTaxId regon type='regon' validate=true}}  → 123 456 785
{{dubasTaxId krs type='krs'}}                    → 0000012345
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Numer, z separatorami lub bez |
| `type` | nie | `nip` | `nip`, `regon` (9 lub 14 cyfr) lub `krs` |
| `validate` | nie | `false` | Sprawdź cyfrę kontrolną; błędny numer nie zostanie wypisany |
| `vatEu` | nie | `false` | Dla NIP: format VAT UE (`PL` + cyfry) |

### dubasIban
Formatuje (i opcjonalnie sprawdza) numer rachunku bankowego.

```handlebars
{{dubasIban bankAccount}}               → PL61 1090 1014 0000 0712 1981 2874
{{dubasIban bankAccount style='nrb'}}   → 61 1090 1014 0000 0712 1981 2874
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | IBAN lub numer krajowy bez kodu kraju |
| `style` | nie | `iban` | `iban` (grupy po 4 znaki z kodem kraju) lub `nrb` (polski format krajowy) |
| `country` | nie | `PL` | Kod kraju dodawany, gdy numer go nie ma |
| `validate` | nie | `false` | Sprawdź sumę kontrolną IBAN; błędny numer nie zostanie wypisany |

---

## :material-qrcode: Kody QR

### dubasQrCode
Generuje kod QR z dowolnego tekstu, np. linku do faktury online.

```handlebars
{{dubasQrCode "https://devcrm.it"}}
{{dubasQrCode siteUrl style='dots' finderStyle='circle' color='#5c6bc0' background='transparent' size='30mm'}}
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* lub `text` | tak | – | Zawartość kodu |
| `alt` | nie | `QR` | Tekst alternatywny obrazka |

Helper przyjmuje też wszystkie [parametry wyglądu](#parametry-wygladu-kodow-qr).

### dubasPaymentQr
Generuje kod QR do płatności. Po zeskanowaniu aplikacja bankowa sama wypełnia przelew.

```handlebars
{{dubasPaymentQr standard='zbp' account='PL61 1090 1014 0000 0712 1981 2874' nip='1234563218'
    recipient='Dubas' title=number amount=grandTotalAmount size='35mm'}}

{{dubasPaymentQr standard='epc' account='DE89 3704 0044 0532 0130 00' bic='COBADEFFXXX'
    recipient='Dubas GmbH' title=number amount=grandTotalAmount}}
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| `standard` | nie | `zbp` | `zbp` (polskie banki, PLN) lub `epc` (SEPA, EUR) |
| `account` | tak | – | Numer rachunku odbiorcy |
| `amount` | nie | `0` | Kwota do zapłaty |
| `recipient` | nie | – | Nazwa odbiorcy |
| `title` | nie | – | Tytuł przelewu, np. numer faktury |
| `nip` | nie | – | NIP odbiorcy (tylko ZBP) |
| `bic` | nie | – | BIC banku odbiorcy (tylko EPC, opcjonalny) |
| `alt` | nie | `QR` | Tekst alternatywny obrazka |

Helper przyjmuje też wszystkie [parametry wyglądu](#parametry-wygladu-kodow-qr).

Limity standardów:

| | ZBP | EPC |
|---|---|---|
| Rachunek | 26-cyfrowy polski numer | dowolny IBAN |
| Kwota | 0,00 – 9 999,99 | 0,01 – 999 999 999,99 EUR |
| Odbiorca | 20 znaków | 70 znaków |
| Tytuł | 32 znaki | 140 znaków |

Dłuższe teksty są skracane automatycznie. Jeśli rachunek lub kwota nie mieszczą się w standardzie, helper nic nie wypisuje i zapisuje ostrzeżenie w logu EspoCRM. Kody EPC zawsze używają poziomu korekcji błędów `M`, zgodnie ze standardem.

!!! warning
    Zanim użyjesz kodu płatności na prawdziwych fakturach, zeskanuj dokument testowy aplikacjami banków, z których korzystają Twoi klienci.

### Parametry wyglądu kodów QR
Oba helpery QR przyjmują poniższe parametry:

| Parametr | Domyślnie | Wartości |
|---|---|---|
| `style` | `rounded` | `rounded` (moduły zlewają się w gładkie kształty), `dots`, `square` |
| `finderStyle` | `rounded` | Kształt trzech znaczników narożnych: `rounded`, `circle`, `square` |
| `color` | `#000000` | Kolor modułów |
| `finderColor` | jak `color` | Kolor zewnętrznej ramki znaczników narożnych |
| `finderInnerColor` | jak `finderColor` | Kolor środka znaczników narożnych |
| `background` | `#ffffff` | Kolor tła lub `transparent` |
| `margin` | `2` | Margines w modułach (0–10) |
| `ecc` | `M` | Poziom korekcji błędów: `L`, `M`, `Q`, `H` |
| `size` | `120px` | Szerokość i wysokość z jednostką: `px`, `mm`, `cm`, `pt`, `in` |

Kolory można podać jako `#rgb`, `#rrggbb`, `#rrggbbaa`, nazwy kolorów CSS albo `rgb()`/`rgba()`.

!!! tip
    Zadbaj o kontrast między `color` a `background`. Jasne kody na ciemnym tle i bardzo jasne kolory mogą nie skanować się w części aplikacji.

!!! note
    Kody QR są osadzane jako obrazy SVG, które domyślny silnik PDF (Dompdf) obsługuje.

---

## :material-format-text: Tekst i adresy

### dubasAddressBlock
Wypisuje adres z liniami ułożonymi zgodnie z krajem.

```handlebars
{{dubasAddressBlock street=billingAddressStreet postalCode=billingAddressPostalCode
    city=billingAddressCity state=billingAddressState country=billingAddressCountry}}
```

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| `street` | nie | – | Ulica; wiele linii jest zachowywanych |
| `postalCode` | nie | – | Kod pocztowy |
| `city` | nie | – | Miejscowość |
| `state` | nie | – | Województwo, stan lub region |
| `country` | nie | – | Nazwa kraju lub dwuliterowy kod |
| `format` | nie | wg `country` | Wymuś format kodem kraju, np. `US`, `GB`, `PL` |
| `showCountry` | nie | `true` | Wypisz kraj w ostatniej linii |
| `inline` | nie | `false` | Połącz linie przecinkami zamiast łamania wierszy |

Formaty:

| Kraje | Układ |
|---|---|
| US, CA, AU | `Miasto, Stan Kod` |
| GB, IE | miasto, region i kod pocztowy w osobnych liniach |
| pozostałe (PL, DE, FR…) | `Kod Miasto` |

### dubasNl2br
Wypisuje tekst wieloliniowy (np. opis) z zachowaniem podziału na linie.

`{{dubasNl2br description}}`

### dubasTruncate
Skraca długi tekst.

`{{dubasTruncate description length=80}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Tekst |
| `length` | nie | `100` | Maksymalna liczba znaków |
| `ellipsis` | nie | `…` | Tekst dodawany na końcu |
| `wordSafe` | nie | `true` | Nie przecinaj słów w połowie |

### dubasDefault
Wypisuje wartość, a gdy jest pusta – tekst zastępczy.

`{{dubasDefault phoneNumber fallback='brak'}}`

| Parametr | Wymagany | Domyślnie | Opis |
|---|---|---|---|
| *pierwszy argument* | tak | – | Wartość |
| `fallback` | nie | `—` | Tekst wypisywany, gdy wartość jest pusta |

---

## :material-update: Aktualizacja ze starszych wersji
+ **`dubasSpellAmount`**
    + Domyślne teksty zmieniły się z `dollars` / `cents` na `dollar|dollars` / `cent|cents`. Kwota 1 daje teraz `one dollar` zamiast `one dollars`.
    + Pojedyncze słowo w `leftOperandText` lub `rightOperandText` działa jak wcześniej.
    + Pusta lub nieliczbowa kwota nie wypisuje nic zamiast `zero dollars and zero cents`.
+ **Helpery tłumaczeń** nie zmieniają już języka reszty szablonu.
+ Rozszerzenie wymaga EspoCRM 10.x.

## :material-lifebuoy: Wsparcie
Rozszerzenie jest udostępniane bez wsparcia technicznego, w stanie „takim, jakie jest”.
Jeśli chcesz zamówić usługę, wszystkie informacje o nas znajdziesz na naszej stronie [https://devcrm.it/](https://devcrm.it/).
