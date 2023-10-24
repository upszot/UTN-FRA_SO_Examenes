#!/bin/bash

echo "Punto 5 - Creacion de estructura Asimetrica "

mkdir -p Estructura_2/{Aves/{Camina/Gallina,Nada/Pinguino,Vuelan/{Halcon,Paloma}},Mamiferos/{Camina/{Gato,Perro},Nada/{Ballena,Delfin}}}
echo
echo "Muestro la estrucura"
tree $HOME/Estructura_2 

