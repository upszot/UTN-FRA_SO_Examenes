#!/bin/bash
echo 
echo "--- RESOLUCION PUNTO 2 ---"
echo

echo "● Realizar las Particiones Lógicas Necesarias para poder"
echo "● Utilizar LVM para lo siguiente"
echo "● Los montajes deben ser Persistentes"
echo
printf "%-16s %-20s %-18s %-30s\n" "VG" "LV" "Tamaño" "Punto de Montaje"
printf "%-16s %-20s %-18s %-30s\n" "vg_docker" "lv_docker" "2GB" "/var/lib/docker/"
printf "%-16s %-20s %-18s %-30s\n" "vg_datos" "lv_multimedia" "1GB" "/datos/multimedia"
printf "%-16s %-20s %-18s %-30s\n" "vg_datos" "lv_repo" "Espacio restante" "/datos/repogit"
echo


echo "De acuerdo al cuadro anterior Necesitariamos generar: "
echo "1 particion de 2G para el PV que se agregara en el VG vg_docker"
echo "1 particion del resto del disco para el vg_datos"
echo
read -p "Ingrese se nombre del dispositivo de bloque de 5G (Ejemplo /dev/sdc): " DISCO 

echo "ingreso $DISCO"

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



