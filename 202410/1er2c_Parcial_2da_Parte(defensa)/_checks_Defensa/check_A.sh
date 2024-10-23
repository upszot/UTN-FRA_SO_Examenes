#!/bin/bash
DISCO=$(sudo fdisk -l |grep "2 G" | awk '{print $2}' | awk -F ':' '{ print $1}')

CANTIDAD_DE_MONTAJES=1
CANTIDAD_DE_SWAP=1
COD_ERR=0


C_RTA_SWAP=$(sudo swapon -s  |grep $DISCO -c)
C_RTA_DF=$(sudo df -h |grep /P_Defensa  -c)

# Verifico swap
if [ $CANTIDAD_DE_SWAP -ne $C_RTA_SWAP ]; then
    let COD_ERR=COD_ERR + 1
    SMS_ERROR=" No está configurada la swap \n"
fi

# Verifico Montaje
if [ $CANTIDAD_DE_MONTAJES -ne $C_RTA_DF ]; then
    let COD_ERR=COD_ERR + 10
    SMS_ERROR=" No está montado /P_Defensa"
fi

# Resultado final
if [ $COD_ERR -ne 0 ]; then
    echo -e "Punto A - Error - Cod: $COD_ERR - $SMS_ERROR"
    exit $COD_ERR
fi

E_NRO=$(grep "CODIGO:"  $HOME/Defensa/Ejercicios.txt | awk -F ':' '{print $2}')
echo "OK - Punto A"
echo
echo "Valide Tamaños y Tipos de Particiones ($E_NRO)"
echo
echo "<Device>  Tamaño  Tipo"  | column -t
sudo fdisk -l $DISCO | grep Linux | awk '{print $1"\t"$5"\t"$7" "$8}' | column -t
echo
