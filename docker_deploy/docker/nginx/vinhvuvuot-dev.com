upstream fastcgi_backend {
    server   unix:/run/php/php7.3-fpm.sock;
 }

 server {
     server_name vinhvuvuot-dev.com;
     listen 80;
     set $MAGE_ROOT /var/www/html/magento2;
     set $MAGE_MODE default;
    # or production access_log /var/log/nginx/myMagentoSite.com-access.log;
     error_log /var/log/nginx/example.com-error.log;
     include /var/www/html/magento2/nginx.conf.sample;
}