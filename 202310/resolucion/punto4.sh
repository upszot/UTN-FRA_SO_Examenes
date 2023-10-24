#!/bin/bash
echo "instalo tree para tenerlo a mano"
sudo apt update && sudo apt install tree -y
echo
echo "Punto 4 - Creacion de estructura simetrica "

mkdir -p Estructura_1/{Alumnos,profesores}/materias_{1..50}
echo
echo "Muestro la estrucura"
tree $HOME/Estructura_1 

