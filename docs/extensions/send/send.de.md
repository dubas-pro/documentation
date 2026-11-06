---
title: Send-Datensätze verwalten
description: Felddefinitionen, Zugriffsebenen und Optionen des Send-Moduls in EspoCRM.
---

# Verwaltung von Send-Datensätzen

Das **Send**-Modul verwaltet alle im System erstellten Freigabepakete.

!!! example "Zum Modul wechseln"
    [#Send](https://dubas.pro/redirect/#Send)

---

## Felddefinitionen

| Feld | Technischer Name | Beschreibung |
| :--- | :--- | :--- |
| **Name** | `name` | Interner Titel des Send-Datensatzes. |
| **Übergeordneter Datensatz** | `parent` / `parentType`, `parentId` | Verknüpfter Eltern-Datensatz (z. B. *Account*, *Opportunity*, *Email*). |
| **Ablaufdatum** | `expiryDate` | Datum und Uhrzeit des Ablaufs. Abgelaufene Links liefern einen HTTP 404-Fehler. |
| **Status** | `status` | Status des Datensatzes (z. B. *Active*, *Expired*, *Disabled*). |
| **Notiz** | `note` | Textnachricht, die dem Empfänger auf der Freigabeseite angezeigt wird. |
| **Anhänge** | `attachments` | Manuell hinzugefügte Dateien. |
| **Sprache** | `language` | Sprache der öffentlichen Freigabeseite. |
| **Maximale Zugriffszahl** | `maximumAccessCount` | Maximale Anzahl an Downloads (`0` = unbegrenzt). |
| **Zugriffsstufe** | `accessLevel` | Berechtigungsanforderung für den Empfänger (siehe unten). |
| **Listenansicht erzwingen** | `forceListView` | Erzwingt die Listenansicht auch bei einzelnen Dateien. |
| **Direkt-Download erzwingen**| `forceFileDownload` | Startet bei einzelnen Dateien direkt den Download ohne Vorschauseite. |
| **Öffentliche URL** | `publicUrl` | Automatisch erzeugter Link für den Kunden. |
| **Zugriffstoken** | `accessToken` | Kryptografischer Sicherheitstoken. |
| **Zugriffszähler** | `accessCount` | Tatsächliche Anzahl der Aufrufe/Downloads. |

---

## Zugriffsebenen (`accessLevel`)

* **Public (anyone with the link):** Öffentlich für jeden mit dem Link zugänglich.
* **Internal:** Nur für angemeldete interne CRM-Benutzer.
* **Portal:** Nur für angemeldete Portal-Benutzer.
* **Authenticated:** Für alle angemeldeten Benutzer (CRM oder Portal).

!!! note "Konto-Verknüpfung (Account)"
    Wenn `Portal` oder `Authenticated` gewählt ist und der Send-Datensatz mit einem **Account** verknüpft ist, haben nur Portal-Benutzer Zugriff, die diesem Account zugeordnet sind.
