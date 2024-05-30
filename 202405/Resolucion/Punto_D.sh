#!/bin/bash
echo
echo "Creo grupo p1c1_2024_Todos: "
sudo groupadd p1c1_2024_Todos

echo 
echo "Creo usuario: p1c1_2024_u2 "
sudo useradd -m -s /bin/bash -g p1c1_2024_Todos  -p "$(sudo grep p1c1_2024_u1 /etc/shadow | awk -F ':' '{print $2}')" p1c1_2024_u2
echo
echo "Muestro que las claves son iguales: "
sudo grep p1 /etc/shadow
echo

echo "Agrego el grupo p1c1_2024_Todos al usuario p1c1_2024_u1: "
sudo usermod -a -G p1c1_2024_Todos p1c1_2024_u1
echo
echo "Muestro el grupo todos: "
grep p1c1_2024_Todos /etc/group
echo

echo "Modifico owners en /datos "
sudo chown -R p1c1_2024_u1:p1c1_2024_Todos /datos 
echo

echo "Modifico permisos para que  el grupo pueda escribir y otros puedan conocer existencia de archivos: "
sudo chmod -R 774 /datos
echo
echo "Valido permisos:i (de otros) "
ls -l /datos
cat /datos/validar1.txt
echo

echo "add salida comando id: "
su -c "id >> /datos/validar1.txt" p1c1_2024_u2
echo
echo "Muestro archivo validar1: "
sudo cat /datos/validar1.txt

