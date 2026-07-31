---
title: Integracja PayPal firmy Dubas dla EspoCRM
---

Integracja PayPal została pierwotnie opracowana do użytku wewnętrznego w naszej firmie. Po wielu miesiącach tworzenia tego rozszerzenia i przeprowadzania testów wewnętrznych zdecydowaliśmy się udostępnić integrację PayPal jako rozszerzenie.

!!! tip "Kup teraz"
    To rozszerzenie możesz kupić w naszym [marketplace](https://devcrm.it/product/paypal/).

![PayPal](../../images/paypal.png)

## Demo

Kilka funkcji tego rozszerzenia możesz sprawdzić w naszym publicznym demo. Wejdź na [demo.devcrm.it](https://demo.devcrm.it) i zaloguj się:

- Username: **paypal**
- Password: **dubas**

## Requirements

- EspoCRM w wersji 6.0.0 lub wyższej.
- PHP w wersji 7.2 lub wyższej.
- Publicznie dostępna instancja EspoCRM – jest wymagana, ponieważ PayPal używa webhooków do przesyłania niektórych informacji.
- Rozszerzenie SalesPack, jeśli chcesz używać faktur PayPal.

## Installation

1. Zaloguj się do swojego EspoCRM i przejdź do sekcji Administracja.
2. Przejdź do sekcji Rozszerzenia.
3. Zainstaluj rozszerzenie, które od nas otrzymałeś.

## Setup

1. Przejdź do **Administracja > Integracje**.
2. Wybierz integrację PayPal.
3. Włącz integrację PayPal.
4. Otwórz stronę PayPal [My apps&credentials](https://developer.paypal.com/developer/applications).
5. Wybierz środowisko (Sandbox/Live).
6. Kliknij przycisk **Create app**.
7. Wpisz nazwę aplikacji.
8. Skopiuj **Client ID** i wklej go w ustawieniach integracji PayPal.
9. Skopiuj **Secret** i wklej go w ustawieniach integracji PayPal.
10. Wybierz środowisko – musi być takie samo jak to wybrane wcześniej w drugim kroku.
11. Zapisz ustawienia.
12. Przejdź do **Administracja > PayPal Webhooks**.
13. Utwórz nowy webhook. Dodaj nazwę, wybierz zdarzenia, których chcesz używać, ustaw status **Activate**, a pole URL pozostaw puste.
14. Zapisz webhook.

Teraz możesz zacząć korzystać z PayPal w swoim EspoCRM. Możesz dodać encje PayPal do menu.
