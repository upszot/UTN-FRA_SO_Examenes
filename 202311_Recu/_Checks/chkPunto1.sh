#!/bin/bash
#chkPunto1.sh
reset
echo "Se espera ver: "
echo "vg_ssd  -> lv_imgdocker (20M+Expand) / lv_work lv_swap"
echo "vg_ssd  -> lv_work (3G)"
echo "vg_ssd  -> lv_swap (3G)"
echo
sudo vgs 
sudo lvs
echo
df -h /Rwork  /var/lib/docker
echo
shawpon -s 
free -h
