#!/bin/bash

echo
echo "Punto_2 (LVM)"
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

echo "--- Analisis ---"
echo "De acuerdo al cuadro anterior Necesitariamos generar: "
echo "1 particion de 2G para el PV que se agregara en el VG vg_docker"
echo "1 particion del resto del disco para el vg_datos"
echo
echo "segudo crear los pv, vg y lv, formatearlos, crear puntos de montaje y editar /etc/fstab"
echo 


