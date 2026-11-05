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
5. Kliknij `Wyślij przez KSeF`.

Korygowana faktura musi mieć już numer KSeF.

## :material-shield-check: Walidacja

Przed zapisem i przed wysyłką integracja sprawdza, czy korekty nie przekraczają faktury:

- każda pozycja musi występować na korygowanej fakturze,
- łączna wartość korekt danej pozycji nie może przekroczyć jej wartości na fakturze,
- przy zwrotach (ta sama cena jednostkowa co na fakturze) ilość korekt nie może przekroczyć ilości na fakturze,
- uwzględniane są wszystkie wcześniejsze korekty faktury, poza anulowanymi.

Przykład: po obniżce ceny o 81,30 na fakturze 10 × 100,00 pełny zwrot 10 × 100,00 zostanie odrzucony, bo pozostała wartość to 918,70.

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
