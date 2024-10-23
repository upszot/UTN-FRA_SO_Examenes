#!/bin/bash

# Para que me quede mas corto.. creo variable con todo el path del archivo
ARCHIVO_FILTRO_BASICO="$HOME/repogit/UTNFRA_SO_1P2C_2024_ferrer/$(ls |grep -i archivos_examen)/Filtro_Basico.txt"

echo "Se generara el archivo: $ARCHIVO_FILTRO_BASICO"
echo
grep -i memtotal /proc/meminfo |tee  $ARCHIVO_FILTRO_BASICO
sudo dmidecode -t chassis |grep -iE 'chassis|manufacture'  | tee -a $ARCHIVO_FILTRO_BASICO


# Tambien podria haber sido asi.. con redireccionamiento.
grep -i memtotal /proc/meminfo >  $ARCHIVO_FILTRO_BASICO
sudo dmidecode -t chassis |grep -iE 'chassis|manufacture' >> $ARCHIVO_FILTRO_BASICO

