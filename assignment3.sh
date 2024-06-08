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
                #add feroxbuster command > temp1
		#you can also add a variable to specify the word list
    
        
done < results

if [ -e temp1 ]
then
        printf "\n----- DIRS -----\n\n" >> results
        cat temp1 >> results
        rm temp1
fi



cat results
