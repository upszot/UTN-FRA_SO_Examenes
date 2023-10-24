# UTN-FRA_SO_Examenes

## Contenido 
- Carpeta: 202310
    - pdf del examen
    - script re resolucion
    - vm -> vagrantfile con los discos y ya clonacion del repo

## Uso:

- Clonar el repo:
```sh
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
``` 

- Levantar la vm de vagrant
```sh
# Desde una terminal de PowerShell parado en:  UTN-FRA_SO_Examenes/202310/vm/    Ejecutar:
vagrant up
vagrant ssh
``` 

- Antes que nada validar nombres de los discos de 5G y 8G
```sh
sudo fdisk -l |less
```

- Para realizar el examen, estando parado en el home de vagrant ejecuto:
```sh
./UTN-FRA_SO_Examenes/202310/resolucion/punto1.sh
./UTN-FRA_SO_Examenes/202310/resolucion/punto2.sh
./UTN-FRA_SO_Examenes/202310/resolucion/punto3.sh
./UTN-FRA_SO_Examenes/202310/resolucion/punto4.sh
./UTN-FRA_SO_Examenes/202310/resolucion/punto5.sh


```

## Notas:
- Para cortar la ejecucion de los script [Ctrl+c]
- Tener en cuenta que si corto la ejecucion van a tener que editar los script para que continue desde donde lo cortaron.. para ello pueden hacer una copia del script, editarla y ejecutar la misma.
o hacer un vagrant destroy -f  y levantar el entorno de nuevo...

