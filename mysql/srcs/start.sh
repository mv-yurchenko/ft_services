#!/bin/sh

openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root < /srcs/database.sql

mysql --user=root wordpress < /srcs/wordpress.sql

printf "Database started !\n"

tail -F /dev/null