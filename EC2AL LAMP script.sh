## Instructions on how to use this file ##
## Open AWS-linux virtual machine -> Type 'cd /' -> Type 'sudo vim script.sh' ->
 Copy/Paste the code below into the file (Don't forget to press the 'i' key first)
Run the code by typing 'sudo bash script.sh'
enjoy
## COPY THE CHUNK BELOW ONLY. DO NOT COPY ANYTHING ABOVE THIS LINE ##

#!/bin/sh
sudo yum update 
sudo yum clean metadata
sudo yum install httpd
sudo yum clean metadata
sudo yum install vsftpd
sudo yum clean metadata
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start vsftpd.service
sudo chown ec2-user /var/www/html
sudo echo "<h1> Testing 123 </h1>" > /var/www/html/index.html
sudo amazon-linux-extras list
sudo amazon-linux-extras enable php8.0
sudo yum install php php-mysqli php-xml php-mbstring php-gd php-intl php-soap php-sodium php-opcache
sudo yum clean metadata
sudo sed -i 's/; max_input_vars = 1000/max_input_vars = 5000/' /etc/php.ini
sudo systemctl restart httpd
sudo echo "<?php phpinfo(); ?>" > /var/www/html/index.php
sudo amazon-linux-extras enable mariadb10.5
sudo yum install mariadb
sudo yum clean metadata
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql -e "create database moodle; create user'mod'@localhost identified by 'pw'; select user from mysql.user; grant all privileges on moodle.* to 'mod'@localhost; flush privileges;" 
sudo mkdir /var/www/moodledata
sudo chown apache:apache /var/www/moodledata
cd /var/www/html
sudo yum install git
sudo git clone -b MOODLE_400_STABLE git://git.moodle.org/moodle.git
sudo chmod -R 777 moodle
cd moodle
sudo git checkout MOODLE_400_STABLE
sudo git pull
cd /
sudo chmod ugo+rwx /var/www/












