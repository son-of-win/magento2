# Install and run
    git clone https://github.com/son-of-win/magento2
    docker-compose up --build
    sudo chown -R 1000:root data/elasticsearch/
    docker-compose up -d
    docker exec -it app bash
    git clone https://github.com/vubom01/magento2
    cd magento2
    sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin --filename=composer
    sudo composer update
    sudo composer install -v
    docker restart $(docker ps -a -q)
    cd /var/www/html/magento2/bin
    sudo ./magento setup:install --base-url=http://vinhvuvuot-dev.com/ --db-host=localhost --db-name=magento2 --backend-frontname=admin --db-user=root --db-password=root --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=huuvuot2001 --language=en_US --currency=VND --timezone=Asia/Ho_Chi_Minh --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=localhost --elasticsearch-port=9200
    sudo chown -R $USER:$USER /var/www/html/magento2/
    sudo chmod -R 777 /var/www/html/magento2/
    docker restart $(docker ps -a -q)


