# Faktury korygujące w KSeF

!!! info "Nowość w 3.0.0"
    Od wersji 3.0.0 faktury korygujące (Credit Notes) z Sales Pack można wysyłać do KSeF jako faktury korygujące (KOR).

## :material-calculator-variant: Jak wysyłane są korekty

Korekty są wysyłane **metodą różnicową**: każda pozycja korekty staje się jednym wierszem w KSeF zawierającym tylko zmianę, ze znakiem minus.

Przykład – faktura na 3 monitory, klient zwraca 1:

| | W EspoCRM (korekta) | Wysłane do KSeF |
|---|---|---|
| Ilość | 1 | -1 |
| Netto | 100,00 | -100,00 |
| VAT 23% | 23,00 | -23,00 |
| Brutto | 123,00 | -123,00 |

W korekcie wpisujesz wartości dodatnie. Integracja sama dodaje znak minus. Podsumowania VAT są liczone dla każdej stawki z pozycji korekty.

## :material-file-send: Jak wystawić korektę

1. Otwórz fakturę i utwórz z niej korektę albo utwórz korektę i wybierz **Fakturę** korygowaną.
2. Profil KSeF jest kopiowany z faktury automatycznie.
3. Zostaw tylko pozycje, które się zmieniają, i wpisz korygowaną ilość lub kwotę.
4. Uzupełnij **Przyczynę** korekty.
5. Opcjonalnie kliknij `Podgląd KSeF`, aby sprawdzić korektę przed wysyłką. Zobacz [Podgląd przed wysyłką](./invoices.md#podglad-przed-wysyka).
6. Kliknij `Wystaw przez KSeF`.

Korygowana faktura musi mieć już numer KSeF.

## :material-lightbulb-on-outline: Typowe korekty

Poniżej znajdziesz, co wypełnić przy najczęstszych zmianach. Za każdym razem zaczynasz tak samo: otwórz fakturę, utwórz z niej korektę, uzupełnij **Powód korekty** i na końcu kliknij `Wystaw przez KSeF`.

!!! tip "Kilka zmian naraz"
    W polu **Zmiany** możesz zaznaczyć więcej niż jedną opcję, np. nowy numer i nowy termin płatności w jednej korekcie.

### Błędny numer faktury

Faktura poszła z błędnym numerem, np. `FV/12/2026` zamiast `FV/21/2026`.

| Pole | Wartość |
|---|---|
| Zmiany | tylko **Numer faktury** (odznacz **Pozycje**) |
| Poprawny numer faktury korygowanej | `FV/21/2026` |
| Pozycje | brak |
| Powód korekty | Błędny numer faktury |

Korekta jest wysyłana na kwotę **0,00**. Kwoty i VAT się nie zmieniają.

### Błędne daty

**Błędna data wystawienia**

| Pole | Wartość |
|---|---|
| Zmiany | tylko **Data wystawienia** (odznacz **Pozycje**) |
| Prawidłowa data wystawienia | właściwa data |
| Pozycje | brak |

Poprawna data trafia do opisu przyczyny korekty, bo KSeF nie ma na nią osobnego pola. Kwota **0,00**.

**Nowy termin płatności**

| Pole | Wartość |
|---|---|
| Zmiany | tylko **Termin płatności** (odznacz **Pozycje**) |
| Termin płatności | nowy termin |
| Pozycje | brak |

Kwota **0,00**, nowy termin płatności trafia do KSeF.

!!! info "Data sprzedaży"
    Korekta zmieniająca wyłącznie datę sprzedaży (dostawy) nie jest jeszcze dostępna. [Skontaktuj się z nami](https://dubas.pro/form/contact), jeśli jej potrzebujesz.

### Mniej sztuk (zwrot)

Faktura: 10 szt. po 100,00 netto, VAT 23%. Klient zwraca 3 sztuki.

| Pole w pozycji korekty | Wartość |
|---|---|
| Ilość | 3 |
| Cena jednostkowa | 100,00 – **taka sama jak na fakturze** |
| Netto | 300,00 |
| VAT 23% | 69,00 |
| Brutto | 369,00 |

W polu **Zmiany** zostaw zaznaczone **Pozycje** i zostaw na liście tylko zwracaną pozycję. Nie da się zwrócić więcej sztuk, niż było na fakturze – liczą się też wcześniejsze korekty. Po tym zwrocie na pozycji zostaje 7 sztuk.

### Niższa cena (rabat)

Faktura: 10 szt. po 100,00 netto, VAT 23%. Cena spada do 91,87.

Wpisz **różnicę**, a nie nową cenę: 100,00 − 91,87 = **8,13** na sztuce.

| Pole w pozycji korekty | Wartość |
|---|---|
| Ilość | 10 |
| Cena jednostkowa | 8,13 |
| Netto | 81,30 |
| VAT 23% | 18,70 |
| Brutto | 100,00 |

Jeśli rabat jest jedną kwotą na całą pozycję, wpisz ilość **1** i kwotę rabatu jako cenę (1 × 81,30). Efekt w VAT jest taki sam.

Przy zmianie ceny integracja sprawdza wartość pozycji, a nie liczbę sztuk. Po tym rabacie na pozycji zostaje 918,70, więc późniejszy zwrot wystaw po cenie po rabacie (91,87).

!!! warning "Więcej sztuk lub wyższa cena"
    Korekty zwiększające kwotę nie są jeszcze dostępne – zobacz [Ograniczenia](#ograniczenia).

## :material-shield-check: Walidacja

Przed zapisem i przed wysyłką integracja sprawdza, czy korekty nie przekraczają faktury:

- każda pozycja musi występować na korygowanej fakturze,
- łączna wartość korekt danej pozycji nie może przekroczyć jej wartości na fakturze,
- przy zwrotach (ta sama cena jednostkowa co na fakturze) ilość korekt nie może przekroczyć ilości na fakturze,
- uwzględniane są wszystkie wcześniejsze korekty faktury, poza anulowanymi.

Przykład: po obniżce ceny o 81,30 na fakturze 10 × 100,00 pełny zwrot 10 × 100,00 zostanie odrzucony, bo pozostała wartość to 918,70.

Przed wysyłką integracja sprawdza również, czy:

- identyfikator podatkowy nabywcy nie zmienił się od wystawienia faktury – korekta musi wskazywać tego samego nabywcę co faktura korygowana,
- kwota VAT każdej pozycji zgadza się z jej stawką KSeF, tak samo jak przy [fakturach](./invoices.md). Pozycja zmieniająca wyłącznie kwotę VAT (netto 0,00) jest dozwolona – użyj jej, aby poprawić VAT wykazany przez pomyłkę.

## :material-file-multiple: Kilka korekt do jednej faktury

Każda korekta jest niezależna i zawsze wskazuje fakturę pierwotną. Możesz wystawić dowolnie wiele korekt w opisanych wyżej granicach.

## :material-file-edit: Korekty bez zmiany pozycji

Jeśli zmieniają się tylko dane faktury (np. adres nabywcy), odznacz opcję **Pozycje** w polu **Zmiany** i zostaw korektę bez pozycji. Korekta zostanie wysłana z kwotą 0,00.

!!! warning "Błędny NIP"
    Błędnego NIP nabywcy nie da się poprawić korektą. Wystaw korektę do zera i nową fakturę na właściwego nabywcę.

## :material-cash-refund: Rozliczenie po korekcie

- **Faktura nie jest opłacona** – rozlicz korektę z fakturą, a klient zapłaci pozostałą kwotę.
- **Faktura jest już opłacona** – utwórz płatność wychodzącą (zwrot) i rozlicz ją z korektą.

Statusy zmieniają się automatycznie na **Opłacona** / **Rozliczona**, gdy dokumenty zostaną rozliczone w całości.

## :material-alert-outline: Ograniczenia

- Korekty zwiększające (Debit Notes) nie są jeszcze wysyłane do KSeF.
- Korekty zbiorcze za okres (np. rabat roczny) nie są obsługiwane. Jedna korekta koryguje jedną fakturę.
- Faktur wystawionych poza KSeF (bez numeru KSeF) nie można jeszcze korygować przez KSeF.
- Korekty danych nabywcy są wysyłane bez sekcji danych „przed korektą” (Podmiot2K).
