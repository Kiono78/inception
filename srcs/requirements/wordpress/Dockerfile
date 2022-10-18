#Lightest, secured image with good community according to https://naiveskill.com/docker-base-image/
#Hope the latest tag works
FROM	alpine:latest

#apk is alpine package manager
#Do I need to sudo there or use something else ?
#When do I need to use the no cache and when shoudl I use it ?
RUN		apk update
RUN		apk add curl

#Getting php 8 below
#I might not need every below package of php8
RUN		apk add php8 php8-fpm php8-common \
		php8-cli php-phar php-mysqli php-mbstring \
		mariadb-client

WORKDIR /var/www/wordpress

#COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools/setup_wordpress.sh .
#COPY ./conf/wp-config.php /var/www/

#get wordpress and explode
# RUN		wget https://www.wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz -C /var/www/
# RUN		rm	latest.tar.gz

#Copy the config wordpress file
#it should most likely be placed in a tmp and check in the script if it is not already installed
RUN chmod +x 	setup_wordpress.sh
#RUN 	sed -i "s/\/run\/php\/php8.1-fpm.sock/wordpress:9000/g" /etc/php8/php-fpm.d/www.conf

#For communication between docker images
EXPOSE	9000

#Should I run or entrypoint
ENTRYPOINT [ "/var/www/wordpress/setup_wordpress.sh" ]

#CMD ["/usr/sbin/php-fpm8.1", "--nodaemonize"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]