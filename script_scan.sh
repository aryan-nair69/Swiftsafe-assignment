#!/bin/bash

# Print the project title
figlet swift-safe
echo -e  "\\033[31mPROJECT MADE BY TEAM 1 \\033[0m"



# Check if an IP address is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <IP>"
    exit 1
fi
# Prompt for email
read -p "Enter your email where you need to be alerted: " smail

# Output file for results
RESULTS_FILE="results.txt"

# Initialize the results file
printf "\n----- Rustscan -----\n\n" > $RESULTS_FILE

# RustScan .deb file
RUSTSCAN_DEB_FILE='rustscan.deb'

# Check if RustScan .deb file exists
if [ ! -f "$RUSTSCAN_DEB_FILE" ]; then
    echo "RustScan .deb file not found: $RUSTSCAN_DEB_FILE"
    exit 1
fi

# Define the target IP address
TARGET=$1

# Run RustScan
echo "Running RustScan on target: $TARGET"
rustscan -a $TARGET >> $RESULTS_FILE

# Check if port 80 is open in the results
if grep -q "80/tcp" $RESULTS_FILE; then
    echo "Port 80 found open. Running Feroxbuster..."

    # Prompt for wordlist
    read -p "Enter wordlist: " wordlist
    figlet SCAN
    echo -e "\\033[31mIt will take some time, please wait.\\033[0m"

    # Run Feroxbuster
    ./feroxbuster -u "$TARGET" -n -t 10 -L 5 -w "$wordlist" --silent > temp1

    # Append Feroxbuster results to the main results file
    if [ -e temp1 ]; then
        printf "\n----- DIRS -----\n\n" >> '$RESULTS_FILE'
        cat temp1 >> '$RESULTS_FILE'
        rm temp1
    fi
fi

# Display results
echo -e "Result is saved in Result.txt"

# Send email with the results
sendemail -xu support@cyberely.me -xp YnaIT4PjN2DGZrLf -s smtp-relay.brevo.com:587 -f "alert-scan@googlexyz.in" -t "$smail" -u "REPORT IS READY" -m "HELLO TEAM, SCAN IS COMPLETE" -a $RESULTS_FILE &> /dev/null

# Confirm email sent
echo "MAIL SENT"