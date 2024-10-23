# UTN-FRA_SO_Examenes

## 1er Parcial Practico - 2do Cuatrimestre 2024  - Resolucion

### Modo de Uso:

- Para probar los script de resolucion, puede simular un repositorio
```sh
mkdir -p $HOME/repogit/UTNFRA_SO_1P2C_2024_Resolucion
``` 

- Copio la carpeta .git de cualquier repositorio dentro de la carpeta anterior.. asi en el Punto_F.sh tiene alguna URL para devolver...
```sh
cp -R $HOME/repogit/UTN-FRA_SO_Examenes/.git  $HOME/repogit/UTNFRA_SO_1P2C_2024_Resolucion/
```

- Ejecutar script de precondiciones, para que se genere la estructura de directorio dentro del path anterior:
```sh 
    cd $HOME/repogit
    ./UTN-FRA_SO_Examenes/202410/script_Precondicion.sh
    source ~/.bashrc  && history -a  
```
