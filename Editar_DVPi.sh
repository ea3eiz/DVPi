#!/bin/bash
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


port_BM=$(awk "NR==71" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
sistema=$port_BM

if [ $sistema = Port=55555 ]
then
DIRECTORIO="DMRPLUS"
echo "${VERDE}"
echo "  ***************************************************************************"
echo "                          ${BLANCO}    Sistema $DIRECTORIO             \33[1;31m by EA3EIZ\33[1;32m   "
echo "  ***************************************************************************"
else
DIRECTORIO="BRANDMEISTER"
echo "${VERDE}"
echo "  ***************************************************************************"
echo "                          ${CIAN}    Sistema $DIRECTORIO             \33[1;31m by EA3EIZ\33[1;32m   "
echo "  ***************************************************************************"
DIRECTORIO="BRANDMEISTER"
fi



echo -n "${CIAN}   1)${GRIS} Modificar Indicativo  - ${AMARILLO}"
indicativo=$(awk "NR==2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$indicativo"

echo -n "${CIAN}   2)${GRIS} Modificar Id          - ${AMARILLO}"
id=$(awk "NR==3" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$id"

echo -n "${CIAN}   3)${GRIS} Modificar Location    - ${AMARILLO}"
contenido_location=$(awk "NR==14" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$contenido_location"

echo -n "${CIAN}   4)${GRIS} Modificar URL         - ${AMARILLO}"
contenido_url=$(awk "NR==16" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$contenido_url"


echo -n "${CIAN}   5)${GRIS} Modificar Address     - ${AMARILLO}"
address_BM=$(awk "NR==70" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$address_BM"

echo -n "${CIAN}   6)${GRIS} Modificar Puerto      - ${AMARILLO}"
port_BM=$(awk "NR==71" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$port_BM"

echo -n "${CIAN}   7)${GRIS} Modificar Password    - ${AMARILLO}"
pas_BM=$(awk "NR==74" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$pas_BM"

echo -n "${CIAN}   8)${GRIS} Modificar Options     - ${AMARILLO}"
options_BM=$(awk "NR==77" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
echo "$options_BM"



if [ $sistema = Port=55555 ]
then
echo -n "${CIAN}   G)${GRIS} Graba estos datos en  - "
echo "${BLANCO}$DIRECTORIO y reinicia el sistema"
else
echo -n "${CIAN}   G)${GRIS} Graba estos datos en  - "
echo "${CIAN}$DIRECTORIO y reinicia el sistema"
fi

if [ $sistema = Port=55555 ]
then
ITEM=9
echo ""
echo -n "${CIAN}   $ITEM) Cambiar a             - ${CIAN}"
echo "BRANDMEISTER"
else
ITEM=10
echo ""
echo -n "${CIAN}  $ITEM)${BLANCO} Cambiar a             - ${BLANCO}"
echo "DMRLUS"
fi

echo ""
echo "${CIAN}   0)\33[1;31m Salir"
echo ""
echo -n "${CIAN}   Elije una opción: " 
read escoger_menu
case $escoger_menu in
1) echo ""
while true
do
                          echo "   Valor  actual  del Indicativo: ${AMARILLO}${indicativo#*=}\33[1;37m"
                          read -p '   Introduce el Indicativo ' indicativo
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
                          sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                          #spot="[PROVA]"
                          name_hotspot= "EA3EIZ DVPi"
                          mmdvmbridge="/opt/MMDVM_Bridge/DVSwitch.ini"
                          sudo crudini --set $mmdvmbridge DMR TalkerAlias EA3EIZ DVPi
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
2) echo ""
while true
do
                          echo "   Valor  actual  de la Id: ${AMARILLO}${id#*=}\33[1;37m"
                          read -p '   Introduce Id 7 dígitos:  ' id
                          read -p '   Introduce Id 9 dígitos:  ' id2
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""

                            analogbridge="/opt/Analog_Bridge/Analog_Bridge.ini"
                            # sudo crudini --set $analogbridge GENERAL logLevel 0
                            # sudo crudini --set $analogbridge GENERAL useEmulator true
                            sudo crudini --set $analogbridge AMBE_AUDIO gatewayDmrId $id
                            sudo crudini --set $analogbridge AMBE_AUDIO repeaterID $id2
                            # sudo crudini --set $analogbridge DV3000 rxPort 2460

                          sed -i "3c Id=$id2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
3) echo ""
while true
do
                          echo "Valor de la Ciudad: ${AMARILLO}${contenido_location#*=}\33[1;37m"
                          read -p 'Introduce tu Ciudad ' loc1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "14c Location=$loc1" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
4) echo ""
while true
do
                          echo "   Valor de  la  URL   Web: ${AMARILLO}${contenido_url#*=}\33[1;37m"
           	              read -p '   Introduce URL de tu Web: ' ur1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
			                    ur1=`echo "$ur1" | tr -d '[[:space:]]'`
                          sed -i "16c URL=$ur1" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
5) echo ""
while true
do
                      echo "   Valor actual del Master: ${AMARILLO}${address_BM#*=}\33[1;37m"
                      read -p '   Brandmeister=master.spain-dmr.es / DMR+=212.237.3.141:  ' master
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      master=`echo "$master" | tr -d '[[:space:]]'`
                      master=`echo "$master" | tr [:upper:] [:lower:]`
                      sed -i "70c Address=$master" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;


6) echo ""
while true
do
                      echo "   Valor actual del Puerto: ${AMARILLO}${port_BM#*=}\33[1;37m"
                      read -p '   Introduce Puerto: ' port
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      sed -i "71c Port=$port" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;




7) echo ""
while true
do
                      echo "   Valor actual del Password: ${AMARILLO}${pas_BM#*=}\33[1;37m"
                      read -p '   Introduce Password: ' pasbm
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      sed -i "74c Password=$pasbm" /opt/MMDVM_Bridge/MMDVM_Bridge.ini

                      #cp /opt/MMDVM_Bridge/MMDVM_Bridge.ini /opt/MMDVM_Bridge/brandmeister_esp.ini
                      
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
8) echo ""
while true
do
                          read -p 'Estas en DMR+ ? S/N ' actualizar                                          
                          case $actualizar in
                          [sS]* ) echo ""
                          read -p 'Intruduce reflector DMR+ al que se conectara (ej:4370) ' options
                          if [ $options = 21465 ]
                          then
                          sed -i "77c Options=StartRef=4000;RelinkTime=15;TS2_1=21465" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                          else
                          sed -i "77c Options=StartRef=$options;RelinkTime=10;" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                          fi
                          break;;
                          [nN]* ) echo ""
                          sed -i "77c #Options=StartRef=4370;RelinkTime=10;" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                          break;;
esac
done;;
G) echo ""
while true
do
                          echo -n "${AMARILLO}"
                          read -p '   Estas seguro? S/N ' actualizar                                          
                          case $actualizar in
                          [sS]* ) echo ""  


                            #analogbridge="/opt/Analog_Bridge/Analog_Bridge.ini"
                            #sudo crudini --set $analogbridge GENERAL logLevel 0
                            #sudo crudini --set $analogbridge GENERAL useEmulator true
                            #sudo crudini --set $analogbridge AMBE_AUDIO gatewayDmrId 2143175
                            #sudo crudini --set $analogbridge AMBE_AUDIO repeaterID 214317591
                            #sudo crudini --set $analogbridge DV3000 rxPort 2460


                          if [ $sistema = Port=55555 ]
                          then
                          cp /opt/MMDVM_Bridge/MMDVM_Bridge.ini /opt/MMDVM_Bridge/dmrplus.ini
                          sudo systemctl restart md380-emu.service && sudo systemctl restart mmdvm_bridge.service
                          else
                          cp /opt/MMDVM_Bridge/MMDVM_Bridge.ini /opt/MMDVM_Bridge/brandmeister_esp.ini
                          sudo systemctl restart md380-emu.service && sudo systemctl restart mmdvm_bridge.service
                          fi
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
9) echo ""
while true
do
                          actualizar="s"             
                          case $actualizar in
                          [sS]* ) echo ""
                          cd /opt/Analog_Bridge/
                          sudo sh brandmeister_esp.sh
                          sudo systemctl restart md380-emu.service && sudo systemctl restart mmdvm_bridge.service
                          break;;
                          [nN]* ) echo ""
                          echo ""
                          break;;
esac
done;;
10) echo ""
while true
do
                          actualizar="s"             
                          case $actualizar in
                          [sS]* ) echo ""
                          cd /opt/Analog_Bridge/
                          sudo sh dmrplus.sh
                          sudo systemctl restart md380-emu.service && sudo systemctl restart mmdvm_bridge.service
                          break;;
                          [nN]* ) echo ""
                          echo ""
                          break;;
esac
done;;
0) echo ""
clear
exit;;	
esac
done