---
title: Öffentliche Freigabeseite
description: Verhalten der Freigabeseite, Download-Logik und Zugriffsbeschränkungen.
---

# Öffentliche Freigabeseite

Die Freigabeseite ist die Web-Schnittstelle, die beim Aufruf der **Public URL** angezeigt wird.

---

## Verhalten beim Dateidownload

1. **Einzelne Datei:** Bei nur einer Datei und deaktiviertem `forceListView` startet der Download sofort.
2. **Mehrere Dateien / Listenansicht:** Bei mehreren Dateien erscheint die moderne Listenansicht.

---

## Seitenelemente

* **Kopfzeile & Metadaten:** Zeigt Absender, Erstellungsdatum, Dateianzahl und Gesamtgröße.
* **Einleitungstext:** Zeigt globale Kopfzeilentexte oder Notizen an.
* **Button „Alle herunterladen“:** Erlaubt das Herunterladen aller Dateien als ZIP-Archiv.
* **Dateitabelle:** Detaillierte Liste mit Dateityp-Icons, Dateinamen, Größen und Download-Buttons.
* **Sicherheitshinweise & Fußzeile:** Allgemeine Sicherheitshinweise und anpassbare Fußzeilen.

---

## Zugriffsbeschränkungen und Datenschutz

Für geschützte Links (`Internal`, `Portal`, `Authenticated`):

* **Anmeldung erforderlich:** Nicht angemeldete Benutzer sehen einen Hinweis auf erforderliche Rechte.
* **Schutz der Instanz-URL:** Sperrseiten enthalten keine direkten Links zur CRM-Anmeldung.
* **Datenschutz:** Unbefugte sehen weder Dateinamen noch Notizen des Absenders.
* **Keine Existenzpreisgabe:** Abgelaufene Links geben einen HTTP 404-Fehler zurück.
