#!/bin/bash
figlet swift-safe
echo -e  "\\033[31mPROJECT MADE BY TEAM 1 \\033[0m"

read -p  "ENTER MAIL TO SEND  "  smail
sendemail -xu support@cyberely.me -xp YnaIT4PjN2DGZrLf -s smtp-relay.brevo.com:587 -f  "alert-scan@googlexyz.in" -t "$smail" -u "REPORT IS READY " -m "HELLO TEAM SCAN IS COMPLETE" &> /dev/null
echo "MAIL SENT  "

