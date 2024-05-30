#!/bin/bash

echo
echo "Creo estructura: "
mkdir -p Ejercicio_E/{{rx,tx}/lotes_{1..20},rx/extras_{1..100}}
echo
echo "Muestro tree: "
tree Ejercicio_E --noreport |pr -T -s'' -w 80 --column 4

