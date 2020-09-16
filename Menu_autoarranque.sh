#!/bin/bash

script="Script Modificar Autoarranque"
conectar="Conectar"
desconectar="Desconectar"
estado="Estado"
restablece="DESHABILITAR TODOS LOS AUTOARRANQUES"
salir="Salir"
elige="Elige una opción"
reset="OJO!! ESTO PONDRÁ TODOS LOS AUTOARRANQUES EN OFF"

while true
do
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
version=`expr substr $SCRIPTS_version 2 2`
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   **************************************************"
echo -n "${CIAN}"
echo "               $script    "
echo -n "${ROJO}"
echo "                     $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************"
#==================================================================================
dstar=$(awk "NR==1" /home/pi/.local/autoarranque.ini)
dstar=`expr substr $dstar 8 3`
if [ $dstar = "ON" ]
then
echo "   ${CIAN} 1) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}ircDDB"
else
echo "   ${CIAN} 1) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}ircDDB"
fi
#==================================================================================

#================================================================================== 

bluedv=$(awk "NR==2" /home/pi/.local/autoarranque.ini)
bluedv=`expr substr $bluedv 8 3`
if [ $bluedv = "ON" ]
then
echo "   ${CIAN} 2) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}BlueDV"
else
echo "   ${CIAN} 2) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}BlueDV"
fi
#==================================================================================

#==================================================================================
C4F=$(awk "NR==3" /home/pi/.local/autoarranque.ini)
C4F=`expr substr $C4F 5 3`
if [ $C4F = "ON" ]
then
echo "   ${CIAN} 3) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}YSF"
else
echo "   ${CIAN} 3) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}YSF"
fi
#==================================================================================

#==================================================================================
DV4mini=$(awk "NR==4" /home/pi/.local/autoarranque.ini)
DV4mini=`expr substr $DV4mini 9 3`
if [ $DV4mini = "ON" ]
then
echo "   ${CIAN} 4) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DV4mini"
else
echo "   ${CIAN} 4) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DV4mini"
fi
#==================================================================================

#==================================================================================

MMDVMPLACA=$(awk "NR==5" /home/pi/.local/autoarranque.ini)
MMDVMPLACA=`expr substr $MMDVMPLACA 7 3`
if [ $MMDVMPLACA = "ON" ]
then
echo "   ${CIAN} 5) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}Radio"
else
echo "   ${CIAN} 5) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}Radio"
fi
#==================================================================================

#==================================================================================
MMDVMPLUS=$(awk "NR==6" /home/pi/.local/autoarranque.ini)
MMDVMPLUS=`expr substr $MMDVMPLUS 6 3`
if [ $MMDVMPLUS = "ON" ]
then
echo "   ${CIAN} 6) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DMR+"
else
echo "   ${CIAN} 6) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DMR+"
fi
#==================================================================================

#==================================================================================
MMDVMLIBRE=$(awk "NR==7" /home/pi/.local/autoarranque.ini)
MMDVMLIBRE=`expr substr $MMDVMLIBRE 10 3`
if [ $MMDVMLIBRE = "ON" ]
then
echo "   ${CIAN} 7) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}ESPECIAL"
else
echo "   ${CIAN} 7) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}ESPECIAL"
fi
#==================================================================================

#==================================================================================
MMDVMBM=$(awk "NR==8" /home/pi/.local/autoarranque.ini)
MMDVMBM=`expr substr $MMDVMBM 4 3`
if [ $MMDVMBM = "ON" ]
then
echo "   ${CIAN} 8) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}BM"
else
echo "   ${CIAN} 8) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}BM"
fi
#==================================================================================

#==================================================================================
SVXLINK=$(awk "NR==9" /home/pi/.local/autoarranque.ini)
SVXLINK=`expr substr $SVXLINK 9 3`
if [ $SVXLINK = "ON" ]
then
echo "   ${CIAN} 9) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}SVXLINK"
else
echo "   ${CIAN} 9) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}SVXLINK"
fi
#==================================================================================

#==================================================================================
solod=$(awk "NR==10" /home/pi/.local/autoarranque.ini)
solod=`expr substr $solod 12 3`
if [ $solod = "ON" ]
then
echo "   ${CIAN}10) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}SOLO_DSTAR"
else
echo "   ${CIAN}10) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}SOLO_DSTAR"
fi
#=================================================================================

#==================================================================================
solof=$(awk "NR==11" /home/pi/.local/autoarranque.ini)
solof=`expr substr $solof 13 3`
if [ $solof = "ON" ]
then
echo "   ${CIAN}11) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}SOLO_FUSION"
else
echo "   ${CIAN}11) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}SOLO_FUSION"
fi
#=================================================================================

#==================================================================================
dvrptrq=$(awk "NR==12" /home/pi/.local/autoarranque.ini)
dvrptrq=`expr substr $dvrptrq 8 3`
if [ $dvrptrq = "ON" ]
then
echo "   ${CIAN}12) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DVPi"
else
echo "   ${CIAN}12) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DVPi"
fi
#=================================================================================

#==================================================================================
ambeserver=$(awk "NR==13" /home/pi/.local/autoarranque.ini)
ambeserver=`expr substr $ambeserver 13 3`
if [ $ambeserver = "ON" ]
then
echo "   ${CIAN}13) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}AMBE SERVER"
else
echo "   ${CIAN}13) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}AMBE SERVER"
fi
#=================================================================================

#==================================================================================
ysfdmr=$(awk "NR==14" /home/pi/.local/autoarranque.ini)
ysfdmr=`expr substr $ysfdmr 9 3`
if [ $ysfdmr = "ON" ]
then
echo "   ${CIAN}14) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}YSF2DMR"
else
echo "   ${CIAN}14) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}YSF2DMR"
fi
#=================================================================================

#==================================================================================
dmrysf=$(awk "NR==15" /home/pi/.local/autoarranque.ini)
dmrysf=`expr substr $dmrysf 9 3`
if [ $dmrysf = "ON" ]
then
echo "   ${CIAN}15) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DMR2YSF"
else
echo "   ${CIAN}15) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DMR2YSF"
fi
#=================================================================================

#==================================================================================
dmrnxdn=$(awk "NR==16" /home/pi/.local/autoarranque.ini)
dmrnxdn=`grep "DMR2NXDN" /home/pi/.local/autoarranque.ini`
dmrnxdn=`expr substr $dmrnxdn 10 3`
if [ $dmrnxdn = "ON" ]
then
echo "   ${CIAN}16) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DMR2NXDN"
else
echo "   ${CIAN}16) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DMR2NXDN"
fi
#=================================================================================

#==================================================================================
nxdn=$(awk "NR==17" /home/pi/.local/autoarranque.ini)
nxdn=`expr substr $nxdn 6 3`
if [ $nxdn = "ON" ]
then
echo "   ${CIAN}17) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}NXDN"
else
echo "   ${CIAN}17) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}NXDN"
fi
#=================================================================================

#=========================================================================*========
dmrgateway=$(awk "NR==18" /home/pi/.local/autoarranque.ini)
dmrgateway=`expr substr $dmrgateway 12 3`
if [ $dmrgateway = "ON" ]
then
echo "   ${CIAN}18) $desconectar  ${VERDE}\t$estado ON ${CIAN}    \t${VERDE}DMRGateway"
else
echo "   ${CIAN}18) $conectar  ${ROJO}\t$estado OFF ${CIAN}    \t${ROJO}DMRGateway"
fi
#=========================================================================*========

echo ""

echo "\33[1;36m   19)\33[1;32m *** $restablece"

echo ""
echo -n "\33[1;36m   $elige: " 
read escoger_menu
echo ""

case $escoger_menu in
1) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $dstar = "ON" ]
                            then
                       		cd /home/pi/.config/autostart
                       		sudo rm IRCDDB.desktop
			                sed -i "1c ircDDB=OFF" /home/pi/.local/autoarranque.ini
                            else
                       		cd /home/pi/AUTOARRANQUEDVPi
                  		    sudo cp IRCDDB.desktop /home/pi/.config/autostart
			                sed -i "1c ircDDB=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;

2) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $bluedv = "ON" ]
                            then
                       		cd /home/pi/.config/autostart
                       		sudo rm BLUEDV.desktop
			                sed -i "2c BlueDV=OFF" /home/pi/.local/autoarranque.ini
                            else
                       		cd /home/pi/AUTOARRANQUEDVPi
                       		sudo cp BLUEDV.desktop /home/pi/.config/autostart
			                sed -i "2c BlueDV=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
3) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $C4F = "ON" ]
                            then
                       		cd /home/pi/.config/autostart
                       		sudo rm YSF.desktop
			                sed -i "3c YSF=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp YSF.desktop /home/pi/.config/autostart
                            sed -i "3c YSF=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
4) echo ""
while true
do
clear            
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $DV4mini = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DV4MINI.desktop
                            sed -i "4c DV4mini=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DV4MINI.desktop /home/pi/.config/autostart
                            sed -i "4c DV4mini=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
5) echo ""
while true
do
clear              
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $MMDVMPLACA = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm RADIO.desktop
                            sed -i "5c Radio=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp RADIO.desktop /home/pi/.config/autostart
                            sed -i "5c Radio=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
6) echo ""
while true
do
clear              
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $MMDVMPLUS = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DMRPLUS.desktop
                            sed -i "6c DMR+=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DMRPLUS.desktop /home/pi/.config/autostart
                            sed -i "6c DMR+=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
7) echo ""
while true
do
clear              
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $MMDVMLIBRE = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm LIBRE.desktop
                            sed -i "7c ESPECIAL=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp LIBRE.desktop /home/pi/.config/autostart
                            sed -i "7c ESPECIAL=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;                        
esac
done;;
8) echo ""
while true
do
clear              
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $MMDVMBM = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm BM.desktop
                            sed -i "8c BM=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp BM.desktop /home/pi/.config/autostart
                            sed -i "8c BM=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
9) echo ""
while true
do
clear	        
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $SVXLINK = "ON" ]
                            then
                            cd /home/pi/.config/autostart
      		                sudo rm SVXLINK.desktop
			                sed -i "9c SVXLINK=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp SVXLINK.desktop /home/pi/.config/autostart
			                sed -i "9c SVXLINK=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
10) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $solod = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DSTARSOLO_05.desktop
                            sed -i "10c SOLO_DSTAR=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DSTARSOLO_05.desktop /home/pi/.config/autostart
                            sed -i "10c SOLO_DSTAR=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
11) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $solof = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm FUSIONSOLO.desktop
                            sed -i "11c SOLO_FUSION=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp FUSIONSOLO.desktop /home/pi/.config/autostart
                            sed -i "11c SOLO_FUSION=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
12) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $dvrptrq = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DVRPTR.desktop
                            sed -i "12c DVRPTR=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DVRPTR.desktop /home/pi/.config/autostart
                            sed -i "12c DVRPTR=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
14) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $ysfdmr = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm FUSIONSOLO.desktop
                            sudo rm YSF2DMR.desktop
                            sed -i "14c YSF2DMR=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp YSF2DMR.desktop /home/pi/.config/autostart
                            sed -i "14c YSF2DMR=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
13) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $ambeserver = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm AMBE_SERVER.desktop
                            sed -i "13c AMBE_SERVER=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp AMBE_SERVER.desktop /home/pi/.config/autostart
                            sed -i "13c AMBE_SERVER=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
15) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $dmrysf = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DMR2YSF.desktop
                            sed -i "15c DMR2YSF=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DMR2YSF.desktop /home/pi/.config/autostart
                            sed -i "15c DMR2YSF=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
16) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $dmrnxdn = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DMR2NXDN.desktop
                            sed -i "16c DMR2NXDN=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DMR2NXDN.desktop /home/pi/.config/autostart
                            sed -i "16c DMR2NXDN=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
17) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $nxdn = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm NXDN.desktop
                            sed -i "17c NXDN=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp NXDN.desktop /home/pi/.config/autostart
                            sed -i "17c NXDN=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
18) echo ""
while true
do
clear
	                     	actualizar=S
		                   	case $actualizar in
			                [sS]* ) echo ""
                            if [ $dmrgateway = "ON" ]
                            then
                            cd /home/pi/.config/autostart
                            sudo rm DMRGateway.desktop
                            sed -i "18c DMRGateway=OFF" /home/pi/.local/autoarranque.ini
                            else
                            cd /home/pi/AUTOARRANQUEDVPi
                            sudo cp DMRGateway.desktop /home/pi/.config/autostart
                            sed -i "18c DMRGateway=ON" /home/pi/.local/autoarranque.ini
                            fi
			                break;;
			                [nN]* ) echo ""
			                break;;
esac
done;;
19) echo ""
while true
do
clear
                        echo "\33[1;31m" #color rojo
                        echo " *****************************************************"
                        echo " ** $reset *"
                        echo " *****************************************************"
                        echo -n "${BLANCO}  Quieres seguir? S/N "
                        read -p ' ' ejecutar1
                        case $ejecutar1 in
                        [sSyY]* ) echo ""

                        cd /home/pi/.config/autostart
                        sudo rm IRCDDB.desktop
                        sudo rm BM.desktop
                        sudo rm BLUEDV.desktop
                        sudo rm YSF.desktop
                        sudo rm DV4MINI.desktop
                        sudo rm RADIO.desktop
                        sudo rm DMRPLUS.desktop
                        sudo rm LIBRE.desktop
                        sudo rm SVXLINK.desktop
                        sudo rm DSTARSOLO_05.desktop
                        sudo rm FUSIONSOLO.desktop
                        sudo rm DVRPTR.desktop
                        sudo rm YSF2DMR.desktop
                        sudo rm AMBE_SERVER.desktop
                        sudo rm DMR2YSF.desktop
                        sudo rm DMR2NXDN.desktop
                        sudo rm NXDN.desktop
                        sudo rm DMRGateway.desktop

sed -i "1c ircDDB=OFF" /home/pi/.local/autoarranque.ini
sed -i "2c BlueDV=OFF" /home/pi/.local/autoarranque.ini
sed -i "3c YSF=OFF" /home/pi/.local/autoarranque.ini
sed -i "4c DV4mini=OFF" /home/pi/.local/autoarranque.ini
sed -i "5c Radio=OFF" /home/pi/.local/autoarranque.ini
sed -i "6c DMR+=OFF" /home/pi/.local/autoarranque.ini
sed -i "7c ESPECIAL=OFF" /home/pi/.local/autoarranque.ini
sed -i "8c BM=OFF" /home/pi/.local/autoarranque.ini
sed -i "9c SVXLINK=OFF" /home/pi/.local/autoarranque.ini
sed -i "10c SOLO_DSTAR=OFF" /home/pi/.local/autoarranque.ini
sed -i "11c SOLO_FUSION=OFF" /home/pi/.local/autoarranque.ini
sed -i "12c DVRPTR=OFF" /home/pi/.local/autoarranque.ini
sed -i "13c AMBE_SERVER=OFF" /home/pi/.local/autoarranque.ini
sed -i "14c YSF2DMR=OFF" /home/pi/.local/autoarranque.ini
sed -i "15c DMR2YSF=OFF" /home/pi/.local/autoarranque.ini
sed -i "16c DMR2NXDN=OFF" /home/pi/.local/autoarranque.ini
sed -i "17c NXDN=OFF" /home/pi/.local/autoarranque.ini
sed -i "18c DMRGateway=OFF" /home/pi/.local/autoarranque.ini

                        exit;
                        break;;
                        [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
0) echo "."
clear
exit;;	
esac
done

