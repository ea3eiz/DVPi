#!/bin/bash
clear
while true
do
clear
# path usuario 
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

# path Versión
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

# #Editor MMDVMPLUS.ini
# DIRECTORIO="MMDVMPLUS.ini"

#Editor MMDVMBM.ini
DIRECTORIO="MMDVMBM.ini"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   ************************************************************"
echo -n "${CIAN}"
echo "                  Script para Elegir Puerto Nextion           "
echo -n "${ROJO}"
echo " $SCRIPTS_version                                by EA3EIZ"
echo -n "${VERDE}"
echo "   ************************************************************"

echo  "${CIAN}   1)${BLANCO} Puerto para Nextion conectada al GPIO de la Raspberry pi"
echo  "${CIAN}   2)${BLANCO} Puerto para Nextion conectada al Hotspot"
echo  "${CIAN}   3)${BLANCO} Puerto para Nextion conectada por Bluetooth (rfcomm0)"
echo  "${CIAN}   4)${BLANCO} Puerto para Nextion conectada por Bluetooth (rfcomm1)"
echo  "${CIAN}   5)${BLANCO} Puerto para Nextion conectada por USB (USB0)"
echo  "${CIAN}   6)${BLANCO} Puerto para Nextion conectada por USB (USB1)"
echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "${CIAN}   Elige una opción: " 
read escoger_menu

case $escoger_menu in
1) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyACM0
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
2) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyACM1
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
3) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyACM2
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
4) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyACM3
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
5) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyAMA0
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
6) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyAMA1
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
7) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyAMA2
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
8) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyAMA3
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
9) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyUSB0
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
10) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyUSB1
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
11) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyUSB2
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
12) echo ""
while true
do
                            actualizar=S 
                            case $actualizar in
			                [sS]* ) echo ""
                            sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyUSB3
                            exit
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
0) echo ""
exit;;	
esac
done

