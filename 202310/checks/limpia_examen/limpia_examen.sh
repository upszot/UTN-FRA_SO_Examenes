#!/bin/bash

echo "Elimina pv,vg y lv..."
read -p "Ingrese Listado de discos a limpiar LVM y Particionamiento (separados por espacios): " DISCOS

echo "Desmonto todos los puntos de montaje"
umount /datos/punto_1 /var/lib/docker/ /datos/multimedia /datos/repogit


echo "Primero elimino lv, vg, pv"
eliminar_lvm.sh $DISCOS
echo "Despues elimino particiones"
eliminar_particion.sh $DISCOS
echo 

echo "Elimina Estructuras directorios puntos 4 y 5"
rm -rf $HOME/Estructura_1 $HOME/Estructura_2

