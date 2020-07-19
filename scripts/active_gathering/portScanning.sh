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
nc -nvv -w 1 -z "$IP" 1-1000 > "$OFD""nc_tcpScan__""$IP"".txt" 2>&1
# UDP scanning
#nc -nv -u -z -w 1 "$IP" 1-65535 > "$OFD""nc_udpScan__""$IP"".txt" 2>&1

#-PORT SCANNING with NMAP-#
# Stealth / SYN Scanning
#-this is the default scan technique when no scan technique is specified
echo "$PASS" | sudo -S nmap -sS -p- "$IP" -oG "$OFD""nmap_portScan_default_stealth__""$IP"
# TCP Connect Scanning
echo "$PASS" | sudo -S nmap -sT -p- "$IP" -oG "$OFD""nmap_portScan_tcpConnect__""$IP"
# UDP Scanning
#echo "$PASS" | sudo -S nmap -sU -p- "$IP" -oG "$OFD""nmap_portScan_udp__""$IP"
# UDP Scanning with TCP Stealth Scanning
echo "$PASS" | sudo -S nmap -sS -sU -p- "$IP" -oG "$OFD""nmap_portScan_udp_tcpStealth__""$IP"
# Top 20 TCP ports
echo "$PASS" | sudo -S nmap -sT -A --top-ports=20 "$IP" -oG "$OFD""nmap_portScan_top20Ports__""$IP"
# OS Fingerprinting 
echo "$PASS" | sudo -S nmap -O "$IP" -oG "$OFD""nmap_portScan_osFingerprint__""$IP"
# Banner Grabbing / Service Enumeration
echo "$PASS" | sudo -S nmap -sV -sT -A "$IP" -oG "$OFD""nmap_portScan_bannerGrab__""$IP"

#-SMB Enumeration-#
# Scan for NetBIOS using nmap
echo "$PASS" | sudo -S nmap -v -p 139,445 "$IP" -oG "$OFD""nmap_smbEnum_netBIOS__""$IP"
# Scan for NETBIOS service using nbtscan
echo "$PASS" | sudo -S nbtscan -r -s : "$IP" > "$OFD""nbtscan_smbEnum_netBIOS__$IP"".txt" 2>&1
# Use nmap SMB NSE scripts
echo "$PASS" | sudo -S nmap -v -p 139,445 --script=smb-os-discovery "$IP" -oG "$OFD""nmap_smbEnum_nse_osDiscovery__""$IP"

#-NFS Enumeration-#
# Scanning if the hosts have portmapper or rpcbind running
echo "$PASS" | sudo -S nmap -v -p 111 "$IP" -oG "$OFD""nmap_nfsEnum_portmapper_rpcbind__""$IP"
# Scanning for services registed with rpcbind
echo "$PASS" | sudo -S nmap -sV -p_111 --script=rpcinfo "$IP" -oG "$OFD""nmap_nfsEnum_nse_rpcinfo__""$IP"
# If NFS is running, run NFS Scripts
#echo "$PASS" | sudo -S nmap -p_111 --script nfs* "$IP" -oG "$OFD""nmap_scripts_enumerate_all__""$IP"

#-SMTP Enumeration-#
# Verify if any existing using on a mail server using netcat
nc -nv "$IP" 25 > "$OFD""nc_smtpEnum__$IP"".txt" 2>&1

#-SNMP Enumeration-#
# Scan for open SNMP ports with nmap
echo "$PASS" | sudo -S nmap -sU --open -p 161 "$IP" -oG "$OFD""nmap_snmpEnum_openPorts__$IP"
# Can also use a tool called onesixtyone
# onesixtyone -c community -i ips
# snmpwalk -c public -v1 -t 10 "$IP"

