#!/bin/bash

echo
echo "Punto_3 (LVM Expancion)"
echo
# Cuadro 1
printf "%-15s %-20s %-20s\n" "LV" "Tamaño Original" "Agregado"
printf "%-15s %-20s %-20s\n" "lv_docker" "2GB" "Añadir el Resto"
printf "%-15s %-20s %-20s\n" "lv_multimedia" "1GB" "Añadir 2GB"
printf "%-15s %-20s %-20s\n" "lv_repo" "Espacio restante" "Añadir 2GB"
echo
# Cuadro 2
printf "● Crear\n\n"
printf "%-15s %-15s %-15s %-20s\n" "VG" "LV" "Tamaño" "Punto de Montaje"
printf "%-15s %-15s %-15s %-20s\n" "vg_datos" "lv_swap" "1GB" "Agregar a la memoria swap"
echo

