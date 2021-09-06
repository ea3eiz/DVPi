#!/bin/bash
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

#Colores 
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
echo "${VERDE}"

						clear

						echo "\v\v\v\v\v"
						echo "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						echo "${VERDE}"
						echo "                      ACTUALIZANDO LISTADO DE SALAS YSF y FCS                "
						echo "                                                                             "
						echo -n "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						sleep 3
			            echo "${VERDE}"						
						cd $usuario/YSFClients/YSFGateway
						sudo chmod 777 -R $usuario/YSFClients/YSFGateway
						sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php					
						wget -O FCSRooms.txt https://raw.githubusercontent.com/g4klx/YSFClients/master/YSFGateway/FCSRooms.txt 
						sleep 3
						clear
						echo "\v\v\v\v\v"
						echo "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						echo "${VERDE}"
						echo "             Los fichero YSFHost.txt y FCSRooms.txt se han actualizado       "
						echo "                                                                             "
						echo -n "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						sleep 5
		                