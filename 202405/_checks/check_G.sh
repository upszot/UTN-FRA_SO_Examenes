#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

grep -i avanzado ~/.bash_history

cat $HOME/Punto_G/Filtro_Avanzado.txt

echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_G.sh"
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_G.sh
echo "-------------------------------------------------------------"
