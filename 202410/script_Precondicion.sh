#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
REPO_ALUMNO="UTNFRA_SO_1P2C_2024*"

PATH_REPO_ALUMNO=$(find $HOME -name $REPO_ALUMNO)

if [ -z $PATH_REPO_ALUMNO ]; then

    echo "Por Favor antes de ejecutar este script"
    echo "clone su repositorio dentro de $HOME/repogit/"
    exit 1
fi

mkdir -p ${PATH_REPO_ALUMNO}/{RTA_SCRIPT_Examen_${TIMESTAMP},RTA_ARCHIVOS_Examen_${TIMESTAMP}}
touch ${PATH_REPO_ALUMNO}/RTA_SCRIPT_Examen_${TIMESTAMP}/Punto_{A..G}.sh


# Habilita la opción para agregar nuevos comandos al final del historial de comandos.
shopt -s histappend

# Me aseguro que exista el archivo
touch ~/.bash_history


if [[ "$(lsattr "$HOME/.bash_history" | awk '{print $1}')" != *a* ]]; then
    chmod 600 ~/.bash_history
    sudo chattr +a ~/.bash_history
fi

if ! grep -cq "Configuración del historial de comandos"  ~/.bashrc ; then
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

