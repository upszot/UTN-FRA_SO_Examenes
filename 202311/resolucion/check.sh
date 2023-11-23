#!/bin/bash

df -h
echo
grep -iE 'desa|docker' /etc/fstab
echo 
free -m
echo
swapon -s
echo
echo

cat /usr/local/bin/$1 
echo 
grep -iE '2P' /etc/passwd /etc/group
echo
ls -l /work/Desarrollo/
echo
echo

docker container ps
echo
curl http://127.0.0.1:8081
echo
docker container exec -it $(docker container ps -q) cat /share/*
echo
echo

cat /tmp/2doParcial_202311/Datos/Alumno.txt
echo
tree /tmp
echo
cat 202311/ansible/roles/multi_Pruebas/tasks/prueba_202311_2doParcial.yml 
echo
cat 202311/ansible/roles/multi_Pruebas/templates/template_01.j2
echo
which ifconfig htop bpytop
