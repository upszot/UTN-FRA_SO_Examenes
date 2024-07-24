#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="B"

# ---
clear
echo "Se espera ver Script: "
ls -l /usr/local/bin/
echo
cat /usr/local/bin/*.sh
echo 

# --- Estructura
echo
echo "Estructura"
tree /tmp/head-check
echo
echo "Veo contenido de los archivos: "
grep -R -i code /tmp/head-check/
echo
read -p "Enter para continuar... " PAUSA
echo
echo
echo "Ver /var/log/status_url.log :"
cat /var/log/status_*.log
echo
echo
read -p "Enter para continuar... " PAUSA
# --- Comandos usados:
echo
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
