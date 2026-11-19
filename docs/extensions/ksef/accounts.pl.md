# :material-download-box: Zarządzanie kontami w KSeF

Każda faktura wysyłana do KSeF musi wskazywać nabywcę. W EspoCRM ta informacja pochodzi z pola `taxId` na Koncie. Pole składa się z dwóch części: **typu** identyfikatora i samego identyfikatora.

## Typy identyfikatora podatkowego

| Typ | Kiedy go użyć | Co trafia do KSeF |
|---|---|---|
| **NIP** | Polskie firmy i jednoosobowe działalności | Polski NIP |
| **VAT UE** | Nabywcy z innych krajów UE | Numer VAT UE z kodem kraju, np. `DE123456789` |
| **Inny** | Nabywcy spoza UE | Zagraniczny numer podatkowy razem z krajem z adresu rozliczeniowego |
| **Osoba prywatna** | Konsumenci kupujący prywatnie | Brak identyfikatora – faktura jest wystawiana bez numeru podatkowego nabywcy |

!!! warning "Typ jest wymagany"
    Faktury nie da się wysłać do KSeF, jeśli Konto nie ma wybranego typu identyfikatora. Dla konsumentów wybierz **Osoba prywatna** – puste pole typu jest traktowane jako brak danych, a nie jako nabywca prywatny.

!!! info "Identyfikator wymagany dla firm"
    Przy typach **NIP**, **VAT UE** i **Inny** sam identyfikator musi być uzupełniony. Przy typie **Osoba prywatna** nie jest potrzebny – jeśli zostanie wpisany, zostanie pominięty.

## Automatyczne dopasowywanie i tworzenie kont

Gdy KSeF przesyła nową fakturę do EspoCRM, system automatycznie sprawdza widok Konta, aby znaleźć pasującego klienta na podstawie identyfikatora podatkowego z pola `taxId`. Jeśli nie zostanie znalezione pasujące konto, system sprawdza ustawienia profilu KSeF, aby ustalić, czy włączono automatyczne tworzenie kont. Jeśli tak, nowe konto zostaje utworzone automatycznie; w przeciwnym razie faktura jest przetwarzana bez tworzenia nowego konta.

Podczas wystawiania faktur w EspoCRM system wykorzystuje pole `taxId` do wskazania nabywcy podczas transmisji do KSeF. Upewnij się, że każdy klient, któremu wystawiasz fakturę, ma prawidłowy typ i identyfikator podatkowy.

## Dodawanie pola taxId do widoku Konta

Aby dodać pole `taxId` do widoku Konta, wykonaj następujące kroki:

1. Przejdź do sekcji **Administracja** w EspoCRM
2. Przewiń do **Menedżera układu** i otwórz go
3. Wybierz moduł **Konto**
4. Dodaj pole `taxId` do widoku szczegółów

Spowoduje to włączenie opisanej powyżej funkcjonalności identyfikatora podatkowego dla Twoich kont.

!!! example "Jak migrować identyfikator podatkowy z innego pola?"
    Pracujemy nad skryptem, który skopiuje numer podatkowy z innego pola do `taxId`.

Możesz skorzystać z [polecenia konsoli do migracji wartości ze starego pola identyfikatora podatkowego](./console-commands.md).

## Dodatkowe pola

Jeśli chcesz używać któregokolwiek z poniższych pól, dodaj je do widoku szczegółów za pomocą [Menedżera układu](https://dubas.pro/redirect/#Admin/layouts/scope=Account&type=detail).

- `Podmiot jest członkiem grupy VAT` - Określa, czy podmiot należy do grupy VAT. Ustaw tę wartość na `true`, gdy podmiot jest zarejestrowany jako część grupy VAT na potrzeby raportowania podatkowego. Domyślnie `false`. Gdy pole jest zaznaczone, dodaj członka grupy na fakturze w **Dodatkowych podmiotach** z rolą **Członek grupy VAT - odbiorca** – inaczej faktura nie zostanie wysłana.

## Faktury dla jednostek samorządu terytorialnego

Gdy wystawiasz fakturę na gminę lub powiat, ale dotyczy ona jednej z jej jednostek – na przykład szkoły – jako Konto wskaż gminę, a jednostkę dodaj na fakturze w **Dodatkowych podmiotach** z rolą **Jednostka samorządu terytorialnego - odbiorca**. KSeF udostępni wtedy fakturę również tej jednostce.
