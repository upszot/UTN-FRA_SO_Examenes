#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

clear
echo "Validar Usuario y grupos"
echo
sudo grep p1c1  /etc/passwd  
echo
sudo grep -i "p1c1"  /etc/group
echo
echo "home de los usuarios: "
ls -l /home

echo
echo "Misma Clave"
sudo grep p1c1  /etc/shadow 
echo
echo "alta usuario"
grep useradd  ~/.bash_history |grep -i p1c1_2024_u2
echo

echo "Validar de Permisos"
sudo ls -l /datos


echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C_D.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C_D.sh

