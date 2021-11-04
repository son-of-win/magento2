# install elasticsearch
sudo apt install apt-transport-https 
sudo apt install default-jre
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install elasticsearch
# sửa các file config
# sudo nano /etc/elasticsearch/elasticsearch.yml
#     network.host: 0.0.0.0
#     http.cors.enabled: true
#     http.cors.allow-origin: "*"
#     transport.host: 127.0.0.1
#     http.port: 9200
#     transport.tcp.port: 9300
# sudo nano /etc/elasticsearch/jvm.options
#     -Xms128m
#     -Xmx128m
# sudo service elasticsearch start

