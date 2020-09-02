#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" ~/usuario)

# path Versión
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

#Editor MMDVMPLUS.ini
DIRECTORIO="MMDVMPLUS.ini"
DIRECTORIO_copia="MMDVMPLUS.ini_copia"
DIRECTORIO_copia2="MMDVMPLUS.ini_copia2"
DIRECTORIO_copia3="MMDVMPLUS.ini_copia3"

#Escribe datos en el fichero $usuario/info_panel_control.ini para leer desde el panel de control
primero="11c"
segundo="12c"
tercero="13c"
cuarto="14c"
  #Escribe datos en el fichero $usuario/info_panel_control.ini para las memorias M1, M2 y M3
primer="31c"
segun="32c"
tercer="33c"
  #Lee los datos del fichero $usuario/info_panel_control.ini para las memorias M1, M2 y M3 
primer1="31c"
segun1="32c"
tercer1="33c"
# Recoge datos para leer desde el panel de control
indi=$(awk "NR==2" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "$primero $indi" $usuario/info_panel_control.ini
ide=$(awk "NR==3" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "$segundo $ide" $usuario/info_panel_control.ini
frec=$(awk "NR==13" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "$tercero $frec" $usuario/info_panel_control.ini
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
master=$(awk "NR==$linea_master" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "$cuarto $master" $usuario/info_panel_control.ini

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

linea_info_memoria="313c" #Linea del MMDVM donde guardamos el nombre de la memoria

echo "${VERDE}"
echo "   ***************************************************************************************"
echo -n "${CIAN}"
echo "                               Script para Modificar $DIRECTORIO    "
echo -n "${ROJO}"
echo "                                       $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ***************************************************************************************"

echo  "${CIAN}   1)${GRIS} Puerto ACM0"
echo  "${CIAN}   2)${GRIS} Puerto ACM1"
echo  "${CIAN}   3)${GRIS} Puerto ACM2"
echo  "${CIAN}   4)${GRIS} Puerto ACM3"
echo  "${CIAN}   5)${GRIS} Puerto AMA0"
echo  "${CIAN}   6)${GRIS} Puerto AMA1"
echo  "${CIAN}   7)${GRIS} Puerto AMA2"
echo  "${CIAN}   8)${GRIS} Puerto AMA3"

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
0) echo ""
exit;;	
esac
done

