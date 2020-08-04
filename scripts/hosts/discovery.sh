#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts
COMMENT

# Excluded targets fileEXCLUDED="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/exclude-hosts"
XH="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/exclude-hosts"
SM="$1"
# Attack machine password
PASS="$pass"
# Output file directory
OFD="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/"
# Subnet address without mask
SNET=$(echo "$SM" | awk -F "/" '{print $1}')
# IP Mask value
MSK=$(echo "$SM" | awk -F "/" '{print $2}')
# How to represent the Subnet address and Mask in filename
SNET_FN="$SNET""m""$MSK"


#-- HOST DISCOVERY --#

#-LIST SCAN-#
#-list each host in network, without sending packets.
#-nmap still does reverse-DNS to learn their names.
echo "$PASS" | sudo -S nmap -sL "$SM" -oA "$OFD""nmap_sL__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sL__$SNET_FN".txt 2>&1
echo "Completed: list scan"

#-NETWORK SWEEP-#
#-ping scan with disabled port scanning with dns brute force
echo "$PASS" | sudo -S nmap -sn --script dns-brute "$SM" -oA "$OFD""nmap_sn_dnsbrute__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sn_dnsbrute__$SNET_FN".txt 2>&1
echo "Completed: ping scan with disabled port scanning with dns brute force"

#-broadcast ping with disabled port scanning
echo "$PASS" | sudo -S nmap -sn --script broadcast-ping "$SM" -oA "$OFD""nmap_sn_broadcastping__$SNET_FN" > "$OFD""nmap_sn_broadcastping__$SNET_FN".txt 2>&1
echo "Completed: broadcast ping with disabled port scanning"

# Resolve each host name
#cat test.gnmap | grep -v Status | awk -F' ' '{ print $2 }' | grep -v Nmap

#-DEFAULT SCAN-#
#-the default nmap scan for port 80 only
echo "$PASS" | sudo -S nmap -p 80 "$SM" -oA "$OFD""nmap_p_80__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_p_80__$SNET_FN".txt 2>&1 
echo "Completed: default nmap scan for port 80 only"
#-the default nmap scan uses -PE 443 -PA80 -PP
echo "$PASS" | sudo -S nmap "$SM" -oA "$OFD""nmap__$SNET_FN" --excludefile "$XH" > "$OFD""nmap__$SNET_FN".txt 2>&1
echo "Completed: default nmap scan uses -PE 443 -PA80 -PP"

#-SCAN TOP TCP PORTS-#
#-this uses a TCP connect scan for top 20 TCP ports
echo "$PASS" | sudo -S nmap -sT -A --top-ports=20 "$SM" -oA "$OFD""nmap_sT_A_topPorts20__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sT_A_topPorts20__$SNET_FN".txt 2>&1
echo "Completed: TCP connect scan for top 20 TCP ports"

#-NO PING-#
#-skips discovery stage. Performs each scan as if each target is up.
echo "$PASS" | sudo -S nmap -Pn "$SM" -oA "$OFD""nmap_Pn__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_Pn__$SNET_FN".txt 2>&1
echo "Completed: skips discovery stage. Performs each scan as if each target is up"

#-ICMP PING TYPES-#
#-use disabled port scan (-sn). Sends ICMP echo, TCP SYN to port 443, TCP ACK port 80
#-use ICMP requests (-PE, -PP, -PM)
#-still need to decide what type of output file will be used
# ICMP echo
echo "$PASS" | sudo -S nmap -sP -PE "$SM" -oA "$OFD""nmap_sP_PE__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_PE__$SNET_FN".txt 2>&1
echo "Completed: ICMP echo"
# ICMP timestamp
echo "$PASS" | sudo -S nmap -sP -PP "$SM" -oA "$OFD""nmap_sP_PP__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_PP__$SNET_FN".txt 2>&1
echo "Completed: ICMP timestamp"
# ICMP netmask
echo "$PASS" | sudo -S nmap -sP -PM "$SM" -oA "$OFD""nmap_sP_PM__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_PM__$SNET_FN".txt 2>&1
echo "Completed: ICMP netmask"


#-TCP PING TYPES-#
#-in case ICMP traffic is blocked, and gives a better chance of
#bypassing firewalls

#-TCP SYN probe to port 80 (HTTP) without port scanning.
#-the PS options sends an empty TCP packet with the SYN flag set, the 
#target responds with SYN/ACK TCP if open or RST is closed. If open,
#attack machine sends RST instead of completing 3-way with ACK.
echo "$PASS" | sudo -S nmap -sn 80 "$SM" -oA "$OFD""nmap_sn_PS80__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sn_PS80__$SNET_FN".txt 2>&1
echo "Completed: TCP SYN probe to port 80 without port scanning"

# Custom ping. Send ping to port 25 instead
echo "$PASS" | sudo -S nmap -sP -PS25 "$SM" -oA "$OFD""nmap_sP_PS25__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_PS25__$SNET_FN".txt 2>&1
echo "Completed: Custom ping to port 25"

# For closed ports, try using the source-port option, eg. (-g 53)
echo "$PASS" | sudo -S nmap -sP -g 53 "$SM" -oA "$OFD""nmap_sP_g53__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_g53__$SNET_FN".txt 2>&1
echo "Completed: Custom ping using source-port 53"

# For closed ports, try using the source-port option, eg. (-g 88)
echo "$PASS" | sudo -S nmap -sP -g 88 "$SM" -oA "$OFD""nmap_sP_g88__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_g88__$SNET_FN".txt 2>&1
echo "Completed: Custom ping using source-port 88"

# Custom ping. Send ping to port 25 with source port 53
echo "$PASS" | sudo -S nmap -sP -PS25 -g 53 "$SM" -oA "$OFD""nmap_sP_PS25_g53__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sP_PS25_g53__$SNET_FN".txt 2>&1
echo "Completed: Custom ping to port 25 using source-port 53"


# TCP ACK default is port 80
echo "$PASS" | sudo -S nmap -sn -PA "$SM" -oA "$OFD""nmap_sn_PA__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sn_PA__$SNET_FN".txt 2>&1
echo "Completed: TCP ACK default"

# UDP PING defaults to port 40 and 125
echo "$PASS" | sudo -S nmap -sn -PU "$SM" -oA "$OFD""nmap_sn_PU__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sn_PU__$SNET_FN".txt 2>&1
echo "Completed: UDP Ping defaults port 40 and 125"

#-IP PROTOCOL PING-#
#-default is to send multiple packets for ICMP (protocol 1), IGMP
#(protocol 2), and IP-in-IP (protocol 4)
echo "$PASS" | sudo -S nmap -sn -PO "$SM" -oA "$OFD""nmap_sn_PO__$SNET_FN" --excludefile "$XH" > "$OFD""nmap_sn_PO__$SNET_FN".txt 2>&1
echo "Completed: IP Protocol Ping"
