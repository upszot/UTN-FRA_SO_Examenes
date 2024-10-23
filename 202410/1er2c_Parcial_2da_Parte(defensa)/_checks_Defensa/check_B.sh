#!/bin/bash
echo
DIR_BASE=$(dirname "$(readlink -f "$0")")
DIR_PADRE=$(dirname "$DIR_BASE")   


PATH_TEMP="/tmp/borrar"
PARCIAL="UTNFRA_SO_1P2C_2024"


E_NRO=$(grep "CODIGO:"  $HOME/Defensa/Ejercicios.txt | awk -F ':' '{print $3}')
MAPEO_FILE="$DIR_BASE/.soporte/Punto_${E_NRO}_Mapeo.e"

gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1

PATH_PRINCIPAL="$(head -n1 ${MAPEO_FILE}.txt)"

mkdir -p "$PATH_TEMP"

# Verificar si el directorio principal existe
if [ ! -d "$HOME/Defensa/$PATH_PRINCIPAL" ]; then
    echo "Punto B - Error Code: 1 - Mensaje: No existe la carpeta: $HOME/Defensa/$PATH_PRINCIPAL"
    exit 1
fi

# Crear el archivo mapeo de directorios
find $HOME/Defensa/$PATH_PRINCIPAL -type d  | sed  "s|$HOME/Defensa/||g" | sort > "$PATH_TEMP/Punto_B_Mapeo_Alumno.txt"

# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_B_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt" > /dev/null; then
    echo "Punto B - Estructura OK - Validacion Manual del comando - ($E_NRO)"
else
    echo "Punto B - Error Code: 2 - Mensaje: Diferencias en la Estructura.."
    diff "$PATH_TEMP/Punto_B_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt"
    exit 2
fi

rm -rf ${MAPEO_FILE}.txt


