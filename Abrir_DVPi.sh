#!/bin/bash
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

# cd /home/pi/Desktop
# sudo cp Abrir_MMDVMPLUS.desktop /home/pi
# sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "10c Name[es_ES]=Cerrar DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "6c MMDVMPLUS=ON" /home/pi/status.ini
# cd /home/pi
# sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
# sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

cd $usuario/dvpi/
mono dvpi
echo "\33[1;37m"
# echo " ******************************************************************************"
# echo " ****************************    ABRIENDO DVPi    *****************************"
# echo " ******************************************************************************"
# sleep 2
# sudo ./MMDVMPLUS MMDVMPLUS.ini

# cd /home/pi/Desktop
# sudo cp Abrir_MMDVMPLUS.desktop /home/pi
# sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x12 -e sudo sh ejecutar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_OFF.png" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "10c Name[es_ES]=Abrir DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
# sudo sed -i "6c MMDVMPLUS=OFF" /home/pi/status.ini
# cd /home/pi
# sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
# sleep 1
# sudo rm /home/pi/Abrir_MMDVMPLUS.desktop
