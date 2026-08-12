# :material-tools: Profile KSeF

Ta sekcja przeprowadzi Cię przez konfigurację i zarządzanie profilami KSeF. Dzięki ich ustawieniu możesz obsługiwać wiele podmiotów prawnych oraz różne metody uwierzytelniania w jednej instancji EspoCRM.

**Szybki link:** [Otwórz ustawienia profilu KSeF](https://dubas.pro/redirect/#KsefProfile)

---

## :material-book-plus-multiple: Jak skonfigurować profil KSeF

Integracja obsługuje wiele profili KSeF, co umożliwia zarządzanie kilkoma firmami lub oddziałami z jednego centralnego pulpitu.

1. Przejdź do sekcji **Administracja**.
2. Wyszukaj **Ustawienia KSeF** i otwórz tę sekcję.
3. Kliknij, aby utworzyć nowy **Profil KSeF**, korzystając z poniższej specyfikacji pól.

### :material-book-information-variant: Opis pól

#### Przegląd

* **Nazwa:** Wewnętrzna nazwa wyświetlana (zalecane jest użycie pełnej nazwy firmy).
* **Status:** Ustaw na **Aktywny**, aby włączyć profil do synchronizacji.
* **NIP:** Wprowadź swój numer identyfikacji podatkowej.
    * *Uwaga: to pole jest zablokowane i nie można go edytować po zapisaniu profilu.*
* **Typ:** Wybierz środowisko KSeF (Produkcja, Demo lub Test), które odpowiada Twoim danym uwierzytelniającym.
* **Typ profilu:** Wybierz **Własny**, jeśli profil reprezentuje Twój podstawowy podmiot gospodarczy.
* **Typ autoryzacji:** Wybierz **Token** lub **Certyfikat** w zależności od preferowanej metody zabezpieczenia.
* **Token:** Wklej token uwierzytelniający wygenerowany w portalu KSeF.
* **Certyfikat autoryzacyjny:** Certyfikat używany do nawiązania bezpiecznego połączenia z platformą KSeF.
* **Certyfikat offline:** Certyfikat używany wyłącznie do podpisywania faktur w trybie offline.

---

#### Dane firmy

* **Nazwa firmy:** Pełna oficjalna nazwa podmiotu, która ma się pojawiać na wystawianych fakturach.
* **Adres:** Pełny adres siedziby do nagłówków faktur.
* **Numer REGON i KRS:** Opcjonalne identyfikatory firmy, które mogą zostać umieszczone na fakturze.
* **E-mail i numer telefonu:** Dane kontaktowe widoczne na fakturze dla komunikacji z odbiorcą.

---

#### Koszty (faktury przychodzące)

* **Włącz koszty:** Włącz tę opcję, aby system pobierał faktury przychodzące do EspoCRM.
* **Pobieraj od:** Data początkowa pobierania historycznych danych o fakturach.
* **Twórz konta dla kosztów:** Jeśli opcja jest włączona, system automatycznie utworzy nowy rekord **Konto**, jeśli nie istnieje żaden rekord pasujący do NIP z pobranej faktury.
* **Przypisz koszty do:** Określ domyślnego użytkownika, do którego będą przypisywane nowo zaimportowane koszty.

!!! warning "Dopasowanie kont i zarządzanie NIP"
    Aby dowiedzieć się, jak integracja identyfikuje istniejące konta i zapobiega duplikatom, [przeczytaj ten szczegółowy artykuł](./accounts.md).

---

#### Faktury (faktury wychodzące)

* **Włącz faktury:** Włącz tę opcję, aby umożliwić wysyłanie i wystawianie faktur przez EspoCRM przy użyciu tego profilu.
* **Domyślna metoda płatności:** Ustaw domyślną metodę płatności (np. przelew bankowy) dla faktur wystawianych w ramach tego profilu.
* **Domyślny kanał płatności:** Ustaw domyślne konto bankowe lub kanał. Jeśli skonfigurowano, zostanie to bezpośrednio odwzorowane w oficjalnym schemacie XML KSeF. `Dostępne do wersji 2.0.0`
* **Domyślne konta bankowe:** Ustaw domyślne konta, które zostaną skopiowane do faktury, jeśli reguła jest poprawnie ustawiona. `Dostępne od wersji 2.0.0`
* **Dodatkowe informacje:** Wybierz, jakie metadane (e-mail klienta, telefon, numery referencyjne itp.) mają zostać dodane do faktury KSeF.
