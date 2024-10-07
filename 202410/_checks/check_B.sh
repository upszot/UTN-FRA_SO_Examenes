#!/bin/bash
CANTIDAD_DE_MONTAJES=10

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
MAPEO_FILE="$SCRIPT_DIR/.soporte/Punto_A_Mapeo.e"
PARCIAL="UTNFRA_SO_1P2C_2024"
gpg --batch --yes --passphrase "$PARCIAL" --output ${MAPEO_FILE}.txt -d $MAPEO_FILE > /dev/null 2>&1
PATH_PRINCIPAL="$(head -n1 ${MAPEO_FILE}.txt)"


DISCO=$(sudo fdisk -l |grep "10 G" | awk '{print $2}' | awk -F ':' '{ print $1}')

RTA_DF=$(sudo df -h |grep -i $PATH_PRINCIPAL | awk '{print $6}' | sort)
RTA_FSTAB=$(sudo grep $PATH_PRINCIPAL /etc/fstab | grep -v "^#" | awk '{print $2}' | sort)

C_RTA_DF=$(echo "$RTA_DF" | wc -l )
C_RTA_FSTAB=$(echo "$RTA_FSTAB" | wc -l )
C_RTA_FDISK_DISCO=$(sudo fdisk -l $DISCO |grep Linux | wc -l )

# Verificar que la cantidad de montajes actuales coincida con la cantidad en /etc/fstab
if [ "$C_RTA_DF" -ne "$C_RTA_FSTAB" ]; then
	echo "Punto B - Error Code: 1 - Mensaje: Diferencias entre fstab y lo montado"
	echo
    	echo "Archivo /etc/fstab: "
	echo "$RTA_FSTAB"
	echo
	echo "Montado Actualmente: "
	echo "$RTA_DF"
	echo
	echo "Diferencias:"
	comm -3 <(echo "$RTA_FSTAB") <(echo "$RTA_DF")
	exit 1
fi
# Verificar que la cantidad de Particiones sea igual a CANTIDAD_DE_MONTAJES
if [ "$C_RTA_FDISK_DISCO" -ne "$CANTIDAD_DE_MONTAJES" ]; then
    echo "Punto B - Error Code: 2 - Mensaje: La cantidad de Particiones en $DISCO ($C_RTA_FDISK_DISCO) no coincide con la cantidad esperada ($CANTIDAD_DE_MONTAJES)"
    exit 2
fi

# Verificar que la cantidad de montajes en /etc/fstab sea igual a CANTIDAD_DE_MONTAJES
if [ "$C_RTA_FSTAB" -ne "$CANTIDAD_DE_MONTAJES" ]; then
    echo "Punto B - Error Code: 3 - Mensaje: La cantidad de montajes en /etc/fstab ($C_RTA_FSTAB) no coincide con la cantidad esperada ($CANTIDAD_DE_MONTAJES)"
    exit 3
fi

echo "Punto B - OK"
echo
echo "Valide Tamaños de Particiones"
echo
echo "<Device>  Tamaño  Tipo"  | column -t
sudo fdisk -l $DISCO | grep Linux | awk '{print $1"\t"$5"\t"$7}' | column -t
echo


rm -rf ${MAPEO_FILE}.txt

