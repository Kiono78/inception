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
RUN		apk add php8 php8-fpm php8-common php8-xml php8-curl \
		php8-gd php8-cli php8-dev php8-imap php8-mbstring php8-soap \
		php8-zip php8-bcmath

RUN		mkdir -p /var/www/wordpress

#get wordpress and explode
RUN		wget https://www.wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz -C /var/www/
RUN		rm	latest.tar.gz

#Copy the config wordpress file
#it should most likely be placed in a tmp and check in the script if it is not already installed
COPY	conf/wp-config.php /var/www/wordpress
COPY 	tools/setup_wordpress.sh .	
RUN 	sed -i "s/\/run\/php\/php8.1-fpm.sock/wordpress:9000/g" /etc/php8/php-fpm.d/www.conf

#For communication between docker images
EXPOSE	9000

RUN		chmod +x setup_wordpress.sh
#Should I run or entrypoint
RUN 	[ "sh", "setup_wordpress.sh" ]