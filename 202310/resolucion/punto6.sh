#!/bin/bash

echo "Creo grupos"

sudo groupadd Desarrollo
sudo groupadd Testing
sudo groupadd Coordinador

echo "Creo usuarios: "
sudo useradd -m -s /bin/bash -g Desarrollo programador1
sudo useradd -m -s /bin/bash -g Desarrollo programador2
sudo useradd -m -s /bin/bash -g Testing tester
sudo useradd -m -s /bin/bash -g Coordinador lider

echo "Muestro los grupos y usuarios creados"
sudo grep -E 'lid|prog|test' /etc/shadow /etc/passwd

echo "Creo estructura directorio: "
mkdir -p Programa1/{desarrollo,testing,produccion}

echo "Modifico owner y permisos"
sudo chown lider:Coordinador Programa1/produccion
sudo chown programador1:Desarrollo Programa1/desarrollo
sudo chown tester:Testing Programa1/testing

sudo chmod 
