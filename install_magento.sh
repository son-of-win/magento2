# !/bin/sh
user=$USER
sudo apt-get update
sudo apt-get install nginx

cd /etc/nginx
sudo sed -i "s/user www-data;/user $USER;/" nginx.conf
cd /etc/init.d
sudo service nginx start
sudo apt-get install mysql-server-8.0 mysql-client-8.0
sudo service mysql start


sudo mysql -u root -e "create database magento2;"
# sudo mysql -u root -e "create user 'magento'@'localhost' identified by 'magento';"
# sudo mysql -u root -e "grant all privileges on magento2.* to 'magento'@'%';"
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"  
sudo mysql -u root -e "flush privileges;"



# install php7.3
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-gmp php7.3-curl php7.3-soap php7.3-bcmath php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-mysql php7.3-gd php7.3-xml php7.3-cli php7.3-zip
sudo apt install php7.3-fpm
cd /etc/php/7.3/fpm
sudo sed -i 's/memory_limit = 128M/memory_limit = 3G/' php.ini
sudo sed -i 's/max_execution_time = 30/max_execution_time = 1800/' php.ini
sudo sed -i 's/zlib.output_compression = Off/zlib.output_compression = On/' php.ini
cd /etc/php/7.3/cli
sudo sed -i 's/memory_limit = -1/memory_limit = 3G/' php.ini
sudo sed -i 's/max_execution_time = 30/max_execution_time = 1800/' php.ini
sudo sed -i 's/zlib.output_compression = Off/zlib.output_compression = On/' php.ini

cd /etc/php/7.3/fpm/pool.d
sudo sed -i "s/user = www-data/user = $USER/" www.conf
sudo sed -i "s/group = www-data/group = $USER/" www.conf
sudo sed -i "s/listen.owner = www-data/listen.owner = $USER/" www.conf
sudo sed -i "s/listen.group = www-data/listen.group = $USER/" www.conf

# cd /etc/init.d
# sudo ./php7.3-fpm start
sudo service php7.3-fpm start

cd /var/www/html
sudo wget https://github.com/magento/magento2/archive/refs/tags/2.4.3.tar.gz
sudo tar -xzvf 2.4.3.tar.gz
sudo mv magento2-2.4.3/ magento2/
cd magento2

sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin --filename=composer
sudo composer update
sudo composer install -v

sudo service php7.3-fpm restart

cd /var/www/html/magento2/bin
# sudo ./magento setup:install --base-url=http://vinhvuvuot-dev.com/ --db-host=localhost --db-name=magento2 --backend-frontname=admin --db-user=magento --db-password=magento --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=huuvuot2001 --language=en_US --currency=VND --timezone=Asia/Ho_Chi_Minh --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=localhost --elasticsearch-port=9200
sudo ./magento setup:install --base-url=http://vinhvuvuot-dev.com/ --db-host=localhost --db-name=magento2 --backend-frontname=admin --db-user=root --db-password=root --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=huuvuot2001 --language=en_US --currency=VND --timezone=Asia/Ho_Chi_Minh --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=localhost --elasticsearch-port=9200
sudo chown -R $USER:$USER /var/www/html/magento2/
sudo chmod -R 777 /var/www/html/magento2/
sudo sh -c "echo '127.0.0.1 vinhvuvuot-dev.com' >> /etc/hosts"

# sửa file này
# sudo nano /etc/nginx/sites-enabled/vinhvuvuot-dev.com

    # upstream fastcgi_backend {
    # server   unix:/run/php/php7.3-fpm.sock;
    # }
    
    # server {
    #     server_name vinhvuvuot-dev.com;
    #     listen 80;
    #     set $MAGE_ROOT /var/www/html/magento2;
    #     set $MAGE_MODE default;
    #     # or production access_log /var/log/nginx/myMagentoSite.com-access.log;
    #     error_log /var/log/nginx/example.com-error.log;
    #     include /var/www/html/magento2/nginx.conf.sample;
    # }

sudo service nginx restart

# sau khi cài thêm module bằng composer
# bin/magento setup:upgrade
# bin/magento setup:di:compile