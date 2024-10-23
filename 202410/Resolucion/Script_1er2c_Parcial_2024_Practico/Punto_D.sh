#!/bin/bash

echo 
echo " Creacion de estructura Asimetrica: "
echo

#Testeo con una estructura chica
#mkdir -p $HOME/Ejercicio_E_test/{{correo,cliente}/cartas_{1..3},correo/carteros_{1..4}}

# Creo la estructura que se pide
mkdir -p $HOME/Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros_{1..10}}

echo
echo " Muestro estructura: "
tree $HOME/Estructura_Asimetrica/  --noreport  | pr -T -s' ' -w 80 --column 4

