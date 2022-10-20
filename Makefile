DOCKER-COMPOSE = ./srcs/docker-compose.yml
DB_VOLUME = /home/bterral/data/mariadb
WP_VOLUME = /home/bterral/data/wp

all: host volumes build run

#check on VM if working fine
host:
	@if [ -z $(shell grep bterral.42.fr /etc/hosts)] then $(shell sudo echo "127.0.0.1 bterral.42.fr" >> /etc/hosts) fi

#volumes
volumes: volume_db volume_wp

volume_db:
	mkdir -p $(DB_VOLUME)

volume_wp:
	mkdir -p $(WP_VOLUME)

#docker-compose commands
build:
	sudo docker-compose -f $(DOCKER-COMPOSE) build

run:
	sudo docker-compose -f $(DOCKER-COMPOSE) up -d

start:
	sudo docker-compose -f $(DOCKER-COMPOSE) start

stop:
	sudo docker-compose -f $(DOCKER-COMPOSE) stop

down:
	sudo docker-compose -f $(DOCKER-COMPOSE) down

#docker-compose clean ups

clean:
	sudo docker-compose -f $(DOCKER_COMPOSE) down ---rmi all --volumes --remove-orphans

fclean: clean 

#correction hardcore killall

start_correction: killall 

killall:
	docker stop $(shell docker ps -qa)
	docker rm $(shell docker ps -qa)
	docker rmi $(shell docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)

local_volume_clean:
	rm -rf $(DB_VOLUME)
	rm -rf $(WP_VOLUME)






prune: down
	sudo docker system prune --volumes

rm_dockervolume:
	docker volume rm $(shell docker volume ls -q)

exec:
	docker exec -it $(shell docker ps -q) /bin/sh

logs:
	docker logs $(shell docker ps -q)

cleanse:
	rm -rf /home/bterral/data/mariadb
	rm -rf /home/bterral/data/wp
	docker-compose -f $(DOCKER-COMPOSE) down
	docker system prune --volumes
	docker system prune -a
	docker volume rm $(shell docker volume ls -q)

connect_db:
	mysql -h $(shell docker inspect $(shell docker ps -aqf "name=mariadb") --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}') -u bterral -p

#docker actions

# FILES = $(shell ls)
# test:
# 	echo $(FILES)

LST_CONTAINERS := $(shell docker ps -qa)

killall: stop containers_rm images_rm volumes_rm network_rm

stop:
	docker stop $(LST_CONTAINERS)

containers_rm:
	docker rm $(docker ps -qa)

images_rm:
	docker rmi $(docker images -qa)

volumes_rm:
	docker volume rm $(docker volume ls -q)

network_rm:
	docker network rm $(docker network ls -q)
