#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="A"

# ---
clear
echo "Se espera ver: "
echo "Discos de 1G y 2G"
echo "vg_Datos -> lv_docker=5MB"
echo "vg_Datos -> lv_workareas=1.5G"
echo "vg_temp  -> lv_swap"
echo 

# --- Particiones
echo "lsblk -f"
lsblk -f
echo

# --- LVM
echo "pvs - vgs - lvs "
sudo pvs
echo
sudo vgs
echo
sudo lvs
echo

# --- SWAP
echo "swap"
free -h 
swapon -s 

# --- Montaje
echo
echo "df -h"
df -h

# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
