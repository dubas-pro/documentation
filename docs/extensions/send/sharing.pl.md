---
title: Strona Udostępniania (Sharing Page)
description: Zachowanie strony udostępniania plików, logika przekierowań oraz obsługa wymogów logowania.
---

# Publiczna Strona Udostępniania

Strona udostępniania to interfejs webowy, do którego trafia klient po kliknięciu wygenerowanego linku **Public URL**.

---

## Logika wyświetlania i pobierania

1. **Pojedynczy plik:** Jeśli udostępnienie zawiera tylko jeden plik, a opcja `forceListView` jest wyłączona, system bezpośrednio zainicjuje pobieranie pliku.
2. **Wiele plików / Widok listy:** Jeśli udostępnienie zawiera więcej niż jeden plik (lub włączono `forceListView`), odbiorca zobacz odświeżony widok listy zasobów.

---

## Elementy interfejsu strony udostępniania

* **Nagłówek i Metadane:** Wyświetla nazwę nadawcy, datę udostępnienia, łączną liczbę plików oraz ich sumaryczny rozmiar.
* **Wiadomość wprowadzająca (Intro Text):** Treść zdefiniowana globalnie w ustawieniach modułu lub w notatce rekordu.
* **Przycisk „Pobierz wszystkie”:** Umożliwia pobranie całej paczki plików w archiwum ZIP jednym kliknięciem.
* **Tabela plików:** Lista zawierająca ikony typów plików, nazwy, rozmiary oraz indywidualne przyciski pobierania.
* **Sekcja informacyjna i stopka:** Zawiera komunikaty o zasadach bezpieczeństwa oraz opcjonalny tekst stopki zdefiniowany w panelu administracyjnym.

---

## Obsługa braku uprawnień i prywatność

Gdy dostęp do linku jest ograniczony (`Internal`, `Portal`, `Authenticated`):

* **Wymagane logowanie:** Niezalogowany użytkownik widzi bezpieczną stronę informującą o konieczności zalogowania się w systemie CRM/Portalu.
* **Ochrona struktur URL:** Strona blokady **nie wyświetla** bezpośrednich linków do logowania CRM, chroniąc przed ujawnieniem adresu instancji.
* **Brak wycieku danych:** Osoba nieuprawniona nie zobaczy nazw plików, liczby załączników ani notatki nadawcy.
* **Brak potwierdzenia istnienia:** Wygasłe linki zwracają błąd `404`, nie zdradzając, czy dany link istniał w przeszłości.
