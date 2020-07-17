#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts
COMMENT

# The IP and Mask subnet command line argument
SNET="$1"
# Attack machine password
PASS="$pass"
# Output file directory
OFD="/home/kali/gitWorkspace/pwk/outputFiles/hosts/"
# IP address without mask
IP=$(echo "$SNET" | awk -F "/" '{print $1}')
# IP Mask value
MSK=$(echo "$SNET" | awk -F "/" '{print $2}')
# How to represent the IP address and submask in filename
IP_FN="$IP""m""$MSK"
#-- HOST DISCOVERY --#

#-LIST SCAN-#
#-list each host in network, without sending packets.
#-nmap still does reverser-DNS to learn their names.
#sudo nmap -sL "$SNET" -oA <PATH/FILENAME> # List of possible targets 
echo "$PASS" | sudo -S nmap -sL "$SNET" -oA "$OFD""nmap_sL__$IP_FN"

#-DEFAULT SCAN-#
echo "$PASS" | sudo -S nmap "$SNET" -oA "$OFD""nmap__$IP_FN"


#-NO PING-#
#-skips discovery stage. Performs each scan as if each target is up.
#-the default nmap scan uses -PE -PS443 -PA80 -PP
echo "$PASS" | sudo -S nmap -Pn "$SNET" -oA "$OFD""nmap_Pn__$IP_FN"

#-ICMP PING TYPES-#
#-use disabled port scan (-sn). Sends ICMP echo, TCP SYN to port 443, TCP ACK port 80
#-use ICMP requests (-PE, -PP, -PM)
#-still need to decide what type of output file will be used
echo "$PASS" | sudo -S nmap -sn -PE "$SNET" -oA "$OFD""nmap_sn_PE__$IP_FN" # ICMP echo
echo "$PASS" | sudo -S nmap -sn -PP "$SNET" -oA "$OFD""nmap_sn_PP__$IP_FN" # ICMP timestamp
echo "$PASS" | sudo -S nmap -sn -PM "$SNET" -oA "$OFD""nmap_sn_PM__$IP_FN" # ICMP netmask


#-TCP PING TYPES-#
#-in case ICMP traffic is blocked, and gives a better chance of
#bypassing firewalls

#-TCP SYN probe to port 80 (HTTP) without port scanning.
#-the PS options sends an empty TCP packet with the SYN flag set, the 
#target responds with SYN/ACK TCP if open or RST is closed. If open,
#attack machine sends RST instead of completing 3-way with ACK.
echo "$PASS" | sudo -S nmap -sn -PS80 "$SNET" -oA "$OFD""nmap_sn_PS80__$IP_FN"

# TCP ACK default is port 80
echo "$PASS" | sudo -S nmap -sn -PA "$SNET" -oA "$OFD""nmap_sn_PA__$IP_FN"

# UDP PING defaults to port 40 and 125
echo "$PASS" | sudo -S nmap -sn -PU "$SNET" -oA "$OFD""nmap_sn_PU__$IP_FN"

#-IP PROTOCOL PING-#
#-default is to send multiple packets for ICMP (protocol 1), IGMP
#(protocol 2), and IP-in-IP (protocol 4)
echo "$PASS" | sudo -S nmap -sn -PO "$SNET" -oA "$OFD""nmap_sn_PO__$IP_FN"

# For closed ports, try using the source-port option, eg. (-g 88)
