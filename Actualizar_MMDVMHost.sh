#!/bin/bash

clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

                    # guarda el fichero MMDVMDMRGateway.ini para recuperarlo después de la actualización
                    cp /home/pi/MMDVMHost/MMDVMDMRGateway.ini /home/pi
                    cd /home/pi
                    sudo rm -r /home/pi/MMDVMHost
                    sudo apt-get install build-essential git-core libi2c-dev i2c-tools lm-sensors
                    git clone https://github.com/g4klx/MMDVMHost
                    #cd MMDVMHost
                    #git clone https://github.com/hallard/ArduiPi_OLED
                    #cd ArduiPi_OLED
                    #sudo make clean
                    #sudo make
                                        
                    #git clone https://github.com/ea3eiz/MMDVMHost
                    cd /home/pi/MMDVMHost

                    HOY=$(date +%Y%m%d)
                    FIJA="const char* VERSION = "\"
                    PI="ADER_PI"\"
                    HOY1=$HOY$PI
                    PUNTO=";"   
                    
                    sed -i "22c $FIJA$HOY1$PUNTO" /home/pi/MMDVMHost/Version.h



# cp /home/pi/$SCRIPTS_version/YSFControl.cpp /home/pi/MMDVMHost
# cp /home/pi/$SCRIPTS_version/MMDVMHost.cpp /home/pi/MMDVMHost
# cp /home/pi/$SCRIPTS_version/Conf.cpp /home/pi/MMDVMHost
# cp /home/pi/$SCRIPTS_version/Conf.h /home/pi/MMDVMHost
# cp /home/pi/$SCRIPTS_version/YSFControl.h /home/pi/MMDVMHost


                    make clean
                    make -f Makefile.Pi.OLED

                    #Instala la secion [NextionDriver] en todos los .ini y todas sus memorias
                    cd /home/pi/NextionDriverInstaller
                    sudo ./NextionDriver_ConvertConfig /home/pi/MMDVMHost/MMDVM.ini
                    sleep 2                  
                    
                    # Crea los ejecutables para estas aplicaciones 
                    cd /home/pi/MMDVMHost
                    cp MMDVMHost MMDVMBM
                    cp MMDVMHost MMDVMPLUS
                    cp MMDVMHost MMDVMDSTAR
                    cp MMDVMHost MMDVMFUSION
                    cp MMDVMHost DMR2NXDN
                    cp MMDVMHost DMR2YSF
                    cp MMDVMHost MMDVMNXDN
                    cp MMDVMHost MMDVMESPECIAL
                    cp MMDVMHost MMDVMDMRGATEWAY                 
                    
                    # Crea el fichero para que arranque NextionDriver ==================
                    cp MMDVM.ini MMDVM.ini_NextionDriver

                    # Crea los ficheros .ini y Memorias ==================
                    cp MMDVM.ini MMDVM.ini_original
                    cp MMDVM.ini MMDVM.ini_copia
                    cp MMDVM.ini MMDVM.ini_copia2
                    cp MMDVM.ini MMDVM.ini_copia3

                    cp MMDVM.ini MMDVMBM.ini
                    cp MMDVM.ini MMDVMBM.ini_copia
                    cp MMDVM.ini MMDVMBM.ini_copia2
                    cp MMDVM.ini MMDVMBM.ini_copia3

                    cp MMDVM.ini MMDVMPLUS.ini
                    cp MMDVM.ini MMDVMPLUS.ini_copia
                    cp MMDVM.ini MMDVMPLUS.ini_copia2
                    cp MMDVM.ini MMDVMPLUS.ini_copia3

                    cp MMDVM.ini MMDVMDSTAR.ini
                    cp MMDVM.ini MMDVMDSTAR.ini_copia
                    cp MMDVM.ini MMDVMDSTAR.ini_copia2
                    cp MMDVM.ini MMDVMDSTAR.ini_copia3

                    cp MMDVM.ini MMDVMFUSION.ini
                    cp MMDVM.ini MMDVMFUSION.ini_copia
                    cp MMDVM.ini MMDVMFUSION.ini_copia2
                    cp MMDVM.ini MMDVMFUSION.ini_copia3  

                    cp MMDVM.ini MMDVMESPECIAL.ini
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia2
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia3                

                    cp MMDVM.ini TODOS_LOS_INIS.ini

                    cp MMDVM.ini MMDVMDMR2YSF.ini
                    
                    cp MMDVM.ini MMDVMDMR2NXDN.ini

                    cp MMDVM.ini MMDVMNXDN.ini

                    # recoge el fichero MMDVMDMRGateway.ini para ponerlo en el MMDVMHost
                    cp /home/pi/MMDVMDMRGateway.ini /home/pi/MMDVMHost

                    #=================================================

                    sudo chmod 777 -R /home/pi/MMDVMHost
                    exit;
