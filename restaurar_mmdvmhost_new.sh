#!/bin/bash
clear
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
echo "${VERDE}"
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "                            Restaurando MMDVMHost                         "
echo "   *                                                                      *"
echo "   ************************************************************************"
                                sudo rm -R /home/pi/MMDVMHost
                                cp -r -a /home/pi/.local/MMDVMHost /home/pi/
                                sudo chmod 777 -R /home/pi/MMDVMHost
                                sleep 3
                                exit;
