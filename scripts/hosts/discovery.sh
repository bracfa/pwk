#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts
COMMENT

# Excluded targets file
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
#TODO: Grep through the results to find which hosts are up. Just want a list of alive IPs from each scan

echo -e "\nSTARTED: No scan. List targets only"
echo "$PASS" | sudo -S nmap -sL "$SM" -oA "$OFD""nmap_listScan__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: No scan. List targets only"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only"
echo "$PASS" | sudo -S nmap -sn "$SM" -oA "$OFD""nmap_noPortScan_yesHostDiscovery__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. Source Port 53"
echo "$PASS" | sudo -S nmap -sn -g 53 "$SM" -oA "$OFD""nmap_noPortScan_sourcPort53__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. Source Port 53"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. Source Port 88"
echo "$PASS" | sudo -S nmap -sn -g 88 "$SM" -oA "$OFD""nmap_noPortScan_sourcPort88__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. Source Port 88"

echo -e "\nSTARTED: Disable host discovery. Port scan only with fingerprinting"
echo "$PASS" | sudo -S nmap -v -Pn -O "$SM" -oA "$OFD""nmap_yesPortScan_noHostDiscovery_fingerPrint__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disable host discovery. Port scan only with fingerprinting"

echo -e "\nSTARTED: Default scan port 80 only"
echo "$PASS" | sudo -S nmap -p 80 "$SM" -oA "$OFD""nmap_default_syn80__$SNET_FN" --excludefile "$XH" 
echo "COMPLETED: Default scan port 80 only"

echo -e "\nSTARTED: Default scan uses -PE 443 -PA80 -PP"
echo "$PASS" | sudo -S nmap "$SM" -oA "$OFD""nmap_default_icmpEcho443_ack80_timeStamp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Default nmap scan uses -PE 443 -PA80 -PP"

echo -e "\nSTARTED: TCP SYN ports 22-25,80 only"
echo "$PASS" | sudo -S nmap -PS22-25,80 "$SM" -oA "$OFD""nmap_noPortScan_syn_22-25_80__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP SYN ports 22-25,80 only"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. TCP SYN ports 22-25. Source Port 53"
echo "$PASS" | sudo -S nmap -sn -PS22-25 -g 53 "$SM" -oA "$OFD""nmap_noPortScan_syn22-25_sourcePort53__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. TCP SYN ports 22-25. Source Port 53"


echo -e "\nSTARTED: Broadcast ping with disabled port scanning"
echo "$PASS" | sudo -S nmap -sn --script broadcast-ping "$SM" -oA "$OFD""nmap_noPortScan_bcastPing__$SNET_FN"
echo "COMPLETED: broadcast ping with disabled port scanning"

echo -e "\nSTARTED: TCP connect scan for top 200 TCP ports"
echo "$PASS" | sudo -S nmap -sT -A --top-ports=200 "$SM" -oA "$OFD""nmap_tcpConnect_aggressive_topPorts200__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP connect scan for top 200 TCP ports"


echo -e "\nSTARTED: ICMP echo"
echo "$PASS" | sudo -S nmap -sn -PE "$SM" -oA "$OFD""nmap_noPortScan_icmpEcho__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP echo"

echo -e "\nSTARTED: ICMP timestamp"
echo "$PASS" | sudo -S nmap -sn -PP "$SM" -oA "$OFD""nmap_noPortScan_icmpTimestamp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP timestamp"

echo -e "\nSTARTED: ICMP netmask"
echo "$PASS" | sudo -S nmap -sn -PM "$SM" -oA "$OFD""nmap_noPortScan_icmpNetmask__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP netmask"

echo -e "\nSTARTED: TCP ACK port scan"
echo "$PASS" | sudo -S nmap -PA "$SM" -oA "$OFD""nmap_ack80__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP ACK port scan"

echo -e "\nSTARTED: UDP discovery defaults port 40 and 125"
echo "$PASS" | sudo -S nmap -PU "$SM" -oA "$OFD""nmap_udp40_125__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: UDP discovery defaults port 40 and 125"

echo -e "\nSTARTED: IP Protocol Ping"
echo "$PASS" | sudo -S nmap -sn -PO "$SM" -oA "$OFD""nmap_noPortScan_ipProtocolPing__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: IP Protocol Ping"

echo -e "\nSTARTED: Syn Stealth Scan"
echo "$PASS" | sudo -S nmap -sS -p- "$SM" -oA "$OFD""nmap_syn_stealth__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Syn Stealth Scan"


echo -e "\nSTARTED: SCTP scan"
echo "$PASS" | sudo -S nmap -sZ -p- "$SM" -oA "$OFD""nmap_sctp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: SCTP scan"

echo -e "\nSTARTED: XMAS scan"
echo "$PASS" | sudo -S nmap -sX -p- "$SM" -oA "$OFD""nmap_xmas__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: XMAS scan"

echo -e "\nSTARTED: SQL Injection scan"
echo "$PASS" | sudo -S nmap -p80 --script http-sql-injection "$SM" -oA "$OFD""nmap_sqli__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: SQL Injection scan"

echo -e "\nSTARTED: Fast UDP Scan"
echo "$PASS" | sudo -S nmap -p- -sU --defeat-icmp-ratelimit "$SM" -oA "$OFD""nmap_udp_defeatIcmp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Fast UDP scan"

# Scanning all ports took too long
echo -e "\nSTARTED: Syn Ack Scan - this may indicate host is behind firewall"
echo "$PASS" | sudo -S nmap -sA "$SM" -oA "$OFD""nmap_ack__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Syn Ack Scan - this may indicate host is behind firewall"
