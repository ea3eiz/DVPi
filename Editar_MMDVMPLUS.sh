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

echo -n "${CIAN}   1)${GRIS} Modificar Callsign    - ${AMARILLO}"
contenido_indicativo=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General Callsign)
echo "$contenido_indicativo"

echo -n "${CIAN}   2)${GRIS} Modificar RXFrequency - ${AMARILLO}"
contenido_rxf=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Info RXFrequency)
echo "$contenido_rxf"

echo -n "${CIAN}   3)${GRIS} Modificar TXFrequency - ${AMARILLO}"
contenido_txf=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Info TXFrequency)
echo "$contenido_txf"

echo -n "${CIAN}   4)${GRIS} Modificar Location    - ${AMARILLO}"
loc=`grep -n "^Location=" $usuario/MMDVMHost/$DIRECTORIO`
loc1=`echo "$loc" | tr -d '[[:space:]]'`
buscar=":"
largo_linea=`expr index $loc1 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $loc1 1 $largo_linea`
letrac=c
numero_linea_letrac=$numero_linea$letrac
contenido_location=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
echo "${contenido_location#*=}"

echo -n "${CIAN}   5)${GRIS} Modificar URL         - ${AMARILLO}"
url1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Info URL)
echo "$url1"

echo "${CIAN}   6)${GRIS} Puerto para DVMEGA pinchado en GPIO (ttyAMA0)${AMARILLO}"
echo "${CIAN}   7)${GRIS} Puerto para NTH/ZUM, Hotspots, Nano, Low Cost etc.. (ttyACM0)${AMARILLO}"
echo "${CIAN}   8)${GRIS} Puerto para DVMEGA + Bluestack conectado por USB (ttyUSB0)${AMARILLO}"
echo "${CIAN}   9)${VERDE} Menú elegir Puerto  ${CIAN}"

echo -n "                            - "

idd1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem Port)
echo "$idd1"


echo -n "${CIAN}  10)${GRIS} Modificar Id          - ${AMARILLO}"
idd1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General Id)
echo "$idd1"

echo -n "${CIAN}  11)${GRIS} Modificar Address     - ${AMARILLO}"
ad="DMR Network"          
master1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Address)
echo "$master1"

echo -n "${CIAN}  12)${GRIS} Modificar Port        - ${AMARILLO}"
ad="DMR Network"          
port=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Port)
echo "$port"

echo -n "${CIAN}  13)${GRIS} Modificar Password    - ${AMARILLO}"
ad="DMR Network"          
password=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Password)
echo "$password"

echo -n "${CIAN}   R)${GRIS} Modificar RXInvert    - ${AMARILLO}"          
rxinv1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem RXInvert)
echo "$rxinv1"

echo -n "${CIAN}  14)${GRIS} Modificar TXInvert    - ${AMARILLO}"
txinv1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem TXInvert)
echo -n "$txinv1"

echo -n "${CIAN}        \t\t\ta)${GRIS} D-STAR      - ${AMARILLO}"
dstar_enable=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO D-Star Enable)
echo "$dstar_enable"

echo -n "${CIAN}  15)${GRIS} Modificar RXLevel     - ${AMARILLO}"
rx1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem RXLevel)
echo -n "$rx1"

echo -n "${CIAN}        \t\tb)${GRIS} DMR         - ${AMARILLO}"
dmr_enable=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO DMR Enable)
echo "$dmr_enable"

echo -n "${CIAN}  16)${GRIS} Modificar TXLevel     - ${AMARILLO}"
tx1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem TXLevel)
echo -n "$tx1"

echo -n "${CIAN}        \t\tc)${GRIS} FUSION      - ${AMARILLO}"
ad="System Fusion Network"          
Enable_fusion=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Enable)
echo "$Enable_fusion"

echo -n "${CIAN}  17)${GRIS} Modificar Duplex      - ${AMARILLO}"
dup1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General Duplex)
echo -n "$dup1"

echo -n "${CIAN}          \t\td)${GRIS} P25         - ${AMARILLO}"
p25_enable=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO P25 Enable)
echo "$p25_enable"

echo -n "${CIAN}  18)${GRIS} Modificar TXHang      - ${AMARILLO}"
txh1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO DMR TXHang)
echo -n "$txh1"

echo -n "${CIAN}          \t\te)${GRIS} Baliza      - ${AMARILLO}"
ad="CW Id"          
Enable_baliza=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Enable)
echo "$Enable_baliza"

echo -n "${CIAN}  19)${GRIS} Modificar DisplayLevel- ${AMARILLO}"          
lg1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Log DisplayLevel)
echo -n "$lg1"

echo -n "${CIAN}    \t\t\tf)${GRIS} RFModeHang  - ${AMARILLO}"
modehang1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General RFModeHang)
echo "$modehang1"

echo -n "${CIAN}  20)${GRIS} Modificar Slot1       - ${AMARILLO}"
ad="DMR Network"          
sl1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Slot1)
echo -n "$sl1"

echo -n "${CIAN}           \t\tg)${GRIS} Timeout     - ${AMARILLO}"
timeo1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General Timeout)
echo "$timeo1"

echo -n "${CIAN}  21)${GRIS} Tipo Pantalla Display - ${AMARILLO}"
Display1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO General Display)
echo -n "$Display1"

echo -n " ${CIAN}\t\t\th) ${GRIS}Port Nextion- ${AMARILLO}$MODEMNEXTION"
port_nextion=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Nextion Port)
echo "$port_nextion"

echo -n "${CIAN}  22)${GRIS} Version Display       - ${AMARILLO}"
ScreenLayout1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Nextion ScreenLayout)
echo -n "$ScreenLayout1"

# i) NXDN Enable=
echo -n "  ${CIAN}  \t\t\ti) ${GRIS}NXDN        - ${AMARILLO}$NXDN"
Enable_nxdn=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO NXDN Enable)
echo "$Enable_nxdn"

# 23) IdleBrightness=
echo -n "  ${CIAN}23) ${GRIS}Brillo reposo Nextion - ${AMARILLO}$IdleBrightness_CORTO"
brillo_nextion=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Nextion IdleBrightness)
echo -n "$brillo_nextion"

# j) POCSAG Enable=
echo -n "${CIAN}   \t\t\tj) ${GRIS}POCSAG      - ${AMARILLO}$POCSAG"
pocsag=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO POCSAG Enable)
echo "$pocsag"

# 24) Latitude=
echo -n "${CIAN}  24)${GRIS} Coordenada Latitude   - ${AMARILLO}"
lat1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Info Latitude)
echo -n "$lat1"

# k) Jitter=
echo -n "  ${CIAN}     \t\tk) ${GRIS}Jitter      - ${AMARILLO}$Jitter"
ad="DMR Network"          
jitter=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO "${ad}" Jitter)
echo "$jitter"

# 25) Longitude=
echo -n "${CIAN}  25)${GRIS} Coordenada Longitude  - ${AMARILLO}"
long1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Info Longitude)
echo -n "$long1"

# l) FM Enable=
echo -n "${CIAN}     \t\tl) ${GRIS}FM          - ${AMARILLO}$FM"
Enable_fm=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO FM Enable)
echo "$Enable_fm"

# 26) Modulo D-STAR=
echo -n "${CIAN}  26)${GRIS} Modulo D-STAR         - ${AMARILLO}"
modu1=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO D-Star Module)
echo -n "$modu1"

# M) OLED Type=
echo -n "${CIAN}     \t\t\tm) ${GRIS}Tipo OLED   - ${AMARILLO}"
tipo_oled=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO OLED Type)
echo "$tipo_oled"

#27)reflector DMR+=

pas=`grep -n '\<Password\>' $usuario/MMDVMHost/$DIRECTORIO`

echo -n "${CIAN}  27)${GRIS} Entra reflector DMR+  - ${AMARILLO}"
OPCION=`expr substr $pas 1 $largo1`
OPCION=`expr $OPCION + 1`
linea33port=$OPCION
letra=p
linea22port=$OPCION$letra
var300port= sed -n $linea22port  $usuario/MMDVMHost/$DIRECTORIO;

echo ""
echo "${CIAN}  28)${AMARILLO} Abrir fichero $DIRECTORIO para hacer cualquier cambio${AMARILLO}"

echo "${CIAN}  29)\33[1;37m Guardar  fichero de Configuración en M1 ${CIAN}"
echo -n "${CIAN}  30)\33[1;32m Utilizar fichero de Configuración de M1: ${CIAN}"
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/$DIRECTORIO_copia`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 9`
copia1=`expr substr $master $largo 40`
echo -n "$copia1"
memoria1=$(awk "NR==$primer1" $usuario/info_panel_control.ini)
echo " - $memoria1"

echo "${CIAN}  31)\33[1;37m Guardar  fichero de Configuración en M2: ${CIAN}"
echo -n "${CIAN}  32)\33[1;32m Utilizar fichero de Configuración en M2: ${CIAN}"
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/$DIRECTORIO_copia2`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 9`
copia2=`expr substr $master $largo 40`
echo -n "$copia2"
memoria2=$(awk "NR==$segun1" $usuario/info_panel_control.ini)
echo " - $memoria2"

echo "${CIAN}  33)\33[1;37m Guardar  fichero de Configuración en M3: ${CIAN}"
echo -n "${CIAN}  34)\33[1;32m Utilizar fichero de Configuración en M3: ${CIAN}"
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/$DIRECTORIO_copia3`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 9`
copia3=`expr substr $master $largo 40`
echo -n "$copia3"
memoria3=$(awk "NR==$tercer1" $usuario/info_panel_control.ini)
echo " - $memoria3"

echo ""
echo "${CIAN}  35)\33[1;31m Recuperar el fichero original MMDVM.ini${AMARILLO}"

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
                          echo "Valor actual del TXFrequency: $contenido_txf ${VERDE} Enter (Volver sin modificar)${BLANCO}"
                          read -p 'Introduce TXFrequency:        ' txfre
                          if [ $txfre="" ]
                          then
                          actualizar=N
                          else
                          actualizar=S 
                          fi
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
                          echo "Valor de la Ciudad: ${AMARILLO}${contenido_location#*=}\33[1;37m"
                          read -p 'Introduce tu Ciudad ' loc1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$numero_linea_letrac Location=$loc1" $usuario/MMDVMHost/$DIRECTORIO
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
9) echo ""
while true
do
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
sh Puertos_MMDVMPLUS.sh
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
9copia) echo ""
while true
do
                          

port_modem=$(sudo crudini --get $usuario/MMDVMHost/$DIRECTORIO Modem Port)
                          echo "Valor del Port: ${AMARILLO}$port_modem"
                          read -p 'Ej. /dev/ttyAMA1  /dev/ttyACM1  /dev/ttyUSB1  : ' port
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem Port $port
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
10) echo ""
while true
do
                          echo "Valor  actual  del Id: $idd1\33[1;37m"
           	              read -p 'Introduce un ID válido ' miid
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO General Id $miid
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
11) echo ""
while true
do
                      echo "Valor actual del Master: $master1\33[1;37m"
                      read -p 'Brandmeister=master.spain-dmr.es / DMR+=212.237.3.141: ' master1
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
ad="DMR Network"          
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO "${ad}" Address $master1
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
12) echo ""
while true
do
                          echo -n "Valor actual del \33[1;37m$port\33[1;37m"
                          read -p 'Puerto para Brandmeister=62031 puerto para DMR+=55555 : ' miid
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
ad="DMR Network"          
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO "${ad}" Port $miid
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
13) echo ""
while true
do
                          echo "   Valor  actual  del Password: $pasword\33[1;37m"
           	              read -p '   Password para DMR+=PASSWORD: ' pas1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
ad="DMR Network"          
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO "${ad}" Password $pas1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
R) echo ""
while true
do
                          echo "Valor  actual del  RXInvert: $rxinv1\33[1;37m"
           	              read -p 'Valor óptimo para DVMEGA=1 : ' rxinv1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem RXInvert $rxinv1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
14) echo ""
while true
do
                          echo "Valor  actual del  TXInvert: ${AMARILLO}$txinv1\33[1;37m"
           	              read -p 'Valor óptimo para DVMEGA=1 : ' txinv1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem TXInvert $txinv1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
15) echo ""
while true
do
                          echo "Valor  actual  del  RXLevel : $rx1\33[1;37m"
                          read -p 'Valor óptimo (en mi caso) para DVMEGA=45, Low cost EA4AOJ=45, NANO BLAS=60 : ' var2
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem RXLevel $var2
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
16) echo ""
while true
do
                          echo "Valor  actual  del  TXLevel : $tx1\33[1;37m"
           	              read -p 'Valor óptimo=50 : ' vartx
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Modem TXLevel $vartx
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
17) echo ""
while true
do
                          echo "Valor actual del Duplex: $dup1\33[1;37m"
           	              read -p 'Para un repetidor Duplex=1 Para un DVMEGA Duplex=0: ' dup1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO General Duplex $dup1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
18) echo ""
while true
do
                          echo "Valor actual del TXHang: $txh1\33[1;37m"
           	              read -p 'Para un repetidor TXHang=4 Para un DVMEGA TXHang=0: ' txh1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO DMR TXHang $txh1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
19) echo ""
while true
do
                          echo "Valor actual del DisplayLevel: $lg1\33[1;37m"
           	              read -p 'Para visualizar tramas seguidas introduce 1, para una sola trama introduce 2:' lg1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Log DisplayLevel $lg1
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
20) echo ""
while true
do
                          echo "Valor actual del Slot1=: $sl1\33[1;37m"
           	              read -p 'Para DVMEGA Modificar el valor del Slot1=0: ' slot
                          actualizar=S 
                          case $actualizar in                                            
			                    [sS]* ) echo ""
ad="DMR Network"          
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO "${ad}" Slot1 $slot            
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
21) echo ""
while true
do
                          echo "Valor actual del Display=: $Display1\33[1;37m"
                          read -p 'Introduce tipo de Display Ej. Nextion ó OLED: ' Display
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO General Display $Display             
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
22) echo ""
while true
do
                          echo "Valor actual del ScreenLayout=: ${AMARILLO}${ScreenLayout1#*=}\33[1;37m"
                          read -p 'Este parametro debe ser 3: ' V1
                          actualizar=S 
                          case $actualizar in                                            
                          [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Nextion ScreenLayout $V1             
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
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Nextion IdleBrightness $V            
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
                          echo "Valor de la Latitud: $lat1\33[1;37m"
           	              read -p 'Introduce la Latitud ' lat1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
sudo crudini --set $usuario/MMDVMHost/$DIRECTORIO Info Latitude $lat1
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

