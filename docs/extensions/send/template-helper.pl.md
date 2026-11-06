---
title: Integracja z e-mail (Template Helper)
description: Wykorzystanie pomocnika szablonów {{dubasSend}} do automatycznego udostępniania załączników w wiadomościach e-mail.
---

# Integracja z Szablonami E-mail (`TemplateHelper`)

Rozszerzenie Dubas Send dostarcza dedykowany pomocnik szablonów HTMLizer: `{{dubasSend}}`. Pozwala on na automatyczne przekształcanie załączników z wiadomości e-mail lub encji nadrzędnych w bezpieczne udostępnienia Send podczas generowania i wysyłki wiadomości.

---

## Składnia i podstawowe użycie

Podstawowe wywołanie w szablonie wiadomości e-mail nie wymaga podawania dodatkowych parametrów:

```html
{{dubasSend}}

```

W przypadku wywołania bez parametrów pomocnik automatycznie:

1. Odczyta typ (`parentType`) i identyfikator (`parentId`) encji nadrzędnej z kontekstu wiadomości.
2. Skopiuje wszystkie załączniki przypisane do rekordu nadrzędnego.
3. Utworzy nowy rekord w encji **Send** z domyślnym okresem ważności (30 dni).
4. Wyrenderuje w treści maila estetyczną tabelę HTML z listą plików i odnośnikiem do pobrania.

---

## Zaawansowana konfiguracja z parametrami

Możesz dostosować zachowanie i parametry wygenerowanego udostępnienia, przekazując opcje bezpośrednio w tagu:

```html
{{dubasSend
    expiryDateThresholdPeriod='14 days'
    maximumAccessCount=5
    forceListView=true
    language='pl_PL'
    name='Materiały do wyceny'
    note='Dziękujemy za kontakt. Poniżej znajdują się pliki wyceny.'
}}

```

---

## Pełna lista parametrów `{{dubasSend}}`

| Parametr | Typ | Domyślna wartość | Opis |
| --- | --- | --- | --- |
| `expiryDateThresholdPeriod` | `string` | `'30 days'` | Względny okres ważności linku liczony od momentu wygenerowania wiadomości (np. `'7 days'`, `'48 hours'`). |
| `expiryDate` | `string` | `null` | Jawnie określona data wygaśnięcia w formacie ISO (nadpisuje `expiryDateThresholdPeriod`). |
| `maximumAccessCount` | `int` | `0` | Maksymalna dopuszczalna liczba pobrań (wartość `0` oznacza brak limitu). |
| `forceListView` | `bool` | `null` | Wymusza wyświetlenie strony z listą plików. Domyślnie włącza się automatycznie, gdy liczba załączników jest większa niż 1. |
| `forceFileDownload` | `bool` | `false` | Wymusza natychmiastowe pobieranie pliku w przeglądarce przy udostępnieniu pojedynczego elementu. |
| `language` | `string` | `'en_US'` | Kod języka używany na stronie udostępnienia prezentowanej odbiorcy (np. `'pl_PL'`, `'de_DE'`). |
| `name` | `string` | `null` | Własna nazwa rekordu Send. W przypadku braku podania stosowany jest wzorzec: *Pliki: [Nazwa rekordu nadrzędnego]*. |
| `note` | `string` | `null` | Treść notatki wyświetlana odbiorcy na stronie pobierania plików. |
| `status` | `string` | `'Active'` | Status tworzonego rekordu Send (np. `'Active'`). |
| `accessToken` | `string` | `null` | Własny token dostępu (jeśli nie zostanie podany, zostanie wygenerowany bezpieczny hash). |
| `parentType` | `string` | *Kontekst* | Nazwa encji nadrzędnej (automatycznie pobierana z kontekstu e-maila). |
| `parentId` | `string` | *Kontekst* | ID rekordu nadrzędnego (automatycznie pobierane z kontekstu e-maila). |

---

## Logika przetwarzania i bezpieczeństwo

* **Obsługa notatek (Note Parent):** Jeśli rekordem nadrzędnym jest notatka (`Note`), pomocnik automatycznie sprawdzi encję nadrzędną samej notatki i przypisze rekord Send do odpowiedniego obiektu w CRM.
* **Formatowanie rozmiaru plików:** Rozmiary plików w wyrenderowanej tabeli są automatycznie przeliczane na czytelne jednostki (KB, MB).
* **Brak załączników:** Jeśli encja nadrzędna nie posiada żadnych załączników, pomocnik zwraca pusty ciąg znaków i rekord Send nie zostaje utworzony.
