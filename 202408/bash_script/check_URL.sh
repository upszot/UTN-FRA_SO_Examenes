#!/bin/bash
clear

LOG_FILE="/var/log/status_url.log"

ANT_IFS=$IFS
IFS=$'\n'

#---- Dentro del bucle ----#
  # Obtener el código de estado HTTP
  STATUS_CODE=$(curl -LI -o /dev/null -w '%{http_code}\n' -s "$URL")

  # Fecha y hora actual en formato yyyymmdd_hhmmss
  TIMESTAMP=$(date +"%Y%m%d_%H%M%S")


 # Registrar en el archivo /var/log/status_url.log
  echo "$TIMESTAMP - Code:$STATUS_CODE - URL:$URL" |sudo tee -a  "$LOG_FILE"



#-------------------------#

IFS=$ANT_IFS
