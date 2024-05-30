#!/bin/bash 

echo
echo "Filtro Avanzado: "
mkdir Punto_G
echo "Mi ip publica es: $(curl -s ifconfig.me)" > Punto_G/Filtro_Avanzado.txt

#Los que tenian intel la tenian mas facil...
#grep "model name" /proc/cpuinfo |tail -n1 |awk '{print "CPU Modelo: "$6 " Frecuencia: " $9}'

#AMD un poquito mas dificil
#grep  "model name" /proc/cpuinfo | tail -n1
#grep  "cpu MHz" /proc/cpuinfo | tail -n1
echo
echo "PU Modelo: $(grep "model name" /proc/cpuinfo | tail -n1| awk '{print $6 }') Frecuencia: $(grep "cpu MHz" /proc/cpuinfo | tail -n1| awk '{print $4 }') MHz" >> Punto_G/Filtro_Avanzado.txt

echo
echo "Muestro archivo: "
cat Punto_G/Filtro_Avanzado.txt
echo

