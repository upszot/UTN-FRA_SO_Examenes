#!/bin/bash

echo "Creo Grupo"
sudo groupadd p1c1_2024_g1
echo
echo "Creo usuario"
sudo useradd -m -s /bin/bash -G p1c1_2024_g1 p1c1_2024_u1

#Esto no lo hagan en produccion.. es solo para fines didacticos.
echo "Seteo clave (conocida) al usuario: "
echo "p1c1_2024_u1:clave1" | sudo chpasswd
echo

echo "Ajusto los Permisos: "
sudo chmod -R 750 /datos
echo
echo "Ajusto Dueños: "
sudo chown -R p1c1_2024_u1:p1c1_2024_g1 /datos
echo
echo "Valido permisos y owners"
sudo ls -ld /datos
sudo ls -l /datos
echo

echo "Creo archivo con p1c1_2024_u1 "
su -c "whoami > /datos/validar1.txt" p1c1_2024_u1
echo
echo "Muestro permisos del archivo: "
sudo ls -l /datos/validar1.txt
echo "Muestro archivo: "
sudo cat /datos/validar1.txt
echo

