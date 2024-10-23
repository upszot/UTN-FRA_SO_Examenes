#!/bin/bash

# Creo grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Obtengo Hash de la clave de mi usuario
HASH=$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')

# Creo Usuarios Alumnos
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1c2_2024_A3

# Creo Usuarios Profesores
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gProfesores p1c2_2024_P1

# Seteo owner
sudo chown -R p1c2_2024_A1.p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2.p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3.p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1.p1c2_2024_gProfesores /Examenes-UTN/profesores

# Seteo Permisos
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores


echo "Muestro permisos y owner de carpetas: "
echo 
sudo ls -l /Examenes-UTN
echo

# Creo Archivo validar.txt
sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1

echo
echo "Muestro los nombres de los usuarios que estan cargados en los archivos.."
echo
sudo grep -R p1c2 /Examenes-UTN/

# O muestro todo el contenido de los archivos "validar.txt"
#sudo find /Examenes-UTN/ -name "validar.txt" -exec cat {} \;
