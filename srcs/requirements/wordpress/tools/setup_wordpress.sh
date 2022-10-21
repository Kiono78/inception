#!/bin/sh

sed -i "s/listen = 127.0.0.1:9000/listen = 9000/" "/etc/php8/php-fpm.d/www.conf";

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo "Wordpress: setting up..."
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/bin/wp;
	wp core download --allow-root;
	sleep 5;
	echo "[i] DB_NAME: $DB_NAME"
	echo "[i] DB_USER: $DB_USER"
	echo "[i] DB_USER_PWD: $DB_USER_PWD"
	echo "[i] DB_HOST: $DB_HOST"
	wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=$DB_HOST
	echo "Wordpress: core installation"
	echo "[i] Domain name: $DOMAIN_NAME"
	echo "[i] wordpress title: $WP_TITLE"
	echo "[i] wp admin login: $WP_ADMIN_LOGIN"
	echo "[i] wp admin user password: $WP_ADMIN_PWD"
	echo "[i] wp email: $WP_ADMIN_EMAIL"
	echo "[i] wordpress user: $WORDPRESS_USER"
	echo "[i] wordpress user email: $WORDPRESS_EMAIL"
	echo "[i] wordpress user password: $WORDPRESS_PASS"
	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email
	wp plugin update --all
	wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASS}
	echo "Wordpress: set up!"
fi

/usr/sbin/php-fpm8 -F