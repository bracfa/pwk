#!/bin/bash

SNET="$1"
echo "$SNET"
exit 0

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts
COMMENT


#-- HOST DISCOVERY --#

#-LIST SCAN-#
#-list each host in network, without sending packets.
#-nmap still does reverser-DNS to learn their names.
sudo nmap -sL "$SNET" -oA <PATH/FILENAME> # List of possible targets 

#-NO PING-#
#-skips discovery stage. Performs each scan as if each target is up.
#-the default nmap scan uses -PE -PS443 -PA80 -PP
sudo nmap -Pn "$SNET" -oA <PATH/FILENAME>

#-ICMP PING TYPES-#
#-use disabled port scan (-sn). Sends ICMP echo, TCP SYN to port 443, TCP ACK port 80
#-use ICMP requests (-PE, -PP, -PM)
#-still need to decide what type of output file will be used
sudo map -sn -PE "$SNET" -oA <PATH/FILENAME> # ICMP echo
sudo nmap -sn -PP "$SNET" -oA <PATH/FILENAME> # ICMP timestamp
sudo nmap -sn -PM "$SNET" -oA <PATH/FILENAME> # ICMP netmask


#-TCP PING TYPES-#
#-in case ICMP traffic is blocked, and gives a better chance of
#bypassing firewalls

#-TCP SYN probe to port 80 (HTTP) without port scanning.
#-the PS options sends an empty TCP packet with the SYN flag set, the 
#target responds with SYN/ACK TCP if open or RST is closed. If open,
#attack machine sends RST instead of completing 3-way with ACK.
sudo nmap -sn -PS80 "$SNET" -oA <PATH/FILENAME>

# TCP ACK default is port 80
sudo nmap -sn -PA "$SNET" -oA <PATH/FILENAME>

# UDP PING defaults to port 40 and 125
sudo nmap -sn -PU "$SNET" -oA <PATH/FILENAME>

#-IP PROTOCOL PING-#
#-default is to send multiple packets for ICMP (protocol 1), IGMP
#(protocol 2), and IP-in-IP (protocol 4)
sudo nmap -sn -PO "$SNET" -oA <PATH/FILENAME>

# For closed ports, try using the source-port option, eg. (-g 88)







