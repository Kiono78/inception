DOCKER-COMPOSE	:= ./srcs/docker-compose.yml
DB_VOLUME 		:= /home/bterral/data/mariadb
WP_VOLUME		:= /home/bterral/data/wp

all: host volumes build run

host:
	grep bterral.42.fr /etc/hosts || echo "127.0.0.1 bterral.42.fr" >> /etc/hosts

#local volumes
volumes: volume_db volume_wp

volume_db:
	mkdir -p $(DB_VOLUME)

volume_wp:
	mkdir -p $(WP_VOLUME)

local_volume_clean:
	rm -rf $(DB_VOLUME)
	rm -rf $(WP_VOLUME)

#docker-compose commands
build:
	docker-compose -f $(DOCKER-COMPOSE) build

run:
	docker-compose -f $(DOCKER-COMPOSE) up -d

start:
	docker-compose -f $(DOCKER-COMPOSE) start

stop:
	docker-compose -f $(DOCKER-COMPOSE) stop

down:
	docker-compose -f $(DOCKER-COMPOSE) down

ps:
	docker-compose -f $(DOCKER-COMPOSE) ps

images:
	docker-compose -f $(DOCKER-COMPOSE) images


#docker-compose clean ups

clean:
	sudo docker-compose -f $(DOCKER-COMPOSE) down -v --rmi all --remove-orphans

fclean: clean local_volume_clean

#correction hardcore killall

start_correction: killall local_volume_clean

killall:
	docker stop $(shell docker ps -qa) 2 > /dev/null
	docker rm $(shell docker ps -qa) 2 > /dev/null
	docker rmi $(shell docker images -qa) 2 > /dev/null
	docker volume rm $(docker volume ls -q) 2 > /dev/null
	docker network rm $(docker network ls -q) 2 > /dev/null

prune: local_volume_clean
	docker system prune --volumes

#Commands to check container states

local_connect_db:
	mysql -h $(shell docker inspect $(shell docker ps -aqf "name=mariadb") --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}') -u bterral -p

