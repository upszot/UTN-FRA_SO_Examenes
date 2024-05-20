#!/bin/bash
history |grep mkdir |grep -i datos

echo
tree /datos/

echo
echo "Ejecutar Cat del archivo donde se guardo los comandos para el punto en cuestion"
ls -l  $HOME/RTA_Examen_$(date +”%Y%m%d”)/
