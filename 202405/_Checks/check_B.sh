#!/bin/bash

clear
echo "Se espera ver: "
echo "Disco de 6G"
echo "2 Particiones Primarias de 2G Montadas en Peliculas y series"
echo "2 Particiones Logicas de 1G   Montadas en libros y revistas"
echo

lsblk -f
echo
df -h


echo
echo "Ejecutar Cat del archivo donde se guardo los comandos para el punto en cuestion"
ls -l  $HOME/RTA_Examen_$(date +”%Y%m%d”)/
