#!/bin/bash
history |grep -i basicavanzado

cat $HOME/Punto_G/Filtro_Avanzado.txt

echo
echo "Ejecutar Cat del archivo donde se guardo los comandos para el punto en cuestion"
ls -l  $HOME/RTA_Examen_$(date +”%Y%m%d”)/
