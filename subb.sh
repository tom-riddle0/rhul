#!/bin/bash

echo -e "\e[1;96m    _________         ___.     ___.     \e[0m"
echo -e "\e[1;96m   /   _____/  __ __  \_ |__   \_ |__   \e[0m"
echo -e "\e[1;96m   \_____  \  |  |  \  | __ \   | __ \  \e[0m"
echo -e "\e[1;96m   /        \ |  |  /  | \_\ \  | \_\ \ \e[0m"
echo -e "\e[1;96m  /_______  / |____/   |___  /  |___  / \e[0m"
echo -e "\e[1;96m          \/               \/       \/  \e[0m"
echo ""

if [ "$1" == "" ] || [ "$1" == "-h" ]
then
	echo -e "\e[1;92m[+]\e[0m \e[1;93mUSAGE\e[0m : $0 domain_file_name"
	exit
fi

#Basic Amass
amass enum -df $1 | tee subdomains

number=`wc -l subdomains`

echo -e "\e[1;92m[+]\e[0m \e[1;93mAmass Basic Scan\e[0m   : DONE!!! \e[1;36m$number Subdomains Discovered\e[0m"

#Passive Amass
amass enum -passive -df $1 | anew subdomains

number=`wc -l subdomains`

echo -e "\e[1;92m[+]\e[0m \e[1;93mAmass Passive Scan\e[0m : DONE!!! \e[1;36m$number Subdomains Discovered\e[0m"

#Active Amass
amass enum -active -df $1 | anew subdomains

number=`wc -l subdomains`

echo -e "\e[1;92m[+]\e[0m \e[1;93mAmass Active Scan\e[0m  : DONE!!! \e[1;36m$number Subdomains Discovered\e[0m"

#Subfinder
subfinder -dL $1 -silent -all | anew subdomains

number=`wc -l subdomains`

echo -e "\e[1;92m[+]\e[0m \e[1;93mSubfinder Scan\e[0m     : DONE!!! \e[1;36m$number Subdomains Discovered\e[0m"

#Assetfinder
cat $1 | assetfinder -subs-only | anew subdomains

number=`wc -l subdomains`

echo -e "\e[1;92m[+]\e[0m \e[1;93mAssetfinder Scan\e[0m   : DONE!!! \e[1;36m$number Subdomains Discovered\e[0m"

#Httpx
httpx -l subdomains -sc -title -td -ip -location -silent -p 80,443,8443,9001,9002,9003,7001,7002,445,81,20-25 | tee livedomains

echo -e "\e[1;92m[+]\e[0m \e[1;93mHttpx Scan\e[0m         : DONE!!! \e[1;92mLive Subdomain Scan Complete\e[0m"

