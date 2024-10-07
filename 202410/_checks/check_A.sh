#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
#PATH_PRINCIPAL="/Examenes-UTN"
PATH_TEMP="/tmp/borrar"
PARCIAL="UTNFRA_SO_1P2C_2024"
MAPEO_FILE="$SCRIPT_DIR/.soporte/Punto_A_Mapeo.e"

gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1

PATH_PRINCIPAL="$(head -n1 ${MAPEO_FILE}.txt)"

mkdir -p "$PATH_TEMP"

# Verificar si el directorio principal existe
if [ ! -d "$PATH_PRINCIPAL" ]; then
    echo "Punto A - Error Code: 1 - Mensaje: No existe la carpeta: $PATH_PRINCIPAL"
    exit 1
fi

# Crear el archivo mapeo de directorios
sudo find "$PATH_PRINCIPAL" -type d | grep -v "lost+found" | sort > "$PATH_TEMP/Punto_A_Mapeo_Alumno.txt"

# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_A_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt" > /dev/null; then
    echo "Punto A - OK"
else
    echo "Punto A - Error Code: 2 - Mensaje: Diferencias en la Estructura.."
    diff "$PATH_TEMP/Punto_A_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt"
    exit 2
fi

rm -rf ${MAPEO_FILE}.txt

