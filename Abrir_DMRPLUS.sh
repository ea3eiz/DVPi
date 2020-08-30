#!/bin/bash

# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

mode=`grep -n -m 1 "^Port=" $usuario/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" $usuario/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd $usuario/Desktop
sudo cp RXF_DMRPLUS.desktop $usuario
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop

sudo cp $usuario/RXF_DMRPLUS.desktop $usuario/Desktop

sudo rm $usuario/RXF_DMRPLUS.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF  
sed -i "2c $frecuencia" $usuario/INFO_RXF


cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop $usuario
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh Cerrar_DMRPLUS.sh'" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_ON.png" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "10c Name[es_ES]=Cerrar DMR+" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "6c MMDVMPLUS=ON" $usuario/status.ini
cd $usuario
sudo cp Abrir_MMDVMPLUS.desktop $usuario/Desktop

sudo rm $usuario/Abrir_MMDVMPLUS.desktop

cd $usuario/MMDVMHost
echo "\33[1;37m"
echo " ******************************************************************************"
echo " ****************************    ABRIENDO DMR+    *****************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMPLUS MMDVMPLUS.ini

cd $usuario/Desktop
sudo cp Abrir_MMDVMPLUS.desktop $usuario
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x12 -e sudo sh Abrir_DMRPLUS.sh'" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "5c Icon=$usuario/$SCRIPTS_version/ICONO_DMRPLUS_OFF.png" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "10c Name[es_ES]=Abrir DMR+" $usuario/Abrir_MMDVMPLUS.desktop
sudo sed -i "6c MMDVMPLUS=OFF" $usuario/status.ini
cd $usuario
sudo cp Abrir_MMDVMPLUS.desktop $usuario/Desktop
sleep 1
sudo rm $usuario/Abrir_MMDVMPLUS.desktop
