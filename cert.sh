#!/bin/bash

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'

if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]
then
        echo -e "$OKRED            _         _     $RESET"
        echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
        echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
        echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
        echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
        echo ""
        echo -e "$OKRED [+] by @IamBash$RESET"
        echo -e "$OKRED [-] Usage: cert.sh PayPal$RESET"
        exit
fi

json=$(curl -s https://crt.sh/\?q\=$1\&output\=json)

echo $json | jq -r '.[].common_name' | sort -u 

