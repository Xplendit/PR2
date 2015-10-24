#!/bin/bash
# provision.sh -- install apache and php and mysql(mariadb)
#configureren van firewall 

sudo yum update -y
sudo yum install -y httpd php php-mysql mariadb-server mariadb

sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo systemctl start mariadb
sudo systemctl enable mariadb.service

sudo systemctl restart httpd.service
echo '<?php phpinfo(); ?>' > /var/www/html/info.php

sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=mysql
sudo systemctl restart firewalld
sudo systemctl enable firewalld

mysql_password="Groep09" 

mysqladmin password "${mysql_password}"
#Remove anonymous users
#mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.user WHERE User='';"

#Remove test database
mysql --user=root --password="${mysql_password}" --init-command="DROP DATABASE test;"

#Remove remote root
#mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

#Removing privileges on test database
#mysql --user=root --password="${mysql_password}" --init-command="DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
