#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="D"

# ---
clear
echo "Ansible: "
cat ansible/roles/2do_parcial/tasks/main.yml
echo 
cat ansible/roles/2do_parcial/templates/*
echo

# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
