#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

clear
echo
echo "Validar /etc/passwd: "
sudo grep p1c1  /etc/passwd  
echo
echo "Valido /etc/group: p1c1_2024_Todos e id  p1c1_2024_u2"
sudo grep -i "p1c1_2024_Todos"  /etc/group
id p1c1_2024_u2
echo
echo "home de los usuarios: "
ls -l /home |grep p1c1
echo
echo "Misma Clave"
sudo grep p1c1  /etc/shadow 
echo
echo
read -p "Presione una tecla para continuar: " Pausa
echo
echo "Alta usuario: "
grep useradd  ~/.bash_history |grep -i p1c1_2024_u2
echo

echo "Validar de Permisos /datos  "
sudo ls -l /datos


echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C_D.sh"
echo

cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C_D.sh

