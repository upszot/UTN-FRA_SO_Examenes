#!/bin/bash
./UTN-FRA_SO_Examenes/202310/resolucion/punto2_consigna.sh
echo 
echo "--- RESOLUCION PUNTO 2 ---"
echo
echo
read -p "Ingrese se nombre del dispositivo de bloque de 5G (Ejemplo /dev/sdc): " DISCO 

echo "ingreso $DISCO"
echo "Presiona Enter para continuar..."
read

echo "Particionamiento 2G tipo LVM(8e)"
sudo fdisk $DISCO << EOF
n
p
3

+2G
t
3
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
4
8e
w
EOF

echo
sudo fdisk -l $DISCO
echo
echo "Creo los pv, vg y lv"
sudo pvcreate ${DISCO}3 ${DISCO}4
sudo vgcreate vg_docker ${DISCO}3
sudo vgcreate vg_datos ${DISCO}4
sudo lvcreate -l +100%FREE vg_docker -n lv_docker
sudo lvcreate -L +1G vg_datos -n lv_multimedia
sudo lvcreate -l +100%FREE vg_datos -n lv_repo
echo
echo "Muestro como quedaron los pv, vg y lv"
sudo pvs; sudo vgs; sudo lvs
echo 
echo "Creo los puntos de montaje"
sudo mkdir -p /var/lib/docker/ /datos/{multimedia,repogit}
echo 
echo "Agrego los montajes persistentes en /etc/fstab con separados de campos tab excepto el ultimo que son espacios"
echo -e "/dev/mapper/vg_datos-lv_multimedia\t/datos/multimedia\text4\tdefaults\t0 0" | sudo tee -a /etc/fstab
echo -e "/dev/mapper/vg_datos-lv_repo\t/datos/repogit\text4\tdefaults\t0 0" | sudo tee -a /etc/fstab
echo -e "/dev/mapper/vg_docker-lv_docker\t/var/lib/docker\text4\tdefaults\t0 0" | sudo tee -a /etc/fstab
sudo systemctl daemon-reload
sudo mount -a


