# Migracja z Wydatków (3.0.0)

!!! info "Dotyczy wersji 3.0.0"
    Wersja 3.0.0 zastępuje Wydatki fakturami i korektami zakupowymi z Sales Pack. Istniejące Wydatki nie są usuwane – są kopiowane, a każdy Wydatek zachowuje link do dokumentu, do którego został przeniesiony.

## :material-clipboard-check: Zanim zaczniesz

1. **Zrób kopię zapasową bazy danych.**
2. Najpierw uruchom migrację na kopii instancji.
3. Upewnij się, że zainstalowany jest Sales Pack **4.x**.
4. Ustaw **domyślną metodę płatności** w każdym profilu KSeF (używana dla Wydatków ze statusem Paid).
5. Po instalacji wersji 3.0.0 wykonaj **Rebuild** i **Clear Cache**.

## :material-console: Uruchomienie migracji

Uruchom polecenia z katalogu głównego EspoCRM:

```bash
php command.php migrate-expenses-to-supplier-bills --dry-run --limit=20
php command.php migrate-expenses-to-supplier-bills --dry-run
php command.php migrate-expenses-to-supplier-bills
```

| Opcja | Opis |
|---|---|
| `--dry-run` | Przetwarza wszystkie rekordy i pokazuje wynik, ale niczego nie zapisuje. |
| `--limit=N` | Przetwarza tylko N rekordów. |
| `--payment-method=ID` | Metoda płatności dla Wydatków ze statusem Paid, jeśli nie da się jej ustalić automatycznie. |

Polecenie można uruchamiać wielokrotnie. Przeniesione już Wydatki są pomijane.

## :material-swap-horizontal: Co jest przenoszone

Wydatki pobrane z KSeF są odtwarzane z oryginalnego pliku XML, co przy okazji poprawia dane zapisane przez wcześniejsze wersje. Pozostałe Wydatki są kopiowane razem z pozycjami.

| Typ wydatku | Wynik |
|---|---|
| Invoice, Receipt | Faktura zakupowa |
| Korekta zmniejszająca | Korekta zakupowa |
| Korekta zwiększająca | Faktura zakupowa |
| Taxes, Mandatory Insurance, Other | Faktura zakupowa z odpowiednią Kategorią kosztu |
| Order | nie jest przenoszony |

| Status wydatku | Nowy status |
|---|---|
| Draft, Pending, In Review | Wersja robocza |
| Confirmed, Booked | Zatwierdzona |
| Paid | Opłacona, z płatnością i rozliczeniem |
| Rejected, Canceled | Anulowana |

Wydatki bez kontrahenta (np. podatki lub ZUS) są przypisywane do dostawców zbiorczych: „Urząd Skarbowy”, „Zakład Ubezpieczeń Społecznych” lub „Inne zobowiązania”, z kodem podatkowym **Poza VAT**.

## :material-file-search: Jak czytać raport

| Komunikat | Znaczenie |
|---|---|
| `skipped: Expense has no account and no KSeF XML` | Wydatek nie ma dostawcy – uzupełnij go i uruchom migrację ponownie. |
| `grand total … differs from source …` | Nowa suma różni się od dokumentu źródłowego. Sprawdź rekord. |
| `no items created` | Nie udało się utworzyć pozycji – zgłoś to nam. |
| `payment: No payment method found` | Ustaw domyślną metodę płatności w profilu KSeF albo użyj `--payment-method`. |

## :material-check-all: Po migracji

- Sprawdź kilka przeniesionych dokumentów: pozycje, VAT, sumy i status płatności.
- Każdy Wydatek pokazuje przeniesiony dokument w polu **Faktura zakupowa** lub **Korekta zakupowa**.
- Nowe faktury przychodzące są pobierane do Faktur zakupowych automatycznie.
