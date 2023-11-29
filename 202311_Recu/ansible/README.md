# Ansible - playbook_2doParcial

	- playbook de ansible que llama al rol multipruebas..
     El mismo se limpio para facilitar la lectura
     dejando solamente una task para la realizacion del examen


## Ejecucion (Parado en la carpeta "202311_Recu/ansible/"):
```sh
reset; ansible-playbook -i inventory/hosts playbook.yml
```
### Contenido:
	- playbook.yml  -> receta 
	- ansible.cfg -> configuracion local de ansible
	- inventory
		- hosts -> inventario propiamente dicho en formato INI
		- host_vars  -> variables espesificas a un host
		- group_vars -> variables espesificas para grupos de host
	- roles
		- multi_Pruebas
			- tasks
				- prueba_202311_Recu2doParcial.yml  -> Archivo a editar con las tareas del parcial
			- templates
				- template_01.j2  -> Template de jinja2 a editar
	

### Comportamiento:
	- El playbook llama al rol: multi_Pruebas y se ejecuta contra el listado de host definido
	tomando los valores de las variables de los distintos archivos 
    - Cuando pida que ingrese el Nro de prueba Simplemente puede dar enter para tomar el valor por defecto.
 
	


### Cuando pida Nro de prueba introducir:
```sh
202311_Recu2doParcial.yml
```
