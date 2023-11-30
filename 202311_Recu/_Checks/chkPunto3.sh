#!/bin/bash

#chkPunto3.sh
reset
echo "Ver pagina web & Mostrar DockerHub"
curl localhost:8081

echo 

echo "Ver docker-compose: "
echo
cat docker/docker-compose.yml

