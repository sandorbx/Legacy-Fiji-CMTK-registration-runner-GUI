# Fiji-CMTK-registration-runner-GUI
Simple crossplatform Fiji-Imagej macro GUI to run CMTK-Munger image registration (https://www.nitrc.org/projects/cmtk/) . You can pass arguments to the script interactively, several registration instances can be started up after each other. 
The script will run on any generic pc from the last ten years I even tested it on a 8 year old thinkpad with acceptable performance. Works on Debian/Ubuntu, Windows 10 with WSL  and macOS

## Main features:

- Cross platform, tested on macOS Catalina, Windows 10 WSL and Ubuntu  20.04

-Setup is fully automated and guided, Fiji, CMTK and the registration GUI works out of the box 

-The right registration library structure is generated automatically, no need of copying around files

-All parameters can be set interactively, you don't have to worry about syntax

-The script calls CMTK-Munger registration through the native shell so it runs automatically after clicking ok

-You can spawn several different registration jobs quickly, just open the macro gui again, set, click and repeat

-Generates a log file with the commands an parameters

-The script is very simple just under 100 lines and written in Imagej script language, easy to understand and modify, especially adding imagej functions

## Linux install

1. Install is fully automated (including CMTK and fiji),  if you don’t have Fiji, the installer will set one up for you. Simply run the  "linux_install.sh" bash file

2. If you are unsure in any way simply type/paste these two commands into a newly opened terminal

  `git clone https://github.com/sandorbx/Fiji-CMTK-registration-runner-GUI.git`

  `bash ~/Fiji-CMTK-registration-runner-GUI.git/linux_install.sh`

3. If you need test data download this : https://www.dropbox.com/sh/n866kvoakscig4i/AAB-m1WzqgpkEwk5PV5vMbzEa?dl=0

4. In Fiji you can launch the registration GUI from the menu:  plugins>macros>Fiji CMTK registration runner GUI

## User Guide:

• for cmtk library with munger browse for the location in your fiji folder Fiji.app/lib/cmtk

• your data, refbrain and working directory can be wherever on your windows drives, you can browse for them from the gui, they will be in /mnt , (for example to go to your windows desktop folder /mnt/c/users/username/desktop)

• make sure that none of the file or directory names containing spaces

• registration directory with the right structure will be generated automatically and the script copies there your images to register so don’t forget to clean up later.

• almost everything is automatic the only prequisite that your image to register has to be contained in a separate folder  and named by adding a number indicating the channel in the end of the filename separated by and underscore (yourpicturename_01;yourpicturename_02 and so on)

• You can choose whether the script should clean up after itself and just keep the reformatted images with the log. Be mindful when you specify the paths to files and         folders(refbrain, reg dir, images)

• Set your parameters, if you click ok the registration script starts and the GUI will close, Fiji will display a log in the end that could take a while , in case you want to follow the progress open a task manager program.

## Windows install:

1. Install linux subsystem for Windows as follows:

2. click into the windows search bar next to the startmenu icon, type powershell,  select and start powershell with admin privileges.

3. Use the following command in powershell:  `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

4. Reboot pc when promted

5. install latest ubuntu 20.04 lts  from the microsoft store then run ubuntu. Set your username and password. Type/paste in and run these commands to set up your environment:

  `sudo apt update`

  `sudo apt upgrade`

  `sudo apt install git`
  
  `git clone https://github.com/sandorbx/Fiji-CMTK-registration-runner-GUI.git`
  
  `bash ~/Fiji-CMTK-registration-runner-GUI/wslwin10_install.sh`


6. Close ubuntu terminal,  you need an xterminal emulator to run GUI in the linux subsystem. Download and install mobaxterm home installer edition :                          https://mobaxterm.mobatek.net/download-home-edition.html

7. Start mobaxterm, if prompted allow it in windows defender

8. From now work in mobaxterm, you can already start your WSL Ubuntu session by double clicking it on the left side under user sessions

9. Enter pcmanfm in the terminal to start a graphical file manager, you can manipulate files here and start fiji and other apps graphically, your windows drives are in /mnt ,      you can reach it going up the directory structure and in the base look for mnt

10. start a wsl session in mobaxterm, run pcmanfm to start the file manager and with that start fiji, give permission to execute if asked. In fiji launch the registration GUI      through the plugins>macros menu

11. Alternatively you can always start fiji graphically in mobaxterm wsl terminal with the following command  `~/Fiji.app/ImageJ-linux64` , you just have to type/paste it in the first time after that just push up arrow in the terminal find it in the command history




