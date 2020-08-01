#!/bin/sh
sudo apt update
sudo apt upgrade -y
sudo apt install cmtk -y
sudo apt install unzip -y
sudo apt install git -y
mkdir ~/regrunnertemp
cd ~/regrunnertemp
wget "https://downloads.imagej.net/fiji/latest/fiji-linux64.zip"
unzip fiji-linux64.zip -d ~/
git clone https://github.com/sandorbx/Fiji-CMTK-registration-runner-GUI.git
sudo chmod -R a+rwx ~/regrunnertemp/Fiji-CMTK-registration-runner-GUI/
cp ~/regrunnertemp/Fiji-CMTK-registration-runner-GUI/Fiji_CMTK_registration_runner.ijm ~/Fiji.app/plugins/Macros
cp -r ~/regrunnertemp/Fiji-CMTK-registration-runner-GUI/cmtk_munger_wsl_linux ~/Fiji.app/lib/
sudo chmod -R a+rwx ~/Fiji.app/lib/cmtk_munger_wsl_linux
rm -rf ~/regrunnertemp
~/Fiji.app/ImageJ-linux64
