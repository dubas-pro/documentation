# Apache Web Server Configuration for DAV

The following instructions are made for Apache web server configuration on **Ubuntu**. If you are using a different operating system or web server, you may need to adjust the instructions accordingly.

## PHP Configuration

Make sure that the PHP configuration is set up correctly with SOAP extension enabled. You can check this by running the following command:

```bash
php -m | grep soap
```

If the command returns `soap`, then the SOAP extension is enabled. If not, you need to install the SOAP extension, run the following commands:

```bash
sudo apt-get update
sudo apt-get install php-soap
sudo service apache2 restart
```

!!! note "Note"
    Depending on your PHP version you may need to install a specific version of the SOAP extension. For example, for PHP 8.1, you need to run the following command:
    ```
    sudo apt-get install php8.1-soap
    ```

## Apache Configuration

Your Apache configuration file should have the following settings:

```conf
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{HTTP_USER_AGENT} DavClnt
    RewriteRule ^$ /dav/server.php/files/ [L,R=302]
    RewriteRule ^\.well-known/carddav /dav/server.php [R=301,L]
    RewriteRule ^\.well-known/caldav /dav/server.php [R=301,L]
</IfModule>
```

Then restart the Apache server:

```bash
sudo service apache2 restart
```
