#!/bin/bash
killall MMDVMPLUS
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
echo "vesion$SCRIPTS_version"

cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /$usuario
sed -i "4c Exec=sh -c 'cd $usuario/$SCRIPTS_version;lxterminal --geometry=80x12 -e sudo sh Abrir_DMRPLUS.sh'" $usuario/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=$usuario/$SCRIPTS_version/ICONO_DMRPLUS_OFF.png" $usuario/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=Abrir DMR+" $usuario/Abrir_MMDVMPLUS.desktop
#sed -i "6c MMDVMPLUS=OFF" $usuario/status.ini

cd $usuario
sudo cp Abrir_MMDVMPLUS.desktop $usuario/Desktop

sudo rm $usuario/Abrir_MMDVMPLUS.desktop


