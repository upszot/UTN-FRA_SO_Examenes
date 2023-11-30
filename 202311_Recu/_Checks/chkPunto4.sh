#!/bin/bash
#chkPunto4.sh

reset
echo "Verificacion de los resultados del playbook"
echo "Estructura dir"
tree /tmp/Recu2doParcial_202311
cat /tmp/Recu2doParcial_202311/Alumno/datos.txt
echo
sudo grep -i recu  /etc/sudoers
echo
grep recu /etc/passwd
echo
echo "Verificar task"
echo "Verificar template"
echo "Se puede eliminar /tmp/Recu2doParcial_202311 y reejecutar el playbook"
echo
