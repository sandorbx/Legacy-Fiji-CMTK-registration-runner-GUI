#!/bin/sh
sudo apt update
sudo apt upgrade -y
sudo apt install cmtk -y
sudo apt install pcmanfm -y
sudo apt install mousepad -y
sudo apt install unzip -y
cd ~/
wget "https://downloads.imagej.net/fiji/latest/fiji-linux64.zip"
unzip fiji-linux64.zip
git clone https://github.com/sandorbx/Fiji-CMTK-registration-runner-GUI.git
sudo chmod -R a+rwx ~/Fiji-CMTK-registration-runner-GUI/
cp ~/Fiji-CMTK-registration-runner-GUI/Fiji_CMTK_registration_runner.ijm ~/Fiji.app/plugins/Macros
cp -r ~/Fiji-CMTK-registration-runner-GUI/cmtk_munger_wsl_linux ~/Fiji.app/lib/
sudo chmod -R a+rwx ~/Fiji.app/lib/cmtk_munger_wsl_linux
rm -r ~/Fiji-CMTK-registration-runner-GUI/
rm -r ~/fiji-linux64.zip
~/Fiji.app/ImageJ-linux64
