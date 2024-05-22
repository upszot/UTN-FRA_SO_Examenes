#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

history |grep -i basico



echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_F.sh
