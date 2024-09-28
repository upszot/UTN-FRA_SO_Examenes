#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)

REPO_ALUMNO=$(find $HOME -name UTNFRA_SO_1P2C_2024*)

mkdir ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_A.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_B.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_C.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_D.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_E.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_F.sh
touch ${REPO_ALUMNO}/RTA_Examen_${TIMESTAMP}/Punto_G.sh


# Habilita la opción para agregar nuevos comandos al final del historial de comandos.
shopt -s histappend

touch ~/.bash_history
chmod 600 ~/.bash_history
sudo chattr +a ~/.bash_history

# Agrega configuración al final del archivo .bashrc
cat << EOF >> ~/.bashrc
###########################################################
# Configuración del historial de comandos #
###########################################################
# Establece el tamaño máximo del historial en 10000 comandos.
export HISTSIZE=10000
# No hay límite en el tamaño del archivo de historial.
export HISTFILESIZE=-1
# Actualiza y sincroniza el historial de comandos entre sesiones.
export PROMPT_COMMAND="history -a; history -c; history -r; \$PROMPT_COMMAND"
EOF
# Recarga el archivo .bashrc para aplicar los cambios.
. ~/.bashrc

history -a
echo 
echo "Por favor ejecute: source  ~/.bashrc  && history -a "
echo 

