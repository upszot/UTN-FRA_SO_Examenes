#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

clear
grep -i basico ~/.bash_history

echo
read -p "Presione una tecla para continuar: " Pausa
echo

echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh
