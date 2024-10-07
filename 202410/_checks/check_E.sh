#!/bin/bash

REPO_ALUMNO="UTNFRA_SO_1P2C_2024*"
ARCHIVO_RTA="Filtro_Basico.txt"



PATH_REPO_ALUMNO=$(find $HOME -iname $REPO_ALUMNO)

if [ -z $PATH_REPO_ALUMNO ]; then

    echo "No se encontro el $REPO_ALUMNO "
    echo "Por Favor Verifique manualmente"
    echo "Deberia de estar en:  $HOME/repogit/"
    exit 1
fi

PATH_ARCHIVO_RTA=$(find $PATH_REPO_ALUMNO -iname $ARCHIVO_RTA )
echo
echo "Cat $PATH_ARCHIVO_RTA"
echo

cat $PATH_ARCHIVO_RTA




