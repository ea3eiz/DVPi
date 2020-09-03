#!/bin/bash
clear
while true
do
clear
# path usuario 
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

# path Versión
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

#Editor MMDVMPLUS.ini
DIRECTORIO="MMDVMPLUS.ini"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   ***************************************************************************************"
echo -n "${CIAN}"
echo "                               Script para Elegir Puerto                                  "
echo -n "${ROJO}"
echo "                                       $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ***************************************************************************************"

echo  "${CIAN}   1)${BLANCO} Elegir Puerto ACM0"
echo  "${CIAN}   2)${BLANCO} Elegir Puerto ACM1"
echo  "${CIAN}   3)${BLANCO} Elegir Puerto ACM2"
echo  "${CIAN}   4)${BLANCO} Elegir Puerto ACM3"
echo ""
echo  "${CIAN}   5)${VERDE} Elegir Puerto AMA0"
echo  "${CIAN}   6)${VERDE} Elegir Puerto AMA1"
echo  "${CIAN}   7)${VERDE} Elegir Puerto AMA2"
echo  "${CIAN}   8)${VERDE} Elegir Puerto AMA3"
echo ""
echo  "${CIAN}   9)${AMARILLO} Elegir Puerto USB0"
echo  "${CIAN}  10)${AMARILLO} Elegir Puerto USB1"
echo  "${CIAN}  11)${AMARILLO} Elegir Puerto USB2"
echo  "${CIAN}  12)${AMARILLO} Elegir Puerto USB3"
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

