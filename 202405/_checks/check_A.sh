#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
echo "history: "
history |grep mkdir |grep -i datos

echo "tree: "
sudo tree /datos/

echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_A.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_A.sh
echo "-------------------------------------------------------------"
