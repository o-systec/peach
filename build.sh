#!/bin/sh

docker network create icloud
docker volume create hello
docker rm -f hello
docker rm -f hello1
docker run -d --name hello --network icloud -p 10086:22 -v hello:/home/admin/.ssh hello
docker run -d --name hello1 --network icloud -p 10087:22 -v hello:/home/admin/.ssh hello

