#!/bin/bash

PARCIAL="UTNFRA_SO_1P2C_2024"
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
MAPEO_FILE_PRINCIPAL="$SCRIPT_DIR/.soporte/Punto_A_Mapeo.e"
gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE_PRINCIPAL}.txt -d $MAPEO_FILE_PRINCIPAL > /dev/null 2>&1
PATH_PRINCIPAL="$(head -n1 ${MAPEO_FILE_PRINCIPAL}.txt)"

MAPEO_FILE="$SCRIPT_DIR/.soporte/Punto_C_Mapeo.e"
gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1



PATH_TEMP="/tmp/borrar"
mkdir -p "$PATH_TEMP"


sudo find $PATH_PRINCIPAL -type d | grep -v "lost+found" | sort | xargs -I PATH sudo stat -c %a,%U,%G PATH  > "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt"

# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt" > /dev/null; then
    echo "Punto C - OK"
else
    echo "Punto C - Error Code: 1 - Mensaje: Permisos y/o Owner mal seteados"
    diff "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt"
    exit 1
fi
