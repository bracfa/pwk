#!/bin/bash

# HOST_LST="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"
HOST_LST="/usr/share/seclists/Discovery/DNS/namelist.txt"
#HOST_LST="list.txt"
IPS="ips.txt"
SORTED="sorted.txt"

for ip in $(cat "$HOST_LST")
do 
  host $ip.megacorpone.com | grep -v "not found" | awk -F" " '{ print $NF }' >> "$IPS"
done

cat "$IPS" | sort | uniq > "$SORTED"
cat "$SORTED"
