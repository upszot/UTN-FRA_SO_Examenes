#!/bin/bash

echo "Creo estructura: "
sudo mkdir -p /Examenes-UTN/{profesores,alumno_{1..3}/parcial_{1..3}}

echo
echo "Muestro la estructura creada: "
tree /Examenes-UTN
