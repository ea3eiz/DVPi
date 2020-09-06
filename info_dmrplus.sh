#!/bin/bash

DIRECTORIO="MMDVMPLUS.ini"
#linea_info_memoria="313" #Linea del MMDVM donde guardamos el nombre de la memoria

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/$DIRECTORIO`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/$DIRECTORIO)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto

rxfrecuencia=$(awk "NR==13" /home/pi/MMDVMHost/$DIRECTORIO)
rxfrecuencia=`expr substr $rxfrecuencia 13 17`
rxfrecuencia=$rxfrecuencia

txfrecuencia=$(awk "NR==14" /home/pi/MMDVMHost/$DIRECTORIO)
txfrecuencia=`expr substr $txfrecuencia 13 17`
txfrecuencia=$txfrecuencia

id=$(awk "NR==3" /home/pi/MMDVMHost/$DIRECTORIO)
id=`expr substr $id 4 9`
id=$id

indicativo=$(awk "NR==2" /home/pi/MMDVMHost/$DIRECTORIO)
indicativo=`expr substr $indicativo 10 8`
indicativo=$indicativo

address=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/$DIRECTORIO`
buscar=":"
caracteres=`expr index $address $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_address=`expr substr $address 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_address" /home/pi/MMDVMHost/$DIRECTORIO)
address=`expr substr $address 13 35`
address="  "$address

memoria=$(awk "NR==4" /home/pi/info_memorias)

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${BLANCO}"
echo "  INFORMACIÓN (DMR+)"
echo -n "${VERDE}"
echo "  ******************************************"
echo "${CIAN}  Indicativo:   ${AMARILLO}$indicativo   "
echo "${CIAN}  Id:           ${AMARILLO}$id   "
echo "${CIAN}  RXFrecuencia: ${AMARILLO}$rxfrecuencia   "
echo "${CIAN}  TXFrecuencia: ${AMARILLO}$txfrecuencia   "
echo "${CIAN}  Puerto:     ${AMARILLO}$puerto   "
echo "${CIAN}  Servidor:   ${AMARILLO}$address   "
echo "${CIAN}  Memoria:      ${AMARILLO}$memoria   "
echo -n "${VERDE}"
echo "  ******************************************"

echo -n "${CIAN}  Pulsa enter para cerrar esta ventana "
read a

# echo -n "${MARRON}"
# echo -n "  Se cerrará en 10."
# sleep 1
# echo -n "9."
# sleep 1
# echo -n "8."
# sleep 1
# echo -n "7."
# sleep 1
# echo -n "6."
# sleep 1
# echo -n "5."
# sleep 1
# echo -n "4."
# sleep 1
# echo -n "3."
# sleep 1
# echo -n "2."
# sleep 1
# echo -n "1."
# sleep 1
# echo -n "0"
# sleep 1