#!/bin/bash
#chkPunto1.sh
reset
echo "Se espera ver: "
echo "vg_ssd  -> lv_imgdocker (30M+Expand) / lv_work lv_swap"
echo "vg_ssd  -> lv_work (512M)"
echo "vg_ssd  -> lv_swap (1G)"
echo "vg_hd   -> lv_swap2 (2G)"
echo
sudo vgs 
sudo lvs
echo
df -h /work_20231204  /var/lib/docker
echo
shawpon -s 
free -h
