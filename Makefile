#docker compose actions

all: volumes build run

volumes: volume_db volume_wp

volume_db:
	mkdir -p /home/bterral/data/mariadb

volume_wp:
	mkdir -p /home/bterral/data/wp

build:
	sudo docker-compose -f ./srcs/docker-compose.yml build

#-d run in the background
run:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

#-v remove volumes
down:
	sudo docker-compose -f ./srcs/docker-compose.yml down --volumes

prune: down
	sudo docker system prune --volumes

rm_dockervolume:
	docker volume rm $(shell docker volume ls -q)

exec:
	docker exec -it $(shell docker ps -q) /bin/sh

logs:
	docker logs $(shell docker ps -q)

cleanse:
	docker-compose -f ./srcs/docker-compose.yml down
	docker rm -f $(shell docker ps -a -q)
	docker volume rm $(shell docker volume ls -q)

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
