#!/bin/bash
echo -n "INSTALLING  MAIN  FILES  .........."
if ! dpkg-query -W -f='${Status}' figlet  | grep "ok installed"; then apt install figlet; fi 
echo -n  "Install Postfix ........ "
if ! dpkg-query -W -f='${Status}' postfix | grep "ok installed" ; then apt install postfix; fi
echo -n "Installing Nikto......"
if ! dpkg-query -W -f='${Status}' sendemail | grep "ok installed" ; then apt install -y sendemail; fi
echo -n "Install Rustscan ......."
sudo chmod +x  rustscan.deb
sudo dpkg -i rustscan.deb &>/dev/null
if  dpkg-query -W -f='${Status}' rustscan |grep "ok installed"; then echo -n "install completed  " ;fi
echo -n "Install Feroxbuster it will take some time ........"
if ! dpkg-query -W -f='${Status}' feroxbuster | grep "ok installed";then sudo apt install -y feroxbuster &> /dev/null ;fi
echo -e  "Thank you , Everything is installed Now , go to run.sh \n\n"
chmod 777 feroxbuster
figlet  DONE
echo -e  "\\033[31mTEAM 1 PROJECT SWIFT SAFE \\033[0m"
sleep 2s

