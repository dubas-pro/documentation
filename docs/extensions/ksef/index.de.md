---
title: Dubas KSeF-Integration für EspoCRM
description: Verwalten Sie KSeF-Rechnungen direkt in EspoCRM mit unserer Integration.
authors:
  - dubas s.c.
---

# Dubas KSeF-Integration

![Dubas KSeF Integration](../../images/ksef.png)

## :material-information-outline: Allgemeine Informationen

Die Dubas KSeF-Integration ist eine benutzerdefinierte Erweiterung, die eine nahtlose Kommunikation zwischen EspoCRM und dem polnischen nationalen E-Rechnungssystem KSeF ermöglicht. Mit dieser Erweiterung können Sie Rechnungen von Auftragnehmern automatisch aus KSeF direkt in EspoCRM herunterladen sowie eigene Rechnungen über die Sales-Pack-Funktionalität an KSeF übermitteln. Diese Lösung optimiert die Verwaltung Ihrer Finanzdokumente und sorgt für eine sichere, effiziente Verarbeitung innerhalb Ihres CRM.

!!! tip "Purchase"
    Bitte kontaktieren Sie uns [über unser Formular](https://dubas.pro/form/contact), wenn Sie diese Erweiterung bestellen möchten.

### Hauptfunktionen

!!! warning "This product is new!"
    Bitte beachten Sie, dass sowohl diese Erweiterung als auch das KSeF-System noch relativ neu sind und laufende Aktualisierungen oder Änderungen nationaler Standards möglich sind. Wir passen die Integration bei Bedarf an und unterstützen individuelle Anwendungsfälle, um Kompatibilität und Zuverlässigkeit weiterhin sicherzustellen.

* **Vollständige Datensicherheit:** Alle Ihre Daten bleiben sicher in Ihrer EspoCRM-Instanz. Die Kommunikation erfolgt direkt zwischen Ihrem CRM und dem KSeF-System. Unsere Integration übermittelt keine Finanz- oder Kundendaten an Dritte.
* **Automatischer Rechnungsabruf:** Die Integration ruft die von Ihren Auftragnehmern ausgestellten Rechnungen automatisch aus KSeF ab – gemäß Ihrem Zeitplan und Ihren Vorgaben.
* **Sales-Pack-Kompatibilität:** Empfangene Rechnungen werden in der Entitätenklasse Expenses gespeichert, die vollständig mit dem Sales Pack und dessen Item List kompatibel ist.
* **Manuelle Synchronisierung:** Sie können den Abruf von Rechnungen aus KSeF jederzeit manuell starten.
* **Zentrale Ausgabenverwaltung:** Das Modul Expenses kann für alle Rechnungen verwendet werden, nicht nur für diejenigen aus KSeF. Ausgaben aus anderen Quellen können Sie bei Bedarf manuell erfassen.
* **Direkte Rechnungsausstellung:** Senden Sie im EspoCRM Sales Pack erstellte Rechnungen direkt an das KSeF-System.

### :material-map-marker-distance: Roadmap

* :material-checkbox-marked-outline: Autorisierung per Zertifikat (ab 2027 erforderlich).
* :material-checkbox-marked-outline: Unterstützung für Bankkonten.
* :material-checkbox-marked-outline: Unterstützung für mehrere KSeF-Schemata.
* :material-checkbox-blank-outline: Unterstützung für Offline-Modi (erfordert Zertifikatsautorisierung).
* :material-checkbox-blank-outline: Unterstützung für Gutschriften (abhängig von der Kompatibilität der Sales-Pack-Entität mit KSeF).
* :material-checkbox-blank-outline: Unterstützung für Stapelverarbeitung bei der Rechnungsausstellung.

---

## :material-playlist-check: Anforderungen

* EspoCRM-Version **9.3.0** oder höher.
* Sales-Pack-Version **4.x** oder höher.
* PHP (für Web und CLI) in Version **8.4** oder höher.

---

## Wie beginnen?

1. Kaufen und installieren Sie die **[Sales-Pack-Erweiterung](https://dubas.pro/link/sp)**
2. Installieren Sie die KSeF-Erweiterung
3. [KSeF-Profil konfigurieren](./profiles.md#how-to-configure-a-ksef-profile)
4. [Automatischen Abruf von Ausgaben konfigurieren](#how-to-configure-the-ksef-cron-job)
5. [Optionale Felder zu Rechnungen hinzufügen](./invoices.md#how-to-set-additional-params-for-invoice)

**[Jetzt können Sie Ihre erste Rechnung ausstellen!](./invoices.md#how-to-issue-invoice-via-ksef)**

## :material-cog-sync-outline: So konfigurieren Sie den KSeF-Cron-Job

1. Navigieren Sie zum Bereich **Administration**.
2. Klicken Sie auf **Geplante Jobs**.
3. Erstellen Sie einen neuen geplanten Job.
4. Wählen Sie die Aufgabe `Get Invoices From Ksef`.
5. Klicken Sie auf **Speichern**.

Standardmäßig lädt dieser Job für alle aktiven Profile alle **5 Minuten** automatisch Ausgaben aus KSeF herunter.

!!! note "Daily checking"
    Wir empfehlen, einen weiteren geplanten Job mit dem Namen **Daily Fetch Of Expenses From KSeF** zu konfigurieren. Der passende Zeitplan ist `0 0 * * *`, also um 00:00 Uhr.

---

## :material-server-network: KSeF-Umgebungen

* **Produktion:** [https://ap.ksef.mf.gov.pl/web/](https://ap.ksef.mf.gov.pl/web/)
* **Demo:** [https://ap-demo.ksef.mf.gov.pl/web/](https://ap-demo.ksef.mf.gov.pl/web/)
* **Test:** [https://ap-test.ksef.mf.gov.pl/web/](https://ap-test.ksef.mf.gov.pl/web/)

---

## Verwandte Artikel

* [Rechnungsverwaltung](./invoices.md)
* [Ausgabenverwaltung](./expenses.md)
* [So laden Sie ein Paket mit Finanzdokumenten herunter](./download-documents.md)
* [So konfigurieren Sie ein Profil für die KSeF-Testumgebung](./test-profile.md)
* [So verwalten Sie Konten und Steuernummern](./accounts.md)
