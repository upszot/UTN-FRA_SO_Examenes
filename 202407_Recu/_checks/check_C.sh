#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="C"

# ---
clear
echo "Docker"
docker ps
echo 
curl localhost:8081
echo 

# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
