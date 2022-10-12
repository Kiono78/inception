FROM alpine:latest

#Still what about no cache
RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client mariadb-server-utils

#Copy files to container root
COPY	tools/setup_db.sql	.
COPY	tools/entrypoint.sh	.
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

#Grant right son mysql folder to mysql user
#RUN		chown -R mysql:mysql /var/lib/mysql

#Launch installation of mariadb
#RUN		mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
#RUN 		/etc/init.d/mariadb setup
RUN		chmod +x ./entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "./entrypoint.sh" ]