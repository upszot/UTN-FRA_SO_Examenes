#!/bin/bash

# Verificar que se pasaron argumentos
if [ $# -eq 0 ]; then
    echo "Uso: $0 disco1 disco2 disco3 ..."
    exit 1
fi

# Recorremos todos los discos pasados como argumentos
for disco in "$@"; do
    # Verificamos que el disco existe
    if [ -b "$disco" ]; then
        # Eliminamos las particiones en el disco usando fdisk
        echo "Eliminando todas las particiones en $disco"
        echo -e "d\n" | fdisk "$disco"
    else
        echo "El disco $disco no existe o no es un dispositivo de bloque válido."
    fi
done

