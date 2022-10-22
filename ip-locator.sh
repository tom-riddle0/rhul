#!/bin/bash

echo -e "\e[31m.-..---.       .-.                      .-.           \e[0m"
echo -e "\e[31m: :: .; :      : :                     .'  .          \e[0m"
echo -e "\e[31m: ::  _.'_____ : :    .--.  .--.  .--.  . .'.--. .--. \e[0m"
echo -e "\e[31m: :: :  :_____:: :__ ' .; :'  ..'' .; ; : :' .; :: ..'\e[0m"
echo -e "\e[31m:_;:_;         :___.' .__.' .__.' .__,_;:_; .__.':_;  \e[0m"
echo -e "                                                  Coded by \e[35m@I_am_Bash\e[0m"
echo ""

if [ "$1" == "" ]
then
	echo "[+] USAGE: $0 ip-address"
	echo "[+] EXAMPLE: $0 8.8.8.8"
	exit
fi

res=`curl http://ip-api.com/json/$1 -s`

status=$(echo $res | jq '.status' -r)

if [ $status  == "success" ]
then
	country=`echo $res | jq '.country' -r`
	city=`echo $res | jq '.city' -r`
	region=`echo $res | jq '.regionName' -r`
	zip=`echo $res | jq '.zip' -r`
	lat=`echo $res | jq '.lat' -r`
	lon=`echo $res | jq '.lon' -r`
	echo -e "\e[36m[+]\e[0m \e[32mIP\e[0m        : $1"
	echo -e "\e[36m[+]\e[0m \e[32mCountry\e[0m   : $country"
	echo -e "\e[36m[+]\e[0m \e[32mCity\e[0m      : $city"
	echo -e "\e[36m[+]\e[0m \e[32mRegion\e[0m    : $region"
	echo -e "\e[36m[+]\e[0m \e[32mZip\e[0m       : $zip"
	echo -e "\e[36m[+]\e[0m \e[32mLatitude\e[0m  : $lat"
	echo -e "\e[36m[+]\e[0m \e[32mLongitude\e[0m : $lon"
else
	echo "The IP Could not be traced"
	exit
fi
