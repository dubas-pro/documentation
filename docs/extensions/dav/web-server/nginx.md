# Nginx Web Server Configuration for DAV

The following instructions are made for Nginx web server configuration on **Ubuntu**. If you are using a different operating system or web server, you may need to adjust the instructions accordingly.

## PHP Configuration

Make sure that the PHP configuration is set up correctly with SOAP extension enabled. You can check this by running the following command:

```bash
php -m | grep soap
```

If the command returns `soap`, then the SOAP extension is enabled. If not, you need to install the SOAP extension, run the following commands:

```bash
sudo apt-get update
sudo apt-get install php-soap
sudo service nginx restart
```

!!! note "Note"
    Depending on your PHP version you may need to install a specific version of the SOAP extension. For example, for PHP 8.1, you need to run the following command:
    ```
    sudo apt-get install php8.1-soap
    ```

## Nginx Configuration

Your Nginx configuration file should have the following settings:

```conf
location = / {
    if ($http_user_agent ~ ^DavClnt) {
        return 302 https://$host/dav/server.php/files/$is_args$args;
    }
}

location = /.well-known/carddav { return 301 https://$host/dav/server.php; }
location = /.well-known/caldav  { return 301 https://$host/dav/server.php; }

location /dav/ {
    if (!-e $request_filename){
        rewrite ^/dav/(.*)$ /dav/server.php last; break;
    }
}
```

Then restart the Nginx server:

```bash
sudo service nginx restart
```
