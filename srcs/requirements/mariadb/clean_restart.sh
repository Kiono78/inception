#! /bin/sh

docker kill $(docker ps -q)
docker system prune -a
#docker build -t test .
#docker run -t -d -p 8080:3306 --name test test
#docker exec -it test /bin/sh
