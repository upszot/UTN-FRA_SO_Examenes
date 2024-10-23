#!/bin/bash

if [ -d $HOME/Defensa/ ]; then
    echo "Por favor Ejecute: "
    echo "cd $HOME/Defensa/ "
    echo "cat $HOME/Defensa/Ejercicios.txt"
    exit 1
fi

mkdir -p $HOME/Defensa/script_Puntos
PARCIAL="UTNFRA_SO_1P2C_2024"
DIR_BASE=$(dirname "$(readlink -f "$0")")
SCRIPT_DIR="${DIR_BASE}/.Enunciados"

# Numeros Random
NroParticiones="$(( ( RANDOM % 4 ) + 1 ))"
NroEstructura="$(( ( RANDOM % 5 ) + 1 ))"
NroUser="$(( ( RANDOM % 2 ) + 1 ))"
NroPermisos="$(( ( RANDOM % 2 ) + 1 ))"

ECODIGO="A${NroParticiones}:B${NroEstructura}:C${NroUser}:D${NroPermisos}"

# --- Genera Enunciado ---#
echo "CODIGO: $ECODIGO" > $HOME/Defensa/Ejercicios.txt
# CODIGO: A1:B1:C1:D1


# A - Particion y Montaje:
touch $HOME/Defensa/script_Puntos/Def_PuntoA.sh
RTA=$(gpg --batch --yes --passphrase "$PARCIAL" --output - -d ${SCRIPT_DIR}/A_Particiones_${NroParticiones}.e >> $HOME/Defensa/Ejercicios.txt 2> /dev/null)

# B - Estructura:
touch $HOME/Defensa/script_Puntos/Def_PuntoB.sh
RTA=$(gpg --batch --yes --passphrase "$PARCIAL" --output - -d ${SCRIPT_DIR}/B_Estructura_${NroEstructura}.e >> $HOME/Defensa/Ejercicios.txt 2>> /dev/null)

# C - Usuarios
touch $HOME/Defensa/script_Puntos/Def_PuntoC.sh
RTA=$(gpg --batch --yes --passphrase "$PARCIAL" --output - -d ${SCRIPT_DIR}/C_Usuarios_${NroUser}.e >> $HOME/Defensa/Ejercicios.txt 2>> /dev/null)

# D - Permisos:
touch $HOME/Defensa/script_Puntos/Def_PuntoD.sh
mkdir $HOME/Defensa/Permisos
RTA=$(gpg --batch --yes --passphrase "$PARCIAL" --output - -d $SCRIPT_DIR/D_Permisos_$NroPermisos.e   >> $HOME/Defensa/Ejercicios.txt 2> /dev/null)
RTA=$(gpg --batch --yes --passphrase "$PARCIAL" --output - -d $SCRIPT_DIR/D_Permisos_$NroPermisos.e   > $HOME/Defensa/Permisos/archivo.txt 2> /dev/null)

sudo chattr +i $HOME/Defensa/Ejercicios.txt
sudo chattr +i $HOME/Defensa/Permisos/archivo.txt

clear
echo
echo "Por favor Ejecute: "
echo "cd $HOME/Defensa/ "
echo "cat $HOME/Defensa/Ejercicios.txt"
echo
echo

