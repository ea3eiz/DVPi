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
                          echo "Valor actual Indicativo: $contenido_indicativo\33[1;37m"
           	              read -p 'Introduce tu indicativo: ' indicativo
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
			                    indicativo=`echo "$indicativo" | tr -d '[[:space:]]'`
                      
                          sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO General Callsign $indicativo
                          #sed -i "$numero_linea_indi Callsign=$indicativo" $usuario/MMDVMHost/$DIRECTORIO
                          sed -i "$primero $contenido_indicativo" $usuario/info_panel_control.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
2) echo ""
while true
do
                          echo "Valor actual del RXFrequency: $contenido_rxf\33[1;37m"
           	              read -p 'Introduce RXFrequency:        ' rxfre
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info RXFrequency $rxfre
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
3) echo ""
while true
do
                          echo "Valor actual del TXFrequency: $contenido_txf\33[1;37m"
                          read -p 'Introduce TXFrequency:        ' txfre
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info TXFrequency $txfre
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
4) echo ""
while true
do
                          echo "Valor de la Ciudad: $contenido_location\33[1;37m"
                          read -p 'Introduce tu Ciudad ' loc1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info Location $loc1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
5) echo ""
while true
do
                          echo "Valor de  la  URL   Web: $url1\33[1;37m"
           	              read -p 'Introduce URL de tu Web: ' ur1
                          case $actualizar in
			                    [sS]* ) echo ""
			                    ur1=`echo "$ur1" | tr -d '[[:space:]]'`
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info URL $ur1
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
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyAMA0
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
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyACM0
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
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port /dev/ttyUSB0
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
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
10) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $idd $buscar`
                          echo "Valor  actual  del Id: ${AMARILLO}${idd#*=}\33[1;37m"
           	              read -p 'Introduce un ID válido ' miid
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $idd 1 1`
                          else
                          linea=`expr substr $idd 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea Id=$miid" $usuario/MMDVMHost/$DIRECTORIO
                          sed -i "$segundo Id=$miid" $usuario/info_panel_control.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
11) echo ""
while true
do
                      echo "Valor actual del Master: ${AMARILLO}${master#*=}\33[1;37m"
                      read -p 'Brandmeister=master.spain-dmr.es / DMR+=212.237.3.141: ' master1
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      master1=`echo "$master1" | tr -d '[[:space:]]'`
                      master1=`echo "$master1" | tr [:upper:] [:lower:]`
                      sed -i "$linea_master Address=$master1" $usuario/MMDVMHost/$DIRECTORIO
                      sed -i "$cuarto Address=$master1" $usuario/info_panel_control.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
12) echo ""
while true
do
                          echo -n "Valor actual del \33[1;37m${var100port#*=}\33[1;37m"
                          var100port= sed -n $linea2port  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Puerto para Brandmeister=62031 puerto para DMR+=55555 : ' miid
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          letra1=c
                          linea4=$linea3port$letra1
                          sed -i "$linea4 Port=$miid" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
13) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $pas $buscar`
                          echo "   Valor  actual  del Password: ${AMARILLO}${pas#*=}\33[1;37m"
           	              read -p '   Password para DMR+=PASSWORD: ' pas1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $pas 1 2`
                          else
                          linea=`expr substr $pas 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
			                    pas1=`echo "$pas1" | tr -d '[[:space:]]'`
                          sed -i "$linea Password=$pas1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
14) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $txinv $buscar`
                          echo "Valor  actual del  TXInvert: ${AMARILLO}${txinv#*=}\33[1;37m"
           	              read -p 'Valor óptimo para DVMEGA=1 : ' txinv1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $txinv 1 2`
                          else
                          linea=`expr substr $txinv 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea TXInvert=$txinv1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
15) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $rx $buscar`
                          echo "Valor  actual  del  RXLevel : ${AMARILLO}${rx#*=}\33[1;37m"
                          read -p 'Valor óptimo (en mi caso) para DVMEGA=45, Low cost EA4AOJ=45, NANO BLAS=60 : ' var2
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $rx 1 2`
                          else
                          linea=`expr substr $rx 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea RXLevel=$var2" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
16) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $tx $buscar`
                          echo "Valor  actual  del  TXLevel : ${AMARILLO}${tx#*=}\33[1;37m"
           	              read -p 'Valor óptimo=50 : ' var2
                          letra=c
                          if [ $largo = 3 ]3
                          then
                          linea=`expr substr $tx 1 2`
                          else
                          linea=`expr substr $tx 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea TXLevel=$var2" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
17) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $dup $buscar`
                          echo "Valor actual del Duplex: ${AMARILLO}${dup#*=}\33[1;37m"
           	              read -p 'Para un repetidor Duplex=1 Para un DVMEGA Duplex=0: ' dup1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $dup 1 1`
                          else
                          linea=`expr substr $dup 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea Duplex=$dup1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
18) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $txh $buscar`
                          echo "Valor actual del TXHang: ${AMARILLO}${txh#*=}\33[1;37m"
           	              read -p 'Para un repetidor TXHang=4 Para un DVMEGA TXHang=0: ' txh1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $txh 1 2`
                          else
                          linea=`expr substr $txh 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea TXHang=$txh1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
19) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $lg $buscar`
                          echo "Valor actual del DisplayLevel: ${AMARILLO}${lg#*=}\33[1;37m"
           	              read -p 'Para visualizar tramas seguidas introduce 1, para una sola trama introduce 2:' lg1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $lg 1 2`
                          else
                          linea=`expr substr $lg 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea DisplayLevel=$lg1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
20) echo ""
while true
do
                          sl=`grep -n -m 1 -c '\<Slot1\>' $usuario/MMDVMHost/$DIRECTORIO`
                          if [ $sl = 0 ]; then
                          echo "no existe este comando"
                          else
                          sl=`grep -n -m 1 '\<Slot1\>' $usuario/MMDVMHost/$DIRECTORIO`
                          sl1=`expr substr $sl 5 30`
                          echo "$sl1"
                          fi
                          buscar=":"
                          largo=`expr index $sl $buscar`
                          echo "Valor actual del Slot1=: ${AMARILLO}${sl#*=}\33[1;37m"
           	              read -p 'Para DVMEGA Modificar el valor del Slot1=0: ' V
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $sl 1 2`
                          else
                          linea=`expr substr $sl 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
			                    [sS]* ) echo ""
			                    V=`echo "$V" | tr -d '[[:space:]]'`			  
                          sed -i "$linea Slot1=$V" $usuario/MMDVMHost/$DIRECTORIO             
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
21) echo ""
while true
do
                          Display=`grep -n -m 1 -c '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
                          if [ $Display = 0 ]; then
                          echo "no existe este comando"
                          else
                          Display=`grep -n -m 1 '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
                          Display1=`expr substr $Display 5 30`
                          fi
                          buscar=":"
                          largo=`expr index $Display $buscar`
                          echo "Valor actual del Display=: ${AMARILLO}${Display1#*=}\33[1;37m"
                          read -p 'Introduce tipo de Display Ej. Nextion ó OLED: ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $Display 1 1`
                          else
                          linea=`expr substr $Display 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
                          V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea Display=$V" $usuario/MMDVMHost/$DIRECTORIO             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
22) echo ""
while true
do
                          ScreenLayout=`grep -n -m 1 -c '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
                          if [ $ScreenLayout = 0 ]; then
                          echo "no existe este comando"
                          else
                          ScreenLayout=`grep -n -m 1 '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
                          ScreenLayout1=`expr substr $ScreenLayout 5 30`
                          fi
                          buscar=":"
                          largo=`expr index $ScreenLayout $buscar`
                          echo "Valor actual del ScreenLayout=: ${AMARILLO}${ScreenLayout1#*=}\33[1;37m"
                          read -p 'Este parametro debe ser 3: ' V
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $ScreenLayout 1 2`
                          else
                          linea=`expr substr $ScreenLayout 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
                          V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea ScreenLayout=$V" $usuario/MMDVMHost/$DIRECTORIO             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
23) echo ""
while true
do
                          read -p 'Introduce el brillo IdleBrightness: ' V
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
                          V=`echo "$V" | tr -d '[[:space:]]'`      
                          sed -i "$linea_sed_IdleBrightness IdleBrightness=$V" $usuario/MMDVMHost/$DIRECTORIO             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
a) echo ""
while true
do
                          echo -n "Valor actual D-STAR ${AMARILLO}${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_dstar_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1:  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_dstar_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
b) echo ""
while true
do
                          echo -n "Valor  actual  DMR ${AMARILLO}${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_dmr_letrap  $usuario/MMDVMHost/$DIRECTORIO;
           	              read -p 'Desactivado=0 Activado=1: '   dmrac1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$numero_linea_dmr_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
c) echo ""
while true
do
                          echo -n "Valor actual FUSION ${AMARILLO}${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_fusion_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1:  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_fusion_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
d) echo ""
while true
do
                          echo -n "Valor  actual  P25 ${AMARILLO}${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_p25_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1: '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_p25_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
e) echo ""
while true
do
                          read -p 'Introduce el valor de la Baliza (Ej. 1-activada 0-desactivada) : ' baliza
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "31c Enable=$baliza" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
f) echo ""
while true
do
                          modehang=`grep -n -m 1 -c '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
                          if [ $modehang = 0 ]; then
                          echo "no existe este comando"
                          else
                          modehang=`grep -n -m 1 '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
                          modehang1=`expr substr $modehang 5 30`
                          fi
                          buscar=":"
                          largo=`expr index $modehang $buscar`
                          echo "Valor actual del RFModeHang = : ${AMARILLO}${modehang1#*=}\33[1;37m"
                          read -p 'Introduce el valor para RFModeHang (optimo=5): ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $modehang 1 1`
                          else
                          linea=`expr substr $modehang 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
                          V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea RFModeHang=$V" $usuario/MMDVMHost/$DIRECTORIO             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
g) echo ""
while true
do
                          timeo=`grep -n -m 1 -c '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
                          if [ $timeo = 0 ]; then
                          echo "no existe este comando"
                          else
                          timeo=`grep -n -m 1 '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
                          timeo1=`expr substr $timeo 5 30`
                          fi
                          buscar=":"
                          largo=`expr index $timeo $buscar`
                          echo "Valor actual del Timeout = : ${AMARILLO}${timeo1#*=}\33[1;37m"
                          read -p 'Introduce el valor para Timeout (valor optimo=0): ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $timeo 1 1`
                          else
                          linea=`expr substr $timeo 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
                          V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea Timeout=$V" $usuario/MMDVMHost/$DIRECTORIO             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
h) echo ""
while true
do
                          echo "Valor del Port: ${AMARILLO}$MODEMNEXTION"
                          read -p 'Ej. modem, /dev/ttyAMA0, /dev/rfcomm0, /dev/ttyUSB0 :' lat1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_MN Port=$lat1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
i) echo ""
while true
do
                          echo "Valor actual NXDN: ${AMARILLO}$NXDN"
                          read -p 'Desactivado=0 Activado=1: '   NXDN1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_NXDN Enable=$NXDN1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
j) echo ""
while true
do
                          echo "Valor actual POCSAG: ${AMARILLO}$POCSAG"
                          read -p 'Desactivado=0 Activado=1: '   POCSAG1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_POCSAG Enable=$POCSAG1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
l) echo ""
while true
do                         
                          echo "   Valor  actual  FM: ${AMARILLO}$FM"
                          read -p '   Desactivado=0 Activado=1: '   fm
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_FM Enable=$fm" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
m) echo ""
while true
do                         
                          echo "   Valor  actual  tipo OLED: ${AMARILLO}$tipo_oled"
                          read -p '   Para OLED 0.96 Type=3 / Para OLED 1.3 Type=6: '   oled
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO OLED Type $oled
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
k) echo ""
while true
do                         
                          echo "Valor actual  del Jitter: ${AMARILLO}$Jitter"
                          read -p 'Introduce valor entre 360 a 600: '   JITTER
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_jiter_letrac Jitter=$JITTER" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
24) echo ""
while true
do
                          buscar=":"
                          largo=`expr index $lat $buscar`
                          echo "Valor de la Latitud: ${AMARILLO}${lat#*=}\33[1;37m"
           	              read -p 'Introduce la Latitud ' lat1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $lat 1 2`
                          else
                          linea=`expr substr $lat 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$linea Latitude=$lat1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
25) echo ""
while true
do
                          echo "Valor de la Longitud: $long1\33[1;37m"
           	              read -p 'Introduce la Longitud ' long1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info Longitude $long1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
26) echo ""
while true
do
                          echo "Valor  actual  del  Module: ${AMARILLO}$modu1\33[1;37m"
           	              read -p 'Valor óptimo para D-STAR=B: '  modu1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          #Convierte minúsculas a Mayúsculas
                          modu1=`echo "$modu1" | tr [:lower:] [:upper:]`
                          sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO D-Star Module $modu1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
27) echo ""
while true
do
                          read -p 'Estas en DMR+ ? S/N ' actualizar                                          
                          case $actualizar in
                          [sS]* ) echo ""
                          read -p 'Intruduce reflector DMR+ al que se conectara (ej:4370) ' opcion
                          letra1=c
                          linea4=$linea33port$letra1
                          if [ $opcion = 21465 ]
                          then
                          sed -i "$linea4 Options=StartRef=4000;RelinkTime=15;TS2_1=21465" $usuario/MMDVMHost/$DIRECTORIO
                          else
                          sed -i "$linea4 Options=StartRef=$opcion;RelinkTime=10;" $usuario/MMDVMHost/$DIRECTORIO
                          fi
                          break;;
                          [nN]* ) echo ""
                          letra1=c
                          linea4=$linea33port$letra1
                          sed -i "$linea4 #Options=StartRef=4370;RelinkTime=10;" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
esac
done;;
28) echo ""
while true
do
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          geany $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
29) echo ""
while true
do
                        actualizar=S
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria1
                        echo "<<<<<< Haciendo copia de seguridad de la M1 >>>>>"
                        sleep 3
                        echo "$linea_info_memoria $usuario $DIRECTORIO $memoria1"
                        sed -i "$primer $memoria1" $usuario/info_panel_control.ini
                        sed -i "$linea_info_memoria $memoria1" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
30) echo ""
while true
do
                        actualizar=S
                        case $actualizar in
                        [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad de la M1 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia $usuario/MMDVMHost/$DIRECTORIO
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
31) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria2
                        echo "<<<<<< Haciendo copia de seguridad de la M2 >>>>>"
                        sleep 3
                        sed -i "$segun $memoria2" $usuario/info_panel_control.ini
                        sed -i "$linea_info_memoria $memoria2" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia2
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
32) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad  de la M2 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia2 $usuario/MMDVMHost/$DIRECTORIO
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
33) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria3
                        echo "<<<<<< Haciendo copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sed -i "$tercer $memoria3" $usuario/info_panel_control.ini
                        sed -i "$linea_info_memoria $memoria3" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia3
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
34) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia3 $usuario/MMDVMHost/$DIRECTORIO
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
35) echo ""
while true
do
          	        
           	            read -p 'Quieres restaurar el fichero original MMDVM.ini ? S/N ' restaurar1   
                        case $restaurar1 in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando el fichero original $DIRECTORIO >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/MMDVM.ini_original $usuario/MMDVMHost/$DIRECTORIO
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
0) echo ""
exit;;	
esac
done

