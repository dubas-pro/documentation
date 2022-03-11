---
title: Dubas Google Fonts Extension for EspoCRM
description: Start using most popular fonts from Google Fonts in PDF's, inside EspoCRM.
authors:
    - dubas s.c.
---
# Dubas Google Fonts Extension
![Dubas Google Fonts Extension](../images/google-fonts.png)
## :material-information-outline: General Information
Dubas Google Fonts is an extension that will let you to use most popular fonts from Google Fonts inside your PDF's templates. This will allow you to beautify your PDF documents. Extension is really easy to use. Just have to install it and then, after rebuild, you'll see new fonts in PDF Template creator. 
!!! info
    There is a product page for this extension: [devcrm.it/google-fonts](https://devcrm.it/google-fonts)

## :material-playlist-check:  Requirements
- EspoCRM in version 6.1.0 or higher.
- PHP in version 7.3 or higher.

## Available fonts
- [Exo](https://fonts.google.com/specimen/Exo)
- [Lato](https://fonts.google.com/specimen/Lato)
- [Montserrat](https://fonts.google.com/specimen/Montserrat)
- [Open Sans](https://fonts.google.com/specimen/Open+Sans)
- [Oswald](https://fonts.google.com/specimen/Oswald)
- [Raleway](https://fonts.google.com/specimen/Raleway)
- [Roboto](https://fonts.google.com/specimen/Roboto)
- [Source Sans Pro](https://fonts.google.com/specimen/Source+Sans+Pro)
- [Ubuntu](https://fonts.google.com/specimen/Ubuntu)
- [Glory](https://fonts.google.com/specimen/Glory?query=glory)
- [Nunito](https://fonts.google.com/specimen/Nunito)
- [Poppins](https://fonts.google.com/specimen/Poppins)
- [Quicksand](https://fonts.google.com/specimen/Quicksand?query=quicks)

## :material-video-box: Video Presentation
<div class="video-wrapper">
  <iframe width="1280" height="400" src="https://www.youtube.com/embed/W10rQCZDlL0" frameborder="0" allowfullscreen></iframe>
</div>

## :material-book-plus-multiple: How to apply fonts and create PDF template?
1. After you install our extension, **rebuild EspoCRM and clear cache**
2. Go to Administration -> PDF Templates
3. Create new PDF Template
4. Choose font
5. Save

!!! info "Why you have to rebuild EspoCRM?"
    That's because additional fonts can be removed, for example when you upgrade EspoCRM. When you click rebuild, our script will check if fonts are there, if not, then script will install fonts again. 

## :material-book-plus-multiple: How to add own fonts?

!!! warning "Available from 1.0.0 version"
1. Install our extension
2. Log in to your FTP/SSH
3. Open custom directory. You have to make sure that you have these two directories. If you missing any folder, create it by yourself:

    1. `custom/Espo/Custom/Resources/metadata/app`
    
    2. `custom/Espo/Custom/Resources/fonts`
    
4. Go to [Google Fonts](https://fonts.google.com/) and download font which you want to add. It should be Regular and Bold.
5. Extract font and copy files with extension `*.ttf` to `custom/Espo/Custom/Resources/fonts` directory. We downloaded Fredoka font, so we copied `Fredoka-Bold.ttf` and `Fredoka-Regular.ttf`.
6. Go to `custom/Espo/Custom/Resources/metadata/app` and create file called `pdfEngines.json`. Paste and adjust with name of your font this code:

    ```
    {
        "Tcpdf": {
            "fontFaceList": [
                "__APPEND__",
                "fredoka"
            ]
        }
    }
    ```

7. Go to Administration section, Rebuild and Clear Cache
8. Go to PDF Templates and change font in your Template
9. Check PDF Template

## :material-book-plus-multiple: How to add translation for custom font
1. Log in to your FTP/SSH
2. Create directory: `custom/Espo/Custom/Resources/i18n/en_US/`
3. Create there new file: `Template.json`
4. Paste there this code and adjust with name of your custom font and translation:

    ```
    {
        "options": {
            "fontFace": {
                "fredoka": "Fredoka"
            }
        }
    }
    ```
    
5. Clear cache and test it.


<!-- ## :material-cube-scan: Demo
You can check this extension on our demo instance: [demo.devcrm.it](https://demo.devcrm.it)  
Username: **send**  
Password: **dubas** -->

