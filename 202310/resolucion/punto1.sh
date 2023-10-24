#!/bin/bash

echo "Particionamiento automatico"
read -p "Ingrese se nombre del dispositivo de bloque de 5G (Ejemplo /dev/sdc): " DISCO 

echo "ingreso $DISCO"

echo "Particionamiento 1G tipo swap(82)"
sudo fdisk $DISCO << EOF
n
p
1

+1G
t
82
w
EOF

echo
sudo fdisk -l $DISCO
echo

echo "Particionamiento 512M "
sudo fdisk $DISCO << EOF
n
p
2

+512M
w
EOF

echo
sudo fdisk -l $DISCO
echo

echo "Formateo particion como swap"
sudo mkswap ${DISCO}1
echo
echo "Muestro estado de swap antes"
free -h ; swapon -s 
echo
echo "Agrego swap"
sudo swapon ${DISCO}1
echo
echo "Muestro estado de swap Despues"
free -h ; swapon -s 
echo 

echo "Creo punto de montaje"
sudo mkdir -p /datos/punto_1
echo
echo "Formateo particion y monto"
sudo mkfs.ext4 ${DISCO}2
sudo mount ${DISCO}2 /datos/punto_1
echo
echo "Muestro como quedo montada df y lsblk: "
df -h /datos/punto_1 ; lsblk -f ${DISCO}2


