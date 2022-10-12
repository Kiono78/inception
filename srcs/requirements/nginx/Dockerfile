FROM alpine:latest

RUN apk update && apk add --update nginx && apk add --update openssl

RUN	mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -nodes \
	-keyout /etc/nginx/ssl/bterral.42.fr.key \
	-out /etc/nginx/ssl/bterral.42.fr.crt \
	-subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=bterral.42.fr/UID=bterral"

COPY conf/wordpress /etc/nginx/sites-enabled

EXPOSE 443

CMD ["-g", "daemon off;"]

ENTRYPOINT ["nginx"]