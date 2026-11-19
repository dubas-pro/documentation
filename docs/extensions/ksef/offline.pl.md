# :material-wifi-off: Tryb offline

Zdarza się, że KSeF jest niedostępny – serwery Ministerstwa mogą nie działać albo może zawieść Twoje połączenie z internetem. Żebyś mimo to mógł wystawiać faktury, przepisy przewidują **tryb offline24**: faktura jest wystawiana od razu, a do KSeF trafia później, najpóźniej w następnym dniu roboczym.

## :material-certificate: Co jest potrzebne

Tryb offline działa tylko wtedy, gdy profil KSeF ma aktywny **certyfikat Offline**. Jak go uzyskać i dodać do profilu, opisaliśmy w artykule [Autoryzacja](./authorization.md).

Bez certyfikatu faktura, której nie udało się wysłać do KSeF, otrzyma status **Błąd podczas transmisji** i trzeba będzie wysłać ją ponownie później.

## :material-file-send: Co się dzieje, gdy KSeF jest niedostępny

1. Klikasz `Wystaw przez KSeF` jak zwykle.
2. Integracja nie może połączyć się z KSeF, więc wystawia fakturę w trybie offline.
3. Faktura otrzymuje status **Oczekuje na dostawę offline** i dwa kody QR – drugi potwierdza wystawienie faktury w trybie offline.
4. Dostajesz powiadomienie z terminem, w którym faktura musi trafić do KSeF.
5. Możesz już wysłać fakturę klientowi. Pamiętaj, aby na PDF umieścić **oba** kody QR – zobacz [Zarządzanie fakturami](./invoices.md).

Tak samo działa to w przypadku faktur korygujących.

!!! info "Błędny token lub certyfikat to nie awaria"
    Jeśli KSeF odrzuci Twój token lub certyfikat autoryzacyjny, faktura **nie** zostanie wystawiona w trybie offline. Zamiast tego zobaczysz błąd – sprawdź ustawienia profilu KSeF i spróbuj ponownie.

## :material-sync: Dosyłanie do KSeF

Integracja automatycznie wysyła faktury offline do KSeF co 15 minut, gdy tylko KSeF znów jest dostępny. Nie musisz nic robić.

- Gdy faktura zostanie przyjęta, otrzyma numer KSeF, status zmieni się na **Zakończona**, a Ty dostaniesz powiadomienie.
- Gdy termin upływa dziś albo już minął, a faktura nadal czeka, raz dziennie dostaniesz przypomnienie.
- Jeśli KSeF odrzuci fakturę, status zmieni się na **Odrzucona przez KSeF**, a Ty dostaniesz powiadomienie z przyczyną. Taka faktura wymaga Twojej uwagi – [skontaktuj się z nami](https://dubas.pro/form/contact), jeśli nie wiesz, co zrobić.

!!! warning "Wymagane zaplanowane zadanie"
    Automatyczne dosyłanie korzysta z zaplanowanego zadania **Dosyłanie dokumentów offline24 do KSeF**. Jest ono tworzone automatycznie podczas instalacji rozszerzenia. Sprawdź w **Administracja → Zaplanowane zadania**, czy istnieje i jest **Aktywne**.

## :material-calendar-clock: Termin

Faktura offline musi trafić do KSeF **najpóźniej w następnym dniu roboczym** po dniu jej wystawienia. Weekendy i dni ustawowo wolne od pracy nie są liczone. Termin jest widoczny na fakturze w polu **Termin dosłania do KSeF**.
