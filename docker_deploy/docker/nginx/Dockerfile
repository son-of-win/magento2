FROM nginx

RUN cd /etc/nginx && sudo sed -i "s/user www-data;/user huuvuot;/" nginx.conf && mkdir sites-enabled
ADD vinhvuvuot-dev.com /etc/nginx/sites-enabled