#!/bin/bash
#chkPunto4.sh

reset
echo "Verificacion de los resultados del playbook"
echo "Estructura dir"
tree /tmp/Recuperatorio_2doParcial_20231204
cat /tmp/Recuperatorio_2doParcial_20231204/Alumno/datos.txt
echo
sudo grep -i recu  /etc/sudoers
echo
grep recu /etc/passwd
echo
echo "Verificar task"
echo "Verificar template"
echo "Se puede eliminar /tmp/Recuperatorio_2doParcial_20231204 y reejecutar el playbook"
echo
