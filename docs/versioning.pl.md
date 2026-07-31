---
title: System wersjonowania rozszerzeń Dubas
summary: Dokumentacja wyjaśniająca system wersjonowania rozszerzeń Dubas dla EspoCRM
authors:
    - dubas s.c.
date: 2025-03-19
---
# System wersjonowania rozszerzeń Dubas

W Dubas stosujemy uporządkowany schemat wersjonowania **M.M.P** (Major.Minor.Patch) do zarządzania naszymi rozszerzeniami EspoCRM. Takie podejście zapewnia przejrzystość zakresu i znaczenia aktualizacji, dzięki czemu użytkownicy mogą łatwo śledzić zmiany oraz zgodność wersji.

## :material-numeric-1-box-outline: Aktualizacje główne (M)
Aktualizacje główne obejmują istotne zmiany, takie jak:
- Nowe kluczowe funkcje lub znaczące usprawnienia.
- Zmiany niekompatybilne wstecz, które mogą wpływać na zgodność.
- Znaczące ulepszenia doświadczenia użytkownika lub zakresu integracji.

### Przykład: `2.0.0`
Przejście z wersji `1.x.x` do `2.0.0` oznacza gruntowną przebudowę lub dodanie kluczowej funkcji.

## :material-numeric-2-box-outline: Aktualizacje podrzędne (M)
Aktualizacje podrzędne koncentrują się na:
- Dodawaniu nowych funkcji zgodnych wstecz.
- Usprawnieniach rozszerzających istniejące możliwości.
- Poprawkach, które nie zakłócają obecnej konfiguracji.

### Przykład: `1.2.0`
Aktualizacja z `1.1.0` do `1.2.0` oznacza dodanie funkcjonalności, które integrują się płynnie bez konieczności zmiany dotychczasowych konfiguracji.

## :material-numeric-3-box-outline: Aktualizacje poprawkowe (P)
Aktualizacje poprawkowe obejmują:
- Usuwanie błędów i drobne usprawnienia wydajności.
- Poprawki bezpieczeństwa eliminujące podatności.
- Niewielkie korekty, które nie wprowadzają nowych funkcji.

### Przykład: `1.1.3`
Aktualizacja z `1.1.2` do `1.1.3` oznacza drobne poprawki błędów lub optymalizacje.

## :material-information-outline: Podsumowanie
- **Major** — Istotne aktualizacje, potencjalnie zawierające zmiany niekompatybilne wstecz.
- **Minor** — Rozszerzenia funkcjonalności i usprawnienia bez naruszania istniejącego działania.
- **Patch** — Drobne poprawki i usprawnienia wydajności.

Ta strategia wersjonowania zapewnia spójne i przewidywalne aktualizacje, umożliwiając użytkownikom bezpieczne utrzymanie oraz rozwijanie naszych rozszerzeń.

