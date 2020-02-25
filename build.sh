#!/bin/sh

docker network create icloud
docker volume create peach
docker rm -f peach
docker run -d --name peach --network icloud -p 10086:22 -v peach:/home/admin/.ssh peach

