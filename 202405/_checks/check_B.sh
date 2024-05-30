#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

clear
echo "Se espera ver: "
echo "Disco de 6G"
echo "2 Particiones Primarias de 2G Montadas en Peliculas y series"
echo "2 Particiones Logicas de 1G   Montadas en libros y revistas"
echo
lsblk -f
echo
echo "df -h"
df -h
echo "fdisk -l "
sudo fdisk -l $(sudo fdisk -l  |grep "6 GiB" | awk '{print $2}' |sed 's/://g')
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_B.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_B.sh
echo "-------------------------------------------------------------"
echo
