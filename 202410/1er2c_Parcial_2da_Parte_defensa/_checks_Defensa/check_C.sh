#!/bin/bash

USER_VALIDACION=$1

echo
RTA_C_User=$(grep -i UDef_ /etc/passwd  -c)

if [ "$RTA_C_User" -eq "0" ]; then
    echo "Punto C - Error: No hay usuarios creados como UDef_* "
    exit 1
fi

RTA_USER=$(grep UDef_ /etc/passwd  | awk -F ':' '{print $1}')
RTA_HOME=$(grep UDef_ /etc/passwd  | awk -F ':' '{print $6}')
RTA_SHELL=$(grep UDef_ /etc/passwd  | awk -F ':' '{print $7}')


if [ ! -d "$RTA_HOME" ]; then
    echo "Punto C - Error: NO Existe el Home del usuario: $RTA_HOME "
fi

if [ "$RTA_SHELL" != "/bin/bash" ]; then
    echo "Punto C - Error: El interprete de comandos del usuario esta mal seteado "
fi

E_NRO=$(grep "CODIGO:"  $HOME/Defensa/Ejercicios.txt | awk -F ':' '{print $4}')
echo
echo "OK - Punto C - (Parte Obligatoria)"
echo "     Punto C - (Parte Promocion) - Valide Manualmente Grupos de Usuario ($E_NRO)"
echo
echo "Grupos Secundarios del Usuario de Referencia: $USER_VALIDACION"
id -nG $USER_VALIDACION
echo
echo "Grupos Usuario: $RTA_USER"
id $RTA_USER
echo
