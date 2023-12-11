# Arquitectura de Sistemas Operativos
## Resolucion 1er Parcial


## PuntoA
```sh
#Compruebo nombre del dispositivo de bloque Ingresado
dmesg |grep -i attac

#Valido que efectivamente sea el disco que agrege
sudo fdisk -l /dev/sdc

#Particiono el disco y compruebo las particiones
sudo fdisk /dev/sdc
sudo fdisk -l /dev/sdc

#------ Formateo las particiones... ------
#Metodo Disney (La sdc4 es la extendida.. no se formatea) ->    
#sudo mkfs.ext4 /dev/sdc1
#sudo mkfs.ext4 /dev/sdc2
#sudo mkfs.ext4 /dev/sdc3
#sudo mkfs.ext4 /dev/sdc5
#sudo mkfs.ext4 /dev/sdc6
#sudo mkfs.ext4 /dev/sdc7

#Metodo Pro version 1 ->    
#sudo fdisk -l /dev/sdc  |grep sdc |egrep -v 'Disk|sdc4' |awk '{print "sudo mkfs.ext4 "$1}'  |/bin/bash

#Metodo Pro version 2 ->
sudo fdisk -l /dev/sdc  |grep sdc |egrep -v 'Disk|sdc4' |awk '{print $1}'  |xargs -I PARTICION sudo mkfs.ext4 PARTICION

#Creo puntos de montaje
sudo mkdir -p /mnt/PuntoA/part0{1..6}

#Montamos las perticiones nivel Pro..
for NRO in {1..6}
do
  if [[ "$NRO" < 4 ]]
  then
    sudo mount /dev/sdc$NRO /mnt/PuntoA/part0$NRO
  else
    sudo mount /dev/sdc$(bc <<<$NRO+1) /mnt/PuntoA/part0$NRO
  fi
done

df -h /mnt/PuntoA/part0?
lsblk -f /dev/sdc
```

 ## PuntoB
```sh
sudo useradd -m -s /bin/bash -c "usuario 1" -G parc1_grupo1 parc1_user1
sudo useradd -m -s /bin/bash -c "usuario 2" -G parc1_grupo2 parc1_user2
sudo useradd -m -s /bin/bash -c "usuario 1" parc1_user3
sudo mkdir -p /PuntoB/{Grupo{1,2},otro}
sudo chmod 770 /PuntoB/Grupo1
sudo chmod 765 /PuntoB/Grupo2
sudo chmod 754 /PuntoB/otro
sudo chown parc1_user1:parc1_grupo1 /PuntoB/Grupo1
sudo chown parc1_user2:parc1_grupo2 /PuntoB/Grupo2
sudo chown parc1_user3:parc1_user3 /PuntoB/otro
```

 ## PuntoC
 ```sh
 #(Version Disney) -> Redireccionar salida de whoami del usuario a un archivo
 #sudo su
 #su parc1_user3 
 #whoami > /PuntoB/otro/validar.txt
 #logout

# Ahora lo mismo pero en verison Pro
sudo su -c "whoami > /PuntoB/otro/validar.txt" parc1_user3
 
#--- Creamos el grupo "parc1_grupo_todos"
  #El comando groupadd se instala con el paquete "shadow-utils"
  #Para version del paquete  (shadow-utils 4.11.1)
  #Me permite crear el grupo y añadir usuarios todo en el mismo comando
#sudo groupadd -U parc1_user1,parc1_user2,parc1_user3 parc1_grupo_todos

#(shadow-utils 4.8.1) como en la vm que levante de vagrant 
sudo groupadd  parc1_grupo_todos

#sudo usermod -a -G parc1_grupo_todos parc1_user1
#sudo usermod -a -G parc1_grupo_todos parc1_user2
#sudo usermod -a -G parc1_grupo_todos parc1_user3
for NRO in {1..3}; do sudo usermod -a -G parc1_grupo_todos parc1_user$NRO ;done

#Valido el grupo
grep parc1_grupo_todos /etc/group
#
#Modificar el grupo propietario de la carpeta otros y todo su contenido para
#que sea del grupo “parc1_grupo_todos”
sudo chown -R parc1_user3:parc1_grupo_todos /PuntoB/otro

#Asignar permisos de escritura al grupo en la carpeta otros y todo su contenido
#sudo chmod -R g+w /PuntoB/otro/
sudo chmod -R 774 /PuntoB/otro
sudo ls -l /PuntoB/otro

#Realizar las modificaciones necesarias para que el usuario “parc1_user3”
#pueda conocer la existencia de un archivo en el directorio Grupo2, pero no
#pueda ver su contenido.
sudo su -c "ls -l /PuntoB/Grupo2/" parc1_user3
sudo su -c "cat /PuntoB/Grupo2/existe.txt" parc1_user3
sudo chmod 774 /PuntoB/Grupo2/

#Validar
sudo su -c "whoami >> /PuntoB/otro/validar.txt" parc1_user1
sudo su -c "whoami >> /PuntoB/otro/validar.txt" parc1_user2
sudo cat /PuntoB/otro/validar.txt

sudo su -c "whoami > /PuntoB/Grupo2/existe.txt" parc1_user2

sudo su -c "ls -l /PuntoB/Grupo2/" parc1_user3
sudo su -c "cat /PuntoB/Grupo2/existe.txt" parc1_user3
```

 ## PuntoD
 ```sh
#Siempre que sea con los metodos enseñados esta bien
mkdir -p Ejercicio_D/{libros,musica,peliculas}/autores{1..5}
```

 ## PuntoE
 ```sh
mkdir -p Ejercicio_E/{correo/cartero{1..10},{emisor,receptor}/{carta,cheque}}
mkdir -p Ejercicio_E_bis/{{emisor,receptor}/{cartas,cheque},correo/carteros{1..10}} 
```
 ## PuntoF
 ```sh
#Memoria Disponible.
grep MemAvailable /proc/meminfo >> memoria.txt
free -h |awk '{print $7}' >> memoria.txt

lsblk -f |awk '{print $1 " \t\t\t" $2"\t"$5}' >> montajes.txt
lsblk -o NAME,FSTYPE,UUID >> montajes.txt

grep -i processor /proc/cpuinfo |tail -n1 |awk -F ':'  '{print $2+1}' >> cpu.txt
nproc >> cpu.txt
```

 ## PuntoG
```sh
#Archivo info_usuario.txt
grep $(whoami) /etc/passwd |awk -F ':' '{print "Usuario="$1 }' > RTA_examen/PuntoG/info_usuario.txt
grep $(whoami) /etc/passwd |awk -F ':' '{print "shell="$7 }' >> RTA_examen/PuntoG/info_usuario.txt
sudo grep $(whoami) /etc/shadow |awk -F ':' '{print "Clave="$2}' >> RTA_examen/PuntoG/info_usuario.txt

#Guardar history de un usuario...
history > RTA_examen/PuntoG/historial_$(date +"%Y%m%d_%H%M").txt
```


