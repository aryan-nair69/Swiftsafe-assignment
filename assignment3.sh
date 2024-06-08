#!/bin/bash
figlet swift-safe
echo -e  "\\033[31mPROJECT MADE BY TEAM 1 \\033[0m"

read -p  "Enter your email where you need to be alert ?  "  smail

if [ -z "$1" ]
then
        echo "Usage: ./assignment3.sh <IP>"
        exit 1
fi

printf "\n----- Rustscan -----\n\n" > results

echo "Running Rustscan..."
#add your rustscan command >> results
#take the $1 variable for the ip addr

while read line
do
        if [[ $line == 80 ]]
        then
                echo "Running Feroxbuster..."
                read -p "Enter wordlist ...." wordlist
                #./feroxbuster -u <provide ip>  -n -t 10 -L5 -w $wordlist -o temp1.txt &>/dev/null
                #santize feroxbuster report clear localh0ste addon
                cat temp1.txt | tr -s "  " | cut -d " " -f 6 > results		    
        
done < results

if [ -e temp1 ]
then
        printf "\n----- DIRS -----\n\n" >> results
        cat temp1 >> results
        rm temp1
fi



cat results
sendemail -xu support@cyberely.me -xp YnaIT4PjN2DGZrLf -s smtp-relay.brevo.com:587 -f  "alert-scan@googlexyz.in" -t "$smail" -u "REPORT IS READY " -m "HELLO TEAM SCAN IS COMPLETE" &> /dev/null
echo "MAIL SENT  "
