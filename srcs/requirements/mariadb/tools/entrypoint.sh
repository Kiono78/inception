#!/bin/sh

if [ -d "/run/mysqld" ]; then
	chown -R mysql:mysql /run/mysqld
else
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

#Checking if volume folder is already there
if [ -d /var/lib/mysql/mysql ]; then
	echo "MariaDB volume, skipping databases installation"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "MariaDB volume not found, installing and creating database"
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
	#Information creating databases
	echo "[i] MySQL root Password: $DB_ROOT_PWD"
	echo "[i] Database user: $DB_USER"
	echo "[i] User password: $DB_USER_PWD"
	echo "[i] Database name: $DB_NAME"
	eval "echo \"$(cat setup_db.sql)\"" > tmpSql
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmpSql
	rm tmpSql
fi

#cleanup
rm setup_db.sql

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@


