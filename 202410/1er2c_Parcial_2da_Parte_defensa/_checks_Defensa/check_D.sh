#!/bin/bash
echo
DIR_BASE=$(dirname "$(readlink -f "$0")")
PATH_TEMP="/tmp/borrar"
mkdir -p "$PATH_TEMP"
PARCIAL="UTNFRA_SO_1P2C_2024"
E_NRO=$(grep "CODIGO:"  $HOME/Defensa/Ejercicios.txt | awk -F ':' '{print $5}')
MAPEO_FILE="$DIR_BASE/.soporte/Punto_${E_NRO}_Mapeo.e"

gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1

whoami_UG=$(echo "$(whoami),$(id -ng $(whoami))")
owner_Path=$(ls -ld /home/vagrant/Defensa/Permisos/ | awk '{print $3","$4}')
sudo find /home/vagrant/Defensa/Permisos/ -exec sudo stat -c %a" "%n {} \; | sed "s|$HOME/Defensa/||g" |sort -k2 > "$PATH_TEMP/Punto_D_Mapeo_Alumno.txt"

# Verifico que no haya cambiado los owner
if [ "$owner_Path" != "$whoami_UG" ]; then
    echo "Punto D - Error Code: 1 - Mensaje: Owner Modificado"
fi

echo "Validar Segun Enunciado: ($E_NRO)"
# Comparar el resultado con el archivo de soporte
if diff "$PATH_TEMP/Punto_D_Mapeo_Alumno.txt" "${MAPEO_FILE}.txt" > /dev/null; then
    echo "Punto D - OK"
else
    echo "Punto D - Error Code: 2 - Mensaje: Permisos mal seteados"
fi

echo
echo "ls -ld  $HOME/Defensa/Permisos "
ls -ld  $HOME/Defensa/Permisos
echo
echo "ls -l  $HOME/Defensa/Permisos "
ls -l  $HOME/Defensa/Permisos
echo
echo "cat  $HOME/Defensa/Permisos/archivo.txt "
cat  $HOME/Defensa/Permisos/archivo.txt
echo

rm -rf ${MAPEO_FILE}.txt

