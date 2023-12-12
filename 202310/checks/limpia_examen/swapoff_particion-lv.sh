#!/bin/bash

# Obtener la lista de particiones de swap activas
swap_active=$(swapon -s | tail -n +2 | awk '{print $1}' | xargs)

# Obtener información de las particiones de bloque, incluyendo swap
partitions_info=$(lsblk -f | grep -E 'part|lv' | awk '{print $1, $2, $4}')

# Recorrer la información de las particiones
while read -r partition type mountpoint; do
    # Verificar si es una partición de swap activa
    if [[ "$swap_active" == *"$partition"* ]]; then
        echo "Desactivando swap para: $partition"
        swapoff "$partition"
    fi
done <<< "$partitions_info"

