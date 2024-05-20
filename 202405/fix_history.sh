# Habilita la opción para agregar nuevos comandos al final del historial de comandos.
shopt -s histappend
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
source ~/.bashrc
