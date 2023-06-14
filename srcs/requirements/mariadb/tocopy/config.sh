#!/bin/bash

service mysql start

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 3
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# sed -i "s/password =/password = ${SQL_PASSWORD}/" /etc/mysql/debian.cnf
service mysql stop

mysqld_safe 

# tail -f /dev/null