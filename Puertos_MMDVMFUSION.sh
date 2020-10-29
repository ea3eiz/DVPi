#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

# path Versión
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

# #Editor MMDVMBM.ini
# DIRECTORIO="MMDVMBM.ini"

# #Editor MMDVMPLUS.ini
# DIRECTORIO="MMDVMPLUS.ini"

# #Editor MMDVM.ini
# DIRECTORIO="MMDVM.ini"

# #Editor MMDVMPLUS.ini
# DIRECTORIO="MMDVMPLUS.ini"

# #Editor MMDVMESPECIAL.ini
# DIRECTORIO="MMDVMESPECIAL.ini"

#Editor MMDVMFUSION.ini
DIRECTORIO="MMDVMFUSION.ini"

# #Editor MMDVMDMR2YSF.ini
# DIRECTORIO="MMDVMDMR2YSF.ini"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

# cuando hice este editor la linea es la 46
mode=`grep -n -m 1 "^Port=" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
letra=c
numero_linea_port=$numero_linea_port$letra

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
                            sed -i "$numero_linea_port Port=/dev/ttyACM0" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyACM1" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyACM2" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyACM3" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyAMA0" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyAMA1" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyAMA2" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyAMA3" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyUSB0" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyUSB1" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyUSB2" $usuario/MMDVMHost/$DIRECTORIO
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
                            sed -i "$numero_linea_port Port=/dev/ttyUSB3" $usuario/MMDVMHost/$DIRECTORIO
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

