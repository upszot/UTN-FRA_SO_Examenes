#!/bin/bash

# Para que funcione el comando de git
# Me aseguro de estar dentro del repositorio
cd $HOME/repogit/UTNFRA_SO_1P2C_2024_ferrer/

# Para que me quede mas corto.. creo variable con todo el path del archivo
ARCHIVO_FILTRO_AVANZADO="$HOME/repogit/UTNFRA_SO_1P2C_2024_ferrer/$(ls |grep -i archivos_examen)/Filtro_Avanzado.txt"

echo "Se generara el archivo: $ARCHIVO_FILTRO_AVANZADO"
echo

# Cargo el contenido del archivo todo de una vez usando tecnica de Herr-doc 
# y lo muestro
# Puedo generar Distintas variables para mejorar la lectura...

MiIP=$(curl -s ifconfig.me)
HASH=$(sudo grep $USER /etc/shadow | awk -F ':' '{ print $2}')

cat << EOF >  $ARCHIVO_FILTRO_AVANZADO
Mi IP Publica es: $MiIP  
Mi usuario es: $(whoami)
El Hash de mi usuario es: $HASH
La URL de mi repositorio es: $(git remote get-url origin)
EOF
