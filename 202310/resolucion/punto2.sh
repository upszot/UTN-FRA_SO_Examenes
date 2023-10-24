#!/bin/bash
./punto2_consigna.sh
echo 
echo "--- RESOLUCION PUNTO 2 ---"
echo
echo
read -p "Ingrese se nombre del dispositivo de bloque de 5G (Ejemplo /dev/sdc): " DISCO 

echo "ingreso $DISCO"
echo "Presiona Enter para continuar..."
read

echo "Particionamiento 2G tipo LVM(8e)"
sudo fdisk $DISCO << EOF
n
p
3

+2G
t
3
8e
w
EOF

echo
sudo fdisk -l $DISCO
echo

echo "Presiona Enter para continuar..."
read
echo "Particionamiento del resto del disco tipo LVM(8e) "
sudo fdisk $DISCO << EOF
n
p
4


t
4
8e
w
EOF

echo
sudo fdisk -l $DISCO
echo



