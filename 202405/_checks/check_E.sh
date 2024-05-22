#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

history |grep mkdir |grep -i Ejercicio_E

echo
echo
tree $HOME/Ejercicio_E --noreport  | pr -T -s' ' -w 80 --column 4

echo
read -p "Presione una tecla para continuar: " Pausa
echo
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_E.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_E.sh
