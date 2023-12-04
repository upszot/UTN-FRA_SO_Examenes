#!/bin/bash
#chkPunto2.sh
STRING="R2P_20231204"

reset
echo "Se espera ver script"
echo "Crea Grupos y Usuarios (con Hash del usuario pasado por parametro)"
echo
sudo grep "${STRING}" /etc/shadow 
echo 
grep "${STRING}" /etc/passwd 
echo
ls -l /work_20231204/
echo
echo "Ver script: "
ls -l /usr/local/bin/
