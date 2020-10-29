#!/bin/bash
clear
while true
do
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
echo "   **************************************************************************"
echo "                Script para actualizar listados YSF y FCS  \33[1;31m by EA3EIZ\33[1;32m   "
echo "   **************************************************************************"
echo ""
echo "\33[1;36m   1)\33[1;37m Actualiza YSFHosts.txt y FCSRooms.txt (listado de reflectores)"
#echo "\33[1;36m   2)\33[1;37m Ver el listado de reflectores YSF"
echo ""
echo "   ${ROJO}0) Salir "
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
						clear
						read -p ' Quieres actualizar el listado de reflectores S/N ?' ejecutar1
		    			case $ejecutar1 in
			            [sS]* ) echo ""
						clear
						echo "*******************************************"
						echo "* ACTUALIZANDO LISTADO DE SALAS YSF y FCS *"
						echo "* *****************************************"
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
						sleep 3
		                break;;
						[nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
2bloqueado) echo ""
while true
do
clear
	        			read -p ' Quieres ver el listado de reflectores YSF S/N ?' ejecutar1
		    			case $ejecutar1 in
						[sS]* ) echo ""
						echo "ok >>>>>"
						cd $usuario/YSFClients/YSFGateway
						geany YSFHosts.txt
						echo "Ok"
						break;;
						[nN]* ) echo ""
						break;;
esac
done;;

0) echo ""
clear
echo "\33[1;33m   ******************************"
echo "   *                            *"
echo "   *     CERRANDO SCRIPT        *"
echo "   *                            *"
echo "   ******************************"
sleep 1
clear
exit;;	
esac
done
