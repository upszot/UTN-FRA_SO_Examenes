#!/bin/bash

REPO_ALUMNO="UTNFRA_SO_1P2C_2024*"
ARCHIVO_RTA="Filtro_Avanzado.txt"
SCRIPT="Punto_F.sh"


PATH_REPO_ALUMNO=$(find $HOME -iname $REPO_ALUMNO)

if [ -z $PATH_REPO_ALUMNO ]; then

    echo "No se encontro el $REPO_ALUMNO "
    echo "Por Favor Verifique manualmente"
    echo "Deberia de estar en:  $HOME/repogit/"
    exit 1
fi

echo
echo "Punto F - Validacion Manual"
echo
PATH_SCRIPT=$(find $PATH_REPO_ALUMNO -iname $SCRIPT )
echo "------ script Alumno: $SCRIPT --------"
cat $PATH_SCRIPT
echo "------------------------------"
echo


PATH_ARCHIVO_RTA=$(find $PATH_REPO_ALUMNO -iname $ARCHIVO_RTA )
echo
echo "--- cat $PATH_ARCHIVO_RTA"
echo
cat $PATH_ARCHIVO_RTA
echo "------------------------------"
echo 

