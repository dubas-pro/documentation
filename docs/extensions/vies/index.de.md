---
title: Dubas VAT/VIES Integration for EspoCRM
summary: Documentation for VAT/VIES Integration for EspoCRM
authors:
    - dubas s.c.
date: 2025-03-19
---
# Dubas VAT/VIES Integration for EspoCRM
![VAT/VIES Integration](../../images/vies.png)

Die VAT/VIES-Integration für EspoCRM ermöglicht es Benutzern, die Umsatzsteuer-Identifikationsnummern ihrer Kunden anhand der VIES-Datenbank (VAT Information Exchange System) zu validieren. Dadurch wird sichergestellt, dass die von Kunden angegebenen Umsatzsteuer-Identifikationsnummern korrekt und gültig sind. Dies unterstützt die Einhaltung von Vorschriften und reduziert Fehler.

!!! tip "Order Now"
    Sie können diese Erweiterung in unserem [Marketplace](https://devcrm.it/product/vies) erwerben.

## :material-playlist-check: Requirements
- EspoCRM-Version 8.1.0 oder höher.
- PHP-Version 8.1 oder höher.
- Aktive Internetverbindung für den Zugriff auf die VIES-Datenbank.

## :material-view-grid-plus: Installation
1. Melden Sie sich in EspoCRM an und wechseln Sie zum Bereich **Administration**.
2. Öffnen Sie den Reiter **Extensions**.
3. Installieren Sie die von Dubas bereitgestellte Erweiterung.

## :material-tune: Initial Configuration
1. Gehen Sie zu **Administration**.
2. Suchen Sie nach **Vies Settings**.
3. Aktivieren Sie die Integration.
4. Konfigurieren Sie die Validierungseinstellungen nach Ihren Anforderungen.
5. Speichern Sie die Einstellungen.

Nun können Sie die Integration verwenden, um die von Ihren Kunden bereitgestellten Umsatzsteuer-Identifikationsnummern zu validieren.

### Custom VAT number field
Standardmäßig erstellt unsere Erweiterung das Feld `vatNumber` in der Account-Entität. Sie können jedoch bei Bedarf ein anderes Feld verwenden. So ändern Sie das Feld:

1. Melden Sie sich per SSH/FTP an.
2. Wechseln Sie in das EspoCRM-Verzeichnis.
3. Öffnen Sie das Verzeichnis `data`.
4. Bearbeiten Sie die Datei `config.php`.
5. Fügen Sie den Parameter `vatNumberField` zur Konfigurationsdatei hinzu und geben Sie das zu verwendende Feld an.
6. Speichern Sie die Änderungen und leeren Sie den Cache im Bereich **Administration**.

## :material-file-document-outline: How It Works
1. Geben Sie die Umsatzsteuer-Identifikationsnummer eines Kunden beim Erstellen oder Bearbeiten eines Datensatzes in das entsprechende Feld ein und speichern Sie den Datensatz.
2. Klicken Sie auf die drei Punkte neben der Schaltfläche **Bearbeiten** und wählen Sie die Option **VAT number validieren**, um die Umsatzsteuer-Identifikationsnummer in der VIES-Datenbank zu prüfen.
3. Ist die Umsatzsteuer-Identifikationsnummer gültig, bestätigt das System ihre Gültigkeit.
4. Ist sie ungültig, wird eine Fehlermeldung angezeigt, die Sie auffordert, die angegebene Nummer zu überprüfen.

## :material-script-text-outline: Formula
Es gibt die Formel `util\viesValidation`, mit der sich ein Account in Echtzeit validieren lässt. Die korrekte Verwendung lautet `util\viesValidation(ACCOUNT_ID)`. Sie können sie beispielsweise einsetzen, um einen Account während der Rechnungserstellung zu validieren.

## :material-alert-circle-outline: Limitations
- Die Integration **validiert** ausschließlich Umsatzsteuer-Identifikationsnummern und ruft keine zusätzlichen Unternehmensinformationen ab.
- Sie aktualisiert oder überschreibt keine bestehenden Datensätze in EspoCRM.

## :material-format-list-text: What information we store
Jede Validierungsanfrage an VIES hinterlässt in EspoCRM einen Eintrag, damit Sie die Validierungshistorie später nachvollziehen können.

Jeder Account verfügt über die folgenden Felder:

1. `VAT Verification Date` – Feld zur Speicherung des Datums der letzten Verifizierung
2. `VAT Status` – Feld zur Speicherung des Booleschen Status der letzten Validierung
3. `VAT Number` – Feld zur Speicherung der Umsatzsteuer-Identifikationsnummer
4. `VAT Verifications` – Beziehung/Liste aller Verifizierungen

Außerdem wurde eine zusätzliche Entität erstellt, die historische Daten speichert.
