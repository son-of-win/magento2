#!/bin/bash
chown -R $USER:$USER /var/www/html/magento2/
chown -R 777 /var/www/html/magento2/ 
cd /var/www/html/magento2
composer install
cd bin
./magento setup:install --base-url=http://vinhvuvuot-dev.com/ --db-host=mysql --db-name=magento2 --backend-frontname=admin --db-user=magento2 --db-password=magento2 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=huuvuot2001 --language=en_US --currency=VND --timezone=Asia/Ho_Chi_Minh --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=es01 --elasticsearch-port=9200