#!/bin/bash

echo -e "\e[95m __  ____    ____  __  __ _  ____  ____  ____  \e[0m"
echo -e "\e[95m(  )(  _ \  (  __)(  )(  ( \(    \(  __)(  _ \ \e[0m"
echo -e "\e[95m )(  ) __/   ) _)  )( /    / ) D ( ) _)  )   / \e[0m"
echo -e "\e[95m(__)(__)    (__)  (__)\_)__)(____/(____)(__\_) \e[0m"
echo ""

if [ "$1" == "" ]
then
	echo -e "\e[96m{+}\e[0m \e[36mUSAGE:\e[0m"
	echo -e ""
	echo -e "\e[93m$0 hackerone.com(Website Name)\e[0m"
	exit
fi




first=`censys search "services.tls.certificates.leaf_data.names: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
second=`censys search "services.tls.certificates.leaf_data.issuer.common_name: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
third=`censys search "dns.names: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
fourth=`censys search "dns.reverse_dns.names: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
fifth=`censys search "services.tls.certificates.leaf_data.subject.common_name: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
#--virtual-hosts INCLUDE
sixth=`censys search "services.tls.certificates.leaf_data.names: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
seventh=`censys search "services.tls.certificates.leaf_data.issuer.common_name: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
eight=`censys search "dns.names: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
ninth=`censys search "dns.reverse_dns.names: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
tenth=`censys search "services.tls.certificates.leaf_data.subject.common_name: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`



echo -e "\e[96m{+}\e[0m \e[36mFirst Dork:\e[0m"
echo $first
echo -e "\e[96m{+}\e[0m \e[36mSecond Dork:\e[0m"
echo $second
echo -e "\e[96m{+}\e[0m \e[36mThird Dork:\e[0m"
echo $third
echo -e "\e[96m{+}\e[0m \e[36mFourth Dork:\e[0m"
echo $fourth
echo -e "\e[96m{+}\e[0m \e[36mFifth Dork:\e[0m"
echo $fifth
echo -e "\e[96m{+}\e[0m \e[36mSixth Dork:\e[0m"
echo $sixth
echo -e "\e[96m{+}\e[0m \e[36mSeventh Dork:\e[0m"
echo $seventh
echo -e "\e[96m{+}\e[0m \e[36mEightd Dork:\e[0m"
echo $eight
echo -e "\e[96m{+}\e[0m \e[36mNinth Dork:\e[0m"
echo $ninth
echo -e "\e[96m{+}\e[0m \e[36mTenth Dork:\e[0m"
echo $tenth
