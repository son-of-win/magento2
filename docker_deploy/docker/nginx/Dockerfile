FROM nginx

RUN cd /etc/nginx && sed -i "s/user www-data;/user $USER;/" nginx.conf 
ADD ./docker/nginx/vinhvuvuot-dev.com /etc/nginx/sites-enabled
# RUN chown -R $USER:$USER /var/www/html/magento2/ 
# RUN chmod -R 777 /var/www/html/magento2/
RUN sh -c "echo '127.0.0.1 vinhvuvuot-dev.com' >> /etc/hosts"