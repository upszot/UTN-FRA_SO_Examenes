#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

grep -i basico ~/.bash_history



echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh
