#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="B"

# ---
clear
echo "Se espera ver Script: "
ls -l /usr/local/bin/
echo
cat /usr/local/bin/*AltaUser-Groups.sh
echo 

# --- Usuarios y grupos
echo
echo "usuarios"
grep -i 2P /etc/passwd
echo
read -p "Ingrese usuario de origen de la clave:" USER_ORIGEN_CLAVE
echo
echo "Veo claves:"
sudo grep -iE "${USER_ORIGEN_CLAVE}|2P" /etc/shadow
echo
echo "Home usuarios:"
ls -l /work/


# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
