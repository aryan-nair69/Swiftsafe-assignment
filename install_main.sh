#!/bin/bash
echo -n "INSTALLING  MAIN  FILES  .........."
if ! dpkg-query -W -f='${Status}' figlet  | grep "ok installed"; then apt install figlet; fi 
echo -n  "Install other files..... "
if ! dpkg-query -W -f='${Status}' postfix | grep "ok installed" ; then apt install postfix; fi
