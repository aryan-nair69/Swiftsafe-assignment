#!/bin/bash
echo -n "INSTALLING  MAIN  FILES  .........."
if ! dpkg-query -W -f='${Status}' figlet  | grep "ok installed"; then apt install figlet; fi 
echo -n  "Install Postfix ........ "
if ! dpkg-query -W -f='${Status}' postfix | grep "ok installed" ; then apt install postfix; fi
echo -n "Install Rustscan ......."
sudo chmod +x  rustscan.deb
sudo dpkg -i rustscan.deb &>/dev/null
if  dpkg-query -W -f='${Status}' rustscan |grep "ok installed"; then echo -n "install completed";fi
  
                                                                                                          
