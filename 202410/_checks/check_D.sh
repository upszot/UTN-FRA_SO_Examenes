#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PATH_TEMP="/tmp/borrar"
MAPEO_FILE="$SCRIPT_DIR/.soporte/Punto_D_Mapeo.e"
PARCIAL="UTNFRA_SO_1P2C_2024"
gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1
PATH_PRINCIPAL="$(head -n1 ${MAPEO_FILE}.txt)"

mkdir -p "$PATH_TEMP"

# Verificar si el directorio principal existe
if [ ! -d "${HOME}/${PATH_PRINCIPAL}" ]; then
    echo "Punto D - Error Code: 1 - Mensaje: No existe la carpeta: ${HOME}/${PATH_PRINCIPAL}"
    exit 1
fi

# Crear el archivo mapeo de directorios
sudo find "${HOME}/${PATH_PRINCIPAL}" -type d | grep -v "lost+found" | sort | sed 's%/home/vagrant/%%g' > "$PATH_TEMP/Punto_D_Mapeo_Alumno.txt"

# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_D_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt" > /dev/null; then
    echo "Punto D - OK"
else
    echo "Punto D - Error Code: 2 - Mensaje: Diferencias en la Estructura.."
    
    read -p "Ingrese [Enter] para ver las diferencias o  N para salir: " RTA_VER
    if [ "$RTA_VER" != "N" ]; then
    	diff "$PATH_TEMP/Punto_D_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt"
    fi
    exit 2
fi


rm -rf ${MAPEO_FILE}.txt

