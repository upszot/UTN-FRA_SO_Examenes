#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

clear
grep -i avanzado ~/.bash_history

echo
read -p "Presione una tecla para continuar: " Pausa
echo

cat $HOME/Punto_G/Filtro_Avanzado.txt

echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_G.sh"
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_G.sh
echo "-------------------------------------------------------------"
