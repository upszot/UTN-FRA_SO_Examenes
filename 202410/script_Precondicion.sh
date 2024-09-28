#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

REPO_ALUMNO=$(find $HOME -name UTNFRA_SO_1P2C_2024*)

if [ -z $REPO_ALUMNO ]; then

    echo "Por Favor antes de ejecutar este script"
    echo "clone su repositorio dentro de $HOME/repogit/"
    exit 1
fi

mkdir ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_A.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_B.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_C.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_D.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_E.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_F.sh
touch ${REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_G.sh
mkdir ${REPO_ALUMNO}/RTA_ARCHIVOS_Examen_${TIMESTAMP}


# Habilita la opción para agregar nuevos comandos al final del historial de comandos.
shopt -s histappend

touch ~/.bash_history
chmod 600 ~/.bash_history


if [[ "$(lsattr "$HOME/.bash_history" | awk '{print $1}')" != *a* ]]; then
  sudo chattr +a ~/.bash_history
fi

if [ grep -c "Configuración del historial de comandos" != 0]; then
    # Agrega configuración al final del archivo .bashrc
    cat << EOF >> ~/.bashrc

    ###########################################################
    #     Configuración del historial de comandos 
    #---------------------------------------------------------#
    # Establece el tamaño máximo del historial en 10000 comandos.
    export HISTSIZE=10000
    # No hay límite en el tamaño del archivo de historial.
    export HISTFILESIZE=-1
    # Actualiza y sincroniza el historial de comandos entre sesiones.
    export PROMPT_COMMAND="history -a; history -c; history -r; \$PROMPT_COMMAND"
    ###########################################################

EOF
fi

# Recarga el archivo .bashrc para aplicar los cambios.
. ~/.bashrc

history -a
echo 
echo "Por favor ejecute: source  ~/.bashrc  && history -a "
echo 

