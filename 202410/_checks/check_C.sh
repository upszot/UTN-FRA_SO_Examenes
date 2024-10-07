#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
MAPEO_FILE_PRINCIPAL="$SCRIPT_DIR/.soporte/Punto_A_Mapeo.txt"
PATH_PRINCIPAL="$(head -n1 $MAPEO_FILE_PRINCIPAL)"

MAPEO_FILE="$SCRIPT_DIR/.soporte/Punto_C_Mapeo.txt"


PATH_TEMP="/tmp/borrar"
mkdir -p "$PATH_TEMP"


sudo find $PATH_PRINCIPAL -type d | grep -v "lost+found" | sort | xargs -I PATH sudo stat -c %a,%U,%G PATH  > "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt"

# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt" "$MAPEO_FILE" > /dev/null; then
    echo "Punto C - OK"
else
    echo "Punto C - Error Code: 1 - Mensaje: Permisos y/o Owner mal seteados"
    diff "$PATH_TEMP/Punto_C_Mapeo_Alumno.txt" "$MAPEO_FILE"
    exit 1
fi

