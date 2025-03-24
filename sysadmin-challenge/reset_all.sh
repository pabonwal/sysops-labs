#!/bin/bash
# reset_all.sh

status=$(docker ps |grep bastion |wc -l)
if [ $status = 1 ]; then
    docker stop bastion
    docker container rm bastion
    docker image rm ubuntu:bastion
fi

status=$(docker ps |grep monitor |wc -l)
if [ $status = 1 ]; then
    docker stop monitor
    docker container rm monitor
    docker image rm ubuntu:monitor
fi

status=$(docker network ls |grep servicio |wc -l)
if [ $status = 1 ]; then
    docker network rm servicio
fi

status=$(docker network ls |grep backup |wc -l)
if [ $status = 1 ]; then
    docker network rm backup
fi

status=$(docker network ls |grep oym |wc -l)
if [ $status = 1 ]; then
    docker network rm oym
fi

docker container prune -f
docker image prune -f
docker ps --all