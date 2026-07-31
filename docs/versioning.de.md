---
title: Versionssystem für Dubas-Erweiterungen
summary: Dokumentation zum Versionssystem für Dubas-EspoCRM-Erweiterungen
authors:
    - dubas s.c.
date: 2025-03-19
---
# Versionssystem für Dubas-Erweiterungen

Bei Dubas verwenden wir ein strukturiertes Versionsformat **M.M.P** (Major.Minor.Patch), um unsere EspoCRM-Erweiterungen zu verwalten. Dieser Ansatz schafft Klarheit über Umfang und Bedeutung von Aktualisierungen und stellt sicher, dass Benutzer Änderungen und Kompatibilität leicht nachvollziehen können.

## :material-numeric-1-box-outline: Hauptversionen (M)
Hauptversionen führen bedeutende Änderungen ein, darunter:
- Neue Kernfunktionen oder wesentliche Erweiterungen.
- Inkompatible Änderungen, die die Kompatibilität beeinflussen können.
- Umfangreiche Verbesserungen der Benutzererfahrung oder des Integrationsumfangs.

### Beispiel: `2.0.0`
Ein Wechsel von Version `1.x.x` auf `2.0.0` weist auf eine grundlegende Überarbeitung oder die Einführung einer entscheidenden Funktion hin.

## :material-numeric-2-box-outline: Nebenversionen (M)
Nebenversionen konzentrieren sich auf:
- Das Hinzufügen neuer, abwärtskompatibler Funktionen.
- Erweiterungen bestehender Funktionalitäten.
- Verbesserungen, die die aktuelle Einrichtung nicht beeinträchtigen.

### Beispiel: `1.2.0`
Ein Update von `1.1.0` auf `1.2.0` steht für zusätzliche Funktionen, die sich nahtlos integrieren, ohne bestehende Konfigurationen zu verändern.

## :material-numeric-3-box-outline: Patch-Versionen (P)
Patch-Versionen sind vorgesehen für:
- Fehlerbehebungen und kleinere Leistungsverbesserungen.
- Sicherheitsupdates zur Behebung von Schwachstellen.
- Kleine Anpassungen ohne neue Funktionen.

### Beispiel: `1.1.3`
Ein Update von `1.1.2` auf `1.1.3` kennzeichnet kleinere Fehlerbehebungen oder Optimierungen.

## :material-information-outline: Zusammenfassung
- **Major** — Wesentliche Updates mit potenziell inkompatiblen Änderungen.
- **Minor** — Neue Funktionen und Erweiterungen ohne Beeinträchtigung bestehender Funktionalitäten.
- **Patch** — Kleine Korrekturen und Leistungsverbesserungen.

Diese Versionsstrategie gewährleistet konsistente und vorhersehbare Aktualisierungen, sodass Benutzer unsere Erweiterungen sicher warten und aktualisieren können.

