#!/bin/bash
./UTN-FRA_SO_Examenes/202310/resolucion/punto3_consigna.sh
echo 
echo "--- RESOLUCION PUNTO 3 ---"
echo
echo
read -p "Ingrese se nombre del dispositivo de bloque de 8G (Ejemplo /dev/sdd): " DISCO 

echo "ingreso $DISCO"
echo
sudo fdisk -l $DISCO
echo "Presiona Enter para continuar..."
read

echo "los lv_multimedia ,lv_repo y lv_swap consumen del vg_datos.. por lo tanto tengo una particion para esto"
echo "Particionamiento 5G tipo LVM(8e)"
sudo fdisk $DISCO << EOF
n
p
1

+5G
t
8e
w
EOF

echo
sudo fdisk -l $DISCO
echo

echo "Presiona Enter para continuar..."
read
echo "Particionamiento del resto del disco tipo LVM(8e) "
sudo fdisk $DISCO << EOF
n
p




t
2
8e
w
EOF

echo
sudo fdisk -l $DISCO
echo "Presiona Enter para continuar..."
read
echo

echo "Muestro estado actual de los lv y fs"
sudo lvs
df -h /var/lib/docker /datos/multimedia /datos/repogit
echo
echo "Creo los pv"
sudo pvcreate ${DISCO}1 ${DISCO}2
echo "Expando los vg"
sudo vgextend vg_datos ${DISCO}1
sudo vgextend vg_docker ${DISCO}2
echo "expando los lv"
sudo lvextend -L +2G /dev/mapper/vg_datos-lv_multimedia
sudo lvextend -L +2G /dev/mapper/vg_datos-lv_repo
sudo lvextend -l +100%FREE /dev/mapper/vg_docker-lv_docker
echo
echo "Muestro los tamaños de los lv antes de expandir el fs para evitar problemas si meti mal los dedos"
sudo vgs; sudo lvs

echo
echo "Presiona Enter para continuar..."
read
echo

echo "Expando los fs"
sudo resize2fs /dev/mapper/vg_datos-lv_multimedia
sudo resize2fs /dev/mapper/vg_datos-lv_repo
sudo resize2fs /dev/mapper/vg_docker-lv_docker
echo
echo "Valido que los lv y los fs esten de los tamaños correctos"
sudo lvs
df -h /var/lib/docker /datos/multimedia /datos/repogit

echo
echo "Presiona Enter para continuar..."
read
echo

echo "Creo el lv_swap para despues formatearlo como swap y habilitarla"
sudo vgs
echo "Como no me queda exactamente 1024M voy a usar +100%FREE para crear el lv"
echo
sudo lvcreate -l +100%FREE vg_datos -n lv_swap
sudo mkswap /dev/mapper/vg_datos-lv_swap
echo 
echo "Muestro estado actual de memoria swap"
free -h ; sudo swapon -s
echo 
echo "Habilito la nueva memoria swap"
sudo swapon /dev/mapper/vg_datos-lv_swap
echo
echo "Muestro estado como quedo la swap"
free -h ; sudo swapon -s

