#!/bin/bash
history |grep mkdir |grep -i Ejercicio_E

echo
echo
tree $HOME/Ejercicio_E --noreport  | pr -T -s' ' -w 80 --column 4

echo
read -p "Presione una tecla para continuar: " Pausa
echo
echo "Ejecutar Cat del archivo donde se guardo los comandos para el punto en cuestion"
ls -l  $HOME/RTA_Examen_$(date +”%Y%m%d”)/
