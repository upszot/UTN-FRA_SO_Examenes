# Arquitectura de Sistemas Operativos

## Resolucion del 1er Parcial 20230518

- Grabacion
 - uso del comando script

```sh
script --timing=rec/vagrant_up/time_log_Punto0 rec/vagrant_up/rec_Parcial1_Punto0
script --timing=rec/PuntoA/time_log_PuntoA rec/PuntoA/rec_Parcial1_PuntoA
script --timing=rec/PuntoB/time_log_PuntoB rec/PuntoB/rec_Parcial1_PuntoB
script --timing=rec/PuntoC/time_log_PuntoC rec/PuntoC/rec_Parcial1_PuntoC
script --timing=rec/PuntoD/time_log_PuntoD rec/PuntoD/rec_Parcial1_PuntoD
script --timing=rec/PuntoE/time_log_PuntoE rec/PuntoE/rec_Parcial1_PuntoE
script --timing=rec/PuntoF/time_log_PuntoF rec/PuntoF/rec_Parcial1_PuntoF
script --timing=rec/PuntoG/time_log_PuntoG rec/PuntoG/rec_Parcial1_PuntoG
```

- Reproduccion
```sh

scriptreplay --timing=rec/vagrant_up/time_log_Punto0 rec/vagrant_up/rec_Parcial1_Punto0
scriptreplay --timing=rec/PuntoA/time_log_PuntoA rec/PuntoA/rec_Parcial1_PuntoA
scriptreplay --timing=rec/PuntoB/time_log_PuntoB rec/PuntoB/rec_Parcial1_PuntoB
scriptreplay --timing=rec/PuntoC/time_log_PuntoC rec/PuntoC/rec_Parcial1_PuntoC
scriptreplay --timing=rec/PuntoD/time_log_PuntoD rec/PuntoD/rec_Parcial1_PuntoD
scriptreplay --timing=rec/PuntoE/time_log_PuntoE rec/PuntoE/rec_Parcial1_PuntoE
scriptreplay --timing=rec/PuntoF/time_log_PuntoF rec/PuntoF/rec_Parcial1_PuntoF
scriptreplay --timing=rec/PuntoG/time_log_PuntoG rec/PuntoG/rec_Parcial1_PuntoG

```

