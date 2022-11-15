#!/bin/sh
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update 
sudo apt install -y php8.0 php8.0-xmlrpc php8.0-mysqli php8.0-xml php8.0-mbstring php8.0-gd php8.0-intl php8.0-soap php-sodium mariadb-server git apache2 php8.0-curl php8.0-zip
sudo chmod 777 /var/www/html
sudo sed -i 's/;max_input_vars = 1000/max_input_vars = 5000/' /etc/php/8.0/apache2/php.ini
sudo echo "<?php phpinfo(); ?>" > /var/www/html/index.php
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mariadb
sudo systemctl enable mariadb
cd /var/www/html
sudo git clone -b MOODLE_400_STABLE git://git.moodle.org/moodle.git
sudo mkdir /var/www/moodledata
sudo chmod -R 777 /var/www/
sudo mysql -e "create database moodle; create user'mod'@localhost identified by 'pw'; grant all privileges on moodle.* to 'mod'@localhost; flush privileges;"
sudo systemctl restart apache2
sudo systemctl restart mariadb
sudo ufw allow 80
sudo ufw allow 8080
sudo ufw allow 3306
sudo ufw allow 443