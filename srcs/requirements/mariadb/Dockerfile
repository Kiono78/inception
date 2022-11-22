FROM alpine:3.16

#Still what about no cache
RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client mariadb-server-utils

#Copy files to container root
COPY	tools/setup_db.sql	.
COPY	tools/entrypoint.sh	.
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN		chmod +x ./entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "./entrypoint.sh" ]