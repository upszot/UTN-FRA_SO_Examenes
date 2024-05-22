#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
history |grep mkdir |grep -i datos

echo
tree /datos/

echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_A.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_A.sh
