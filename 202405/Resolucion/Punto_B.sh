#!/bin/bash

DISCO=$(sudo fdisk -l |grep Disk |grep "6 GiB" | awk '{print $2}' |sed 's/://g')
echo "Particiono el disco: $DISCO"
echo

sudo fdisk $DISCO << PARTICIONES 
n
p
1

+2G
n
p
2

+2G
n
e
3


n

+1G
n


w
PARTICIONES
echo
echo "Mis Particiones: "
sudo fdisk -l $DISCO
echo 
echo "Formateo las Particiones: "
sudo fdisk -l $DISCO |grep $DISCO |grep -viE 'Disk|exten' |awk '{print "sudo mkfs.ext4 "$1}' |/bin/bash 
echo
echo "Monto las Particiones: "
sudo mount ${DISCO}1 /datos/videos/peliculas
sudo mount ${DISCO}2 /datos/videos/series
sudo mount ${DISCO}5 /datos/textos/libros
sudo mount ${DISCO}6 /datos/textos/revistas
echo
echo "Valido montaje: "
df -h |grep datos
