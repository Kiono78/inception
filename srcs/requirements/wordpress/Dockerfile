#Lightest, secured image with good community according to https://naiveskill.com/docker-base-image/
#Hope the latest tag works
FROM	alpine:3.16

RUN		apk update
RUN		apk add curl

RUN		apk add php8 php8-fpm php8-common \
		php8-cli php-phar php-mysqli php-mbstring \
		mariadb-client

WORKDIR /var/www/wordpress

COPY ./tools/setup_wordpress.sh .

RUN chmod +x 	setup_wordpress.sh

EXPOSE	9000

ENTRYPOINT [ "/var/www/wordpress/setup_wordpress.sh" ]