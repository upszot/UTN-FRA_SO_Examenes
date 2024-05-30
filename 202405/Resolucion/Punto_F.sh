#!/bin/bash

echo
echo "Filtro Basico: "
mkdir Punto_F
grep MemTotal /proc/meminfo > Punto_F/Filtro_basico.txt
grep "model name" /proc/cpuinfo | tail -n1 >> Punto_F/Filtro_basico.txt

echo
echo "Muestro archivo: "
cat Punto_F/Filtro_basico.txt
echo

