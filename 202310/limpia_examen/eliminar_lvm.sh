#!/bin/bash

# Verificar si se han proporcionado al menos un argumento
if [ $# -lt 1 ]; then
    echo "Uso: $0 [nombre_disco1] [nombre_disco2] ..."
    exit 1
fi

# Recorrer los argumentos que son nombres de discos
for disco in "$@"; do
    # Eliminar LV asociados al disco
    lvremove -v -f $(lvdisplay | awk -v disk="$disco" '/LV Name/{n=$3} /VG Name/{v=$3} /PV Name/{p=$3; if(p~disk){print v"/"n}}')

    # Eliminar VG asociados al disco
    vgremove -v $(vgdisplay | awk -v disk="$disco" '/VG Name/{n=$3} /PV Name/{p=$3; if(p~disk){print n}}')

    # Eliminar PV asociados al disco
    pvremove -v -ff "$disco"
done

