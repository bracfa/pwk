#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts
COMMENT

# The IP address
IP="$1"
# Attack machine password
PASS="$pass"
# Output file directory
OFD="/home/kali/gitWorkspace/pwk/outputFiles/active_gathering/"


#-- PORT SCANNING FOR SINGLE TARGET --#

#-TCP/UDP SCANNING with NETCAT-#
# TCP scanning
nc -nvv -w 1 -z "$IP" 1-65535 > "nc_nvv_w_1_z__""$IP"".txt" 2>&1
# UDP scanning
nc -nv -u -z -w 1 "$IP" 1-65535 > "nc_nv_u_z_w_1__""$IP"".txt" 2>&1

#-PORT SCANNING with NMAP-#
# Stealth / SYN Scanning
#-this is the default scan technique when no scan technique is specified
#echo "$PASS" | sudo -S nmap -sS -p- "$IP" -oA "$OFD""nmap_sS_p__$IP"
# TCP Connect Scanning
echo "$PASS" | sudo -S nmap -sT -p- "$IP" -oA "$OFD""nmap_sT_p__$IP"
# UDP Scanning
#echo "$PASS" | sudo -S nmap -sU -p- "$IP" -oA "$OFD""nmap_sU_p__$IP"
# UDP Scanning with TCP Stealth Scanning
echo "$PASS" | sudo -S nmap -sS -sU -p- "$IP" -oA "$OFD""nmap_sS sU_p__$IP"
# Top 20 TCP ports
echo "$PASS" | sudo -S nmap -sT -A --top-ports=20 "$IP" -oA "$OFD""nmap_sT A_topPorts__$IP"
# OS Fingerprinting 
echo "$PASS" | sudo -S nmap -O "$IP" -oA "$OFD""nmap_O__$IP"
# Banner Grabbing / Service Enumeration
echo "$PASS" | sudo -S nmap -sV -sT -A "$IP" -oA "$OFD""nmap_sV_sT_A__$IP"

# Should we put Nmap Scripting Engine (NSE)


