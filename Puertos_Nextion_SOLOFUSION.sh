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

# #Editor MMDVMESPECIAL.ini
# DIRECTORIO="MMDVMESPECIAL.ini"

#Editor MMDVMFUSION.ini
DIRECTORIO="MMDVMFUSION.ini"

# #Editor MMDVMDSTAR.ini
# DIRECTORIO="MMDVMDSTAR.ini"

# #Editor MMDVMDMR2YSF.ini
# DIRECTORIO="MMDVMDMR2YSF.ini"

# #Editor MMDVMDMR2NXDN.ini
# DIRECTORIO="MMDVMDMR2NXDN.ini"

# #Editor NXDN.ini
# DIRECTORIO="NXDN.ini"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"


# h Puerto Nextion
var=`grep -n -m 1 "\[Nextion\]" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
numero_linea=`expr $numero_linea + 2`
MODEMNEXTION=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
letra=c
linea_sed_MN=$numero_linea$letra

echo "${VERDE}"
echo "   ************************************************************"
echo -n "${CIAN}"
echo "                  Script para Elegir Puerto Nextion           "
echo -n "${ROJO}"
echo "                              $SCRIPTS_version  by EA3EIZ"
echo -n "${VERDE}"
echo "   ************************************************************"

echo  "${CIAN}   1)${BLANCO} Puerto para Nextion conectada al GPIO (AMA0)"
echo  "${CIAN}   2)${VERDE} Puerto para Nextion conectada al Hotspot (modem)"
echo  "${CIAN}   3)${AMARILLO} Puerto para Nextion conectada por Bluetooth (rfcomm0)"
echo  "${CIAN}   4)${AMARILLO} Puerto para Nextion conectada por Bluetooth (rfcomm1)"
echo  "${CIAN}   5)${VERDE} Puerto para Nextion conectada por USB (USB0)"
echo  "${CIAN}   6)${VERDE} Puerto para Nextion conectada por USB (USB1)"
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
                          sed -i "$linea_sed_MN Port=/dev/ttyAMA0" $usuario/MMDVMHost/$DIRECTORIO
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
                          sed -i "$linea_sed_MN Port=modem" $usuario/MMDVMHost/$DIRECTORIO
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
                          sed -i "$linea_sed_MN Port=/dev/rfcomm0" $usuario/MMDVMHost/$DIRECTORIO
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
                          sed -i "$linea_sed_MN Port=/dev/rfcomm1" $usuario/MMDVMHost/$DIRECTORIO
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
                          sed -i "$linea_sed_MN Port=/dev/ttyUSB0" $usuario/MMDVMHost/$DIRECTORIO
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
                          sed -i "$linea_sed_MN Port=/dev/ttyUSB1" $usuario/MMDVMHost/$DIRECTORIO
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

