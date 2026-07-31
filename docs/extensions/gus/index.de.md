---
title: Dubas GUS Integration for EspoCRM
summary: Dokumentation für die GUS-Integration für EspoCRM
authors:
    - dubas s.c.
date: 2025-03-01
---
# Dubas GUS Integration for EspoCRM
![GUS Integration](../../images/gus.png)

Die GUS-Integration für EspoCRM ermöglicht die schnelle und effiziente Erstellung von Kundendatensätzen auf Basis von NIP-, KRS- oder REGON-Nummern. Durch die Nutzung von Daten aus dem polnischen GUS-Register automatisiert die Erweiterung das Abrufen von Unternehmensinformationen, minimiert die manuelle Dateneingabe und reduziert Fehler.

!!! tip "Jetzt bestellen"
    Sie können diese Erweiterung in unserem [Marketplace](https://devcrm.it/product/gus) erwerben.

### Was ist GUS?
Die polnische Regierungsdatenbank GUS (Hauptamt für Statistik in Polen) ist die maßgebliche Informationsquelle über in Polen registrierte Unternehmen und Institutionen. Sie dient als offizielles Verzeichnis für verschiedene Daten, darunter Finanzinformationen, organisatorische Details und Rechtsstatus. Die Datenbank umfasst eine breite Palette von Einheiten, einschließlich privater Unternehmen, öffentlicher Einrichtungen und gemeinnütziger Organisationen.

## :material-video-box: Videopräsentation
<div class="video-wrapper">
  <iframe width="1280" height="400" src="https://www.youtube.com/watch?v=i153uTDtEv4" frameborder="0" allowfullscreen></iframe>
</div>

## :material-playlist-check: Voraussetzungen
- EspoCRM-Version 8.1.0 oder höher.
- PHP-Version 8.1 oder höher.
- Aktive Internetverbindung für den Zugriff auf das GUS-Register.

## :material-view-grid-plus: Installation
1. Melden Sie sich in Ihrem EspoCRM an und wechseln Sie zum Bereich **Administration**.
2. Öffnen Sie den Reiter **Erweiterungen**.
3. Installieren Sie die von Dubas bereitgestellte Erweiterung.

## :material-tune: Erstkonfiguration
1. Gehen Sie zu **Administration > Integrationen**.
2. Wählen Sie **GUS Integration**.
3. Aktivieren Sie die Integration.
4. Geben Sie den GUS-API-Schlüssel ein.
5. Konfigurieren Sie das Feld-Mapping passend zu Ihren vorhandenen CRM-Feldern.
6. Speichern Sie die Einstellungen.

Sie können die Integration nun verwenden, um neue Kundendatensätze auf Basis von Identifikationsnummern aus dem GUS-Register zu erstellen.

## :material-file-document-outline: Funktionsweise
1. Geben Sie beim Erstellen eines neuen Kunden eine gültige NIP-, KRS- oder REGON-Nummer in das entsprechende Feld ein.
2. Klicken Sie auf **Daten abrufen**, um Daten aus dem GUS-Register zu laden.
3. Das System füllt die verfügbaren Daten automatisch aus, darunter:
   - Identifikation: REGON, NIP
   - Unternehmensinformationen: Name, Unternehmensart, Branche
   - Adressdaten: Woiwodschaft, Kreis, Gemeinde, Stadt, Straße, Hausnummer, Wohnungsnummer, Postleitzahl, Poststadt
   - Kontaktdaten: Telefonnummer, E-Mail-Adresse, Website
   <!-- - Representative Details: First name, last name -->
4. Passen Sie bei Bedarf das Daten-Mapping an und speichern Sie den neuen Kundendatensatz.

!!! warning "Wichtig"
    Bitte beachten Sie, dass die meisten Felder in GUS optional sind. Wenn eines der oben genannten Felder im Register nicht ausgefüllt ist, bleibt das entsprechende Feld in EspoCRM leer.


## So erhalten Sie einen GUS-API-Schlüssel
Die GUS-Integration erfordert einen API-Schlüssel aus dem GUS-Register. Um einen API-Schlüssel zu erhalten, müssen Sie eine E-Mail senden. Details finden Sie auf der [offiziellen Website](https://api.stat.gov.pl/Home/RegonApi?lang=en).

## :material-alert-circle-outline: Einschränkungen
- Die Integration unterstützt derzeit **keine Aktualisierung** oder Überschreibung vorhandener Datensätze in EspoCRM.
- Sie erstellt nur neue Kundendatensätze auf Basis der angegebenen Identifikationsnummern.
