#!/bin/bash
#chkPunto1.sh
reset
echo "Se espera ver:  Discos 8G y 7G"
echo "vg_ssd  -> lv_imgdocker (30M+Expand) / lv_work lv_swap"
echo "vg_ssd  -> lv_work (1G)"
echo "vg_ssd  -> lv_swap (256M)"
echo "vg_hd   -> lv_swap2 (512M)"
echo
sudo vgs 
sudo lvs
echo
df -h /work_20231211  /var/lib/docker
echo
shawpon -s 
free -h
