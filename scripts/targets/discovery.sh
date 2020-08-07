#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
Would be nice to know which hosts came from which scan, priot to
sorting or finding unique hosts

-If you find a closed port, try using it as a source port
-lookup idle zombie scan using metasploit auxiliary/scanner/ipidseq
-need to breakup this script
COMMENT

# Excluded targets file
XH="/home/kali/gitWorkspace/pwk/outputFiles/targets/pwk/exclude-hosts"
SM="$1"
# Attack machine password
PASS="$pass"
# Output file directory
OFD="/home/kali/gitWorkspace/pwk/outputFiles/targets/pwk/"
# Subnet address without mask
SNET=$(echo "$SM" | awk -F "/" '{print $1}')
# IP Mask value
MSK=$(echo "$SM" | awk -F "/" '{print $2}')
# How to represent the Subnet address and Mask in filename
SNET_FN="$SNET""m""$MSK"
# Subnet directory
SNET_DIR="$OFD""$SNET"

# Timestamp
TS=$(date "+%F_%H%M%S_")

# Change to the output file directory
cd "$OFD"
# Create/verify the target subnet IP directory exists
if [ ! -d "$SNET_DIR" ]; then
  mkdir -p "$SNET_DIR"
  echo "Created $SNET_DIR"
fi

# Change to the directory for the target subnet
cd "$SNET_DIR"

#-- HOST DISCOVERY --#
#TODO: Grep through the results to find which hosts are up. Just want a list of alive IPs from each scan


echo -e "\nSTARTED: No scan. List targets only"
echo "$PASS" | sudo -S nmap -sL "$SM" -oA "$TS""nmap_listScan__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: No scan. List targets only"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only"
echo "$PASS" | sudo -S nmap -sn "$SM" -oA "$TS""nmap_noPortScan_yesHostDiscovery__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. Source Port 53"
echo "$PASS" | sudo -S nmap -sn -g 53 "$SM" -oA "$TS""nmap_noPortScan_sourcePort53__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. Source Port 53"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. Source Port 88"
echo "$PASS" | sudo -S nmap -sn -g 88 "$SM" -oA "$TS""nmap_noPortScan_sourcePort88__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. Source Port 88"

echo -e "\nSTARTED: Disable host discovery. Port scan only with fingerprinting. Top 3500 ports"
echo "$PASS" | sudo -S nmap -v -Pn -O --top-ports=3500 "$SM" -oA "$TS""nmap_yesPortScan_noHostDiscovery_fingerPrint_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disable host discovery. Port scan only with fingerprinting. Top 3500 ports"

echo -e "\nSTARTED: Default scan port 80 only"
echo "$PASS" | sudo -S nmap -p 80 "$SM" -oA "$TS""nmap_default_SYN80__$SNET_FN" --excludefile "$XH" 
echo "COMPLETED: Default scan port 80 only"

echo -e "\nSTARTED: Default scan uses -PE 443 -PA80 -PP"
echo "$PASS" | sudo -S nmap --top-ports=3500 "$SM" -oA "$TS""nmap_default_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Default scan uses -PE 443 -PA80 -PP"

echo -e "\nSTARTED: TCP SYN ports 21-25, T5, max retries 4"
echo "$PASS" | sudo -S nmap -T5 -PS21-25 "$SM" --max-retries 4 -oA "$TS""nmap_noPortScan_T5_SYN21-25_maxRetries4__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP SYN ports 21-25, T5, max retries 4"

echo -e "\nSTARTED: Disabled port scanning. Host discovery only. TCP SYN ports 22-25. Source Port 53"
echo "$PASS" | sudo -S nmap -sn -PS22-25 -g 53 "$SM" -oA "$TS""nmap_noPortScan_SYN22-25_sourcePort53__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Disabled port scanning. Host discovery only. TCP SYN ports 22-25. Source Port 53"

echo -e "\nSTARTED: TCP connect scan for top 3500 TCP ports"
echo "$PASS" | sudo -S nmap -sT --top-ports=3500 "$SM" -oA "$TS""nmap_tcpConnect_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP connect scan for top 3500 TCP ports"

echo -e "\nSTARTED: ICMP echo"
echo "$PASS" | sudo -S nmap -sn -PE "$SM" -oA "$TS""nmap_noPortScan_icmpEcho__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP echo"

echo -e "\nSTARTED: ICMP timestamp"
echo "$PASS" | sudo -S nmap -sn -PP "$SM" -oA "$TS""nmap_noPortScan_icmpTimestamp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP timestamp"

echo -e "\nSTARTED: ICMP netmask"
echo "$PASS" | sudo -S nmap -sn -PM "$SM" -oA "$TS""nmap_noPortScan_icmpNetmask__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ICMP netmask"

echo -e "\nSTARTED: TCP ACK port scan"
echo "$PASS" | sudo -S nmap -PA --top-ports=3500 "$SM" -oA "$TS""nmap_ACK80_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP ACK port scan"

echo -e "\nSTARTED: UDP discovery defaults port 40, 53, 67, 88, 125 and 5353"
echo "$PASS" | sudo -S nmap -PU -p40,53,67,88,125,5353 "$SM" -oA "$TS""nmap_UDP40_53_67_88_125_5353__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: UDP discovery defaults port 40, 53, 67, 88, 125 and 5353"

echo -e "\nSTARTED: IP Protocol Ping"
echo "$PASS" | sudo -S nmap -sn -PO "$SM" -oA "$TS""nmap_noPortScan_ipProtocolPing__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: IP Protocol Ping"

echo -e "\nSTARTED: Syn Stealth Scan, portscan, T4, reason"
echo "$PASS" | sudo -S nmap -sS -T4 -Pn -p- --reason "$SM" -oA "$TS""nmap_yesPortScan_SYN_stealth_T4_reason__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Syn Stealth Scan, portscan, T4, reason"

echo -e "\nSTARTED: SCTP scan"
echo "$PASS" | sudo -S nmap -sZ -p- --reason "$SM" -oA "$TS""nmap_sctp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: SCTP scan"

#echo -e "\nSTARTED: SQL Injection scan"
#echo "$PASS" | sudo -S nmap -p80 --script http-sql-injection "$SM" -oA "$TS""nmap_sqli__$SNET_FN" --excludefile "$XH"
#echo "COMPLETED: SQL Injection scan"

echo -e "\nSTARTED: Fast UDP Scan"
echo "$PASS" | sudo -S nmap -sU --top-ports=16000 --defeat-icmp-ratelimit "$SM" -oA "$TS""nmap_UDP_topPorts16000_defeatIcmp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Fast UDP scan"

echo -e "\nSTARTED: Fragmented packets"
echo "$PASS" | sudo -S nmap -f "$SM" -oA "$TS""nmap_fragmented__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Fragmented packets"
COMMENT

echo -e "\nSTARTED: MTU 16"
echo "$PASS" | sudo -S nmap --mtu 16 "$SM" -oA "$TS""nmap_mtu16__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: MTU 16"

echo -e "\nSTARTED: MTU 8"
echo "$PASS" | sudo -S nmap --mtu 8 "$SM" -oA "$TS""nmap_mtu8__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: MTU 8"

echo -e "\nSTARTED: Badsum"
echo "$PASS" | sudo -S nmap --badsum "$SM" -oA "$TS""nmap_badsum__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Badsum"

echo -e "\nSTARTED: Vulnerability in Netfilter and other firewalls that use helpers to dynamically open ports"
echo "$PASS" | sudo -S nmap -sV -T4 -F "$SM" --script vuln -oA "$TS""nmap_scriptVuln__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Vulnerability in Netfilter and other firewalls that use helpers to dynamically open ports"

echo -e "\nSTARTED: FIN scan against stateless firewall, p1-100"
echo "$PASS" | sudo -S nmap -sF -p1-100 -T4 "$SM" -oA "$TS""nmap_FIN_p1-100_t4__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: FIN scan against stateless firewall, p1-100"

echo -e "\nSTARTED: NULL scan against stateless firewall, p1-100"
echo "$PASS" | sudo -S nmap -sN -p1-100 "$SM" -oA "$TS""nmap_NULL_p1-100__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: NULL scan against stateless firewall, p1-100"

echo -e "\nSTARTED: TCP connect scan for top 3500 TCP ports"
echo "$PASS" | sudo -S nmap -sT --top-ports=3500 "$SM" -oA "$TS""nmap_tcpConnect_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP connect scan for top 3500 TCP ports"

echo -e "\nSTARTED: Raw IP ping scan of an offline target"
echo "$PASS" | sudo -S nmap -sn --send-ip "$SM" -oA "$TS""nmap_noPortScan_sendIp__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Raw IP ping scan of an offline target"

echo -e "\nSTARTED: ARP ping scan of an offline target"
echo "$PASS" | sudo -S nmap -sn -PR --packet-trace --send-eth "$SM" -oA "$TS""nmap_noPortScan_ARP_packetTrace_sendEth__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: ARP ping scan of an offline target"

echo -e "\nSTARTED: Append random data"
echo "$PASS" | sudo -S nmap --data-length 25 "$SM" -oA "$TS""nmap_dataLength25__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Append random data"

echo -e "\nSTARTED: Randomize hosts, T4"
echo "$PASS" | sudo -S nmap --randomize-hosts -T4 "$SM" -oA "$TS""nmap_randomizeHosts_T4__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Randomize hosts, T4"

echo -e "\nSTARTED: Generate random MAC"
echo "$PASS" | sudo -S nmap --spoof-mac 0 "$SM" -oA "$TS""nmap_spoofMac0__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Generate random MAC"

echo -e "\nSTARTED: Syn Ack Scan, topPorts3500 - this may indicate host is behind firewall"
echo "$PASS" | sudo -S nmap -sA --top-ports=3500 "$SM" -oA "$TS""nmap_ACK_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: Syn Ack Scan, topPorts3500 - this may indicate host is behind firewall"

echo -e "\nSTARTED: XMAS scan topPorts=3500, T4"
echo "$PASS" | sudo -S nmap -sX --top-ports=3500 -T4 "$SM" -oA "$TS""nmap_xmas_topPorts3500__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: XMAS scan topPorts=3500, T4"

echo -e "\nSTARTED: TCP SYN ports 21-25, T1"
echo "$PASS" | sudo -S nmap -T1 -PS21-25 "$SM" -oA "$TS""nmap_noPortScan_T1_SYN21-25__$SNET_FN" --excludefile "$XH"
echo "COMPLETED: TCP SYN ports 21-25, T1"

# Probably take long
#echo -e "\nSTARTED: TCP SYN ports 21-25, T0"
#echo "$PASS" | sudo -S nmap -T0 -PS21-25 "$SM" -oA "$TS""nmap_noPortScan_T0_SYN21-25__$SNET_FN" --excludefile "$XH"
#echo "COMPLETED: TCP SYN ports 21-25, t0"

# Install metasploit, and try the idle scan as mentioned at the comments on top
