---
title: E-Mail-Vorlagen Integration
description: Automatische Dateifreigabe über den {{dubasSend}} Template Helper in EspoCRM.
---

# E-Mail Template Helper (`{{dubasSend}}`)

Die Dubas Send Erweiterung stellt einen eigenen HTMLizer-Helper zur Verfügung: `{{dubasSend}}`. Dieser Helper konvertiert E-Mail-Anhänge oder Dateien übergeordneter Datensätze beim E-Mail-Versand automatisch in sichere Send-Freigaben.

---

## Syntax und grundlegende Verwendung

Die einfachste Einbindung in eine HTML-E-Mail-Vorlage erfordert keine zusätzlichen Parameter:

```html
{{dubasSend}}

```

Ohne zusätzliche Optionen führt der Helper automatisch folgende Schritte aus:

1. Ermittlung von `parentType` und `parentId` aus dem E-Mail-Kontext.
2. Kopieren aller Anhänge des übergeordneten Datensatzes.
3. Erstellung eines neuen **Send**-Datensatzes mit Standardeinstellungen (30 Tage Gültigkeit).
4. Generierung einer formatierten HTML-Tabelle mit Download-Links direkt im E-Mail-Text.

---

## Erweiterte Konfiguration mit Parametern

Sie können die Eigenschaften der Freigabe direkt im Tag anpassen:

```html
{{dubasSend
    expiryDateThresholdPeriod='14 days'
    maximumAccessCount=5
    forceListView=true
    language='de_DE'
    name='Angebotsunterlagen'
    note='Vielen Dank für Ihre Anfrage. Nachfolgend finden Sie die gewünschten Dateien.'
}}

```

---

## Vollständige Parameterübersicht

| Parameter | Typ | Standard | Beschreibung |
| --- | --- | --- | --- |
| `expiryDateThresholdPeriod` | `string` | `'30 days'` | Relative Gültigkeitsdauer ab Versandzeitpunkt (z. B. `'7 days'`, `'48 hours'`). |
| `expiryDate` | `string` | `null` | Explizites Ablaufdatum (überschreibt `expiryDateThresholdPeriod`). |
| `maximumAccessCount` | `int` | `0` | Maximale Anzahl erlaubter Downloads (`0` = unbegrenzt). |
| `forceListView` | `bool` | `null` | Erzwingt die Listenansicht. Standardmäßig `true`, wenn mehr als 1 Datei enthalten ist. |
| `forceFileDownload` | `bool` | `false` | Erzwingt bei einzelnen Dateien den direkten Download ohne Vorschauseite. |
| `language` | `string` | `'en_US'` | Sprachcode für die Freigabeseite des Empfängers (z. B. `'de_DE'`, `'en_US'`). |
| `name` | `string` | `null` | Eigener Name des Send-Datensatzes. Standard: *Dateien: [Name des Eltern-Datensatzes]*. |
| `note` | `string` | `null` | Textnotiz für die Freigabeseite. |
| `status` | `string` | `'Active'` | Status des erstellten Send-Datensatzes. |
| `accessToken` | `string` | `null` | Eigener Zugriffstoken (wird automatisch erzeugt, falls leer). |
| `parentType` | `string` | *Kontext* | Übergeordneter Entitätstyp (aus E-Mail-Kontext). |
| `parentId` | `string` | *Kontext* | Übergeordnete Entitäts-ID (aus E-Mail-Kontext). |

---

## Logik und Verarbeitung

* **Verarbeitung von Notizen:** Wenn das Eltern-Element eine Notiz (`Note`) ist, ermittelt der Helper automatisch den übergeordneten Datensatz der Notiz und verknüpft den Send-Datensatz entsprechend.
* **Formatierung der Dateigrößen:** Dateigrößen in der HTML-Tabelle werden automatisch in gut lesbare Einheiten umgerechnet (KB, MB).
* **Verhalten bei leeren Anhängen:** Wenn keine Dateien vorhanden sind, gibt der Helper einen leeren String zurück und es wird kein Send-Datensatz angelegt.
