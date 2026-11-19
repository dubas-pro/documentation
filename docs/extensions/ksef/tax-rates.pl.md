## :octicons-number-24: Stawki podatkowe w integracji KSeF

*Od wersji 1.2.0*

Aby zapewnić pełną zgodność między integracją KSeF a rozszerzeniem [Sales Pack](https://dubas.pro/link/sp), wprowadziliśmy kompleksową obsługę stawek podatkowych. Dzięki temu dane podatkowe są prawidłowo mapowane podczas przesyłania faktur do Krajowego Systemu e-Faktur.

---

## :octicons-gear-24: Konfiguracja Sales Pack

!!! danger "Mandatory Requirement"
    Włączenie obsługi **Tax Code** w Sales Pack jest bezwzględnie wymagane do prawidłowego wystawiania faktur przez KSeF. Brak tej opcji może spowodować błędy walidacji podczas eksportu.

### Włączanie kodów podatkowych
Po włączeniu można wybierać wyłącznie zdefiniowane wcześniej kody podatkowe dla poszczególnych pozycji, co zapewnia spójność danych w dokumentach.

#### Szybka konfiguracja
Możesz przejść bezpośrednio do ustawień, korzystając z tego skrótu:
[#Admin/salesPackSettings](https://dubas.pro/redirect/#Admin/salesPackSettings) — zaznacz pole **Tax Codes** i kliknij **Save**.

#### Ręczna konfiguracja krok po kroku
1. Przejdź do **Administration**.
2. Wyszukaj `Sales Pack` i wybierz **Settings**.
3. Znajdź pole **Tax Codes**, upewnij się, że jest zaznaczone, i kliknij **Save**.

Po aktywacji możesz zarządzać stawkami w encji [Tax Codes (shortcut)](https://dubas.pro/redirect/#TaxCode).

---

## :octicons-plus-circle-24: Ręczne tworzenie kodów podatkowych

Podczas tworzenia lub edycji kodów podatkowych używanych w integracji KSeF należy powiązać wewnętrzną stawkę z oficjalną klasyfikacją KSeF:

1. Otwórz rekord **Tax Code**.
2. Znajdź pole **KSeF Rate** w panelu po prawej stronie.
3. Wybierz odpowiednią stawkę z listy rozwijanej, aby zapewnić prawidłowe mapowanie.

!!! warning "Stawka i Stawka KSeF muszą do siebie pasować"
    VAT wyliczony przez EspoCRM musi zgadzać się ze Stawką KSeF kodu podatkowego. Na przykład kod ze stawką 23% musi mieć Stawkę KSeF `23`, a kody ze Stawką KSeF `zw`, `np`, `oo` lub `0%` muszą mieć stawkę 0%. Jeśli wartości się nie zgadzają, faktura nie zostanie wysłana do KSeF.

### Którą Stawkę KSeF wybrać

| Stawka KSeF | Zastosowanie |
|---|---|
| `23`, `22`, `8`, `7`, `5`, `4`, `3` | Stawka podstawowa i stawki obniżone |
| `0 KR` | 0% – dostawa krajowa |
| `0 WDT` | 0% – wewnątrzwspólnotowa dostawa towarów; nabywca musi mieć numer VAT UE |
| `0 EX` | 0% – eksport |
| `zw` | Zwolnienie – faktura musi zawierać podstawę prawną zwolnienia |
| `oo` | Krajowe odwrotne obciążenie |
| `np I` | Sprzedaż poza terytorium kraju |
| `np II` | Usługi dla podatników z UE (art. 100 ust. 1 pkt 4) |

Przy stawkach `oo` i `np II` adnotacja „odwrotne obciążenie” jest dodawana do faktury automatycznie.

---

## :octicons-download-24: Import domyślnych polskich kodów podatkowych

Aby przyspieszyć konfigurację, udostępniamy gotowy plik CSV zawierający standardowe polskie stawki podatkowe przypisane do wymagań KSeF.

### Instrukcje importu

1. **Pobierz:** [Pobierz plik CSV](http://cdn.dubas.pro/csv/Ksef_TaxCode.csv).
2. **Przejdź:** Otwórz sekcję [Import (shortcut)](https://dubas.pro/redirect/#Admin/import) w panelu Administracja.
3. **Wybór encji:** Jako encję docelową wybierz `Tax Codes`.
4. **Prześlij:** Dołącz pobrany plik CSV.
5. **Dalej:** Przewiń na dół i kliknij **Next**.
6. **Sprawdź:** Zweryfikuj mapowanie pól na ekranie podsumowania.
7. **Zakończ:** Przewiń w dół i kliknij **Run import**.

!!! success "Weryfikacja"
    Po zakończeniu importu sprawdź listę Tax Codes, aby upewnić się, że pole `KSeF Rate` jest uzupełnione dla każdego zaimportowanego rekordu.
