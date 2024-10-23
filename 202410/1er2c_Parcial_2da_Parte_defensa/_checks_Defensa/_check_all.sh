#!/bin/bash

# Recibo en $1 el usuario y sino asigno valor por default
USUARIO_VALIDACION_PUNTO_C=${1:-"p1c2_2024_P1"}



clear
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
bash $SCRIPT_DIR/check_A.sh
bash $SCRIPT_DIR/check_B.sh
bash $SCRIPT_DIR/check_C.sh $USUARIO_VALIDACION_PUNTO_C
bash $SCRIPT_DIR/check_D.sh


echo
read -p "[Enter] para Ver Detalles Punto por punto." RTA_VER
clear

echo
echo "Script Punto A:"
cat $HOME/Defensa/script_Puntos/Def_PuntoA.sh
echo
read -p "[Enter] para continuar..." RTA_VER
clear

echo
echo "Script Punto B:"
cat $HOME/Defensa/script_Puntos/Def_PuntoB.sh
echo
read -p "[Enter] para continuar..." RTA_VER
clear

echo
echo "Script Punto C:"
cat $HOME/Defensa/script_Puntos/Def_PuntoC.sh
echo
read -p "[Enter] para continuar..." RTA_VER
clear

echo
echo "Script Punto D:"
cat $HOME/Defensa/script_Puntos/Def_PuntoD.sh
echo
read -p "[Enter] para continuar..." RTA_VER

