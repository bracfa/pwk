#!/bin/bash

source /home/kali/Desktop/pass

<<COMMENT
#-- PORT SCANNING FOR SINGLE TARGET --#
Would be nice to know which hosts came from which scan, prior to
sorting or finding unique hosts
# Enter single IP without mask, then the type of scans
COMMENT
# Array for type of scans
SCAN_ARR=(def smb nfs smtp snmp wp udp http sql php)
# Command line arguments
CLI_ARGS="$@"
# The Target IP address
IP="$1"
# Attack machine password
PASS="$pass"
# Output file directory
OFD="/home/kali/gitWorkspace/pwk/outputFiles/active_gathering/"
# The IP specific directory to where we will put all output files
IP_DIR="$OFD""$IP"
# Timestamp
TS=$(date "+%F_%H%M%S_")

echo "####################################"
echo "RUNNING $0 on $IP"
echo "SCAN TYPES AVAILABLE:  ${SCAN_ARR[@]}"

# Check if command line arguments are part of the scan type
echo "----------------------"
for arg in "$@"
do
  if [[ ${SCAN_ARR[*]} =~ "$arg" ]]
  then
    echo "USER INPUT: $arg"
  fi
done
echo "----------------------"

# Change to the output file active gathering directory
cd "$OFD"
# Create/verify the target IP directory exists
echo "Checking if $IP_DIR exists..."
if [ ! -d "$IP_DIR" ]; then
  mkdir "$IP_DIR"
  echo "Created $IP_DIR"
fi

# Change to the directory for the target IP
cd "$IP_DIR"

# Default scans
for arg in "$@"
do
  if [[ "$arg" =~ "def" ]]
  then
    echo "Starting: $arg scan"
    # NMAP TCP SYN (Stealth)
    echo "$PASS" | sudo -S nmap -sS -p- -O "$IP" -oA "$TS""nmap_SYN_stealth_allPorts_osFingerprint__""$IP"
    # NMAP TCP CONNECT Banner Grabbing / Service Enumeration
    echo "$PASS" | sudo -S nmap -sV -sT -p- "$IP" -oA "$TS""nmap_CONNECT_allPorts_serviceDetection__""$IP"
    # NMAP TCP SYN (Stealth)
    echo "$PASS" | sudo -S nmap -sS -A -p- -sV --script default,safe,auth,vuln --max-retries 4 "$IP" -oA "$TS""nmap_SYN_stealth_aggressive_allPorts_serviceDetection_scriptDefaultSafeAuthVuln_maxRetries4__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 "$IP" -oA "$TS""nmap_noPing_aggressive_allPorts_serviceDetection_scriptDefaultSafeAuthVuln_maxRetries4__""$IP"
    # NMAP SYN ACK (could be firewall detection)
    echo "$PASS" | sudo -S nmap -sA "$IP" -oA "$TS""nmap_ACK__""$IP"
    # NMAP no ping. Port scan with fingerprinting only
    echo "$PASS" | sudo -S nmap -v -Pn -p- -O "$IP" -oA "$TS""nmap_SYN_noPing_allPorts_fingerprint__""$IP"
    # Find all listed ports of all statuses by running parse-nmap. Here or through script?
    # Take screenshots of all listed tcp ports with cutycapt
    
    #-- UDP SCANS --#
    # NMAP Fast UDP scan all ports
    echo "$PASS" | sudo -S nmap -sU -p- --defeat-icmp-ratelimit "$IP" -oA "$TS""nmap_fastUDP_allPorts__""$IP"
    # Take screenshots of all listed udp ports with cutycapt

    #--HTTP ENUM--#
    # NMAP Http Enum Script
    echo "$PASS" | sudo -S nmap -Pn --script="http-enum" "$IP" -oA "$TS""nmap_scripts_httpEnum__""$IP"
    # NMAP Http Comments
    echo "$PASS" | sudo -S nmap -Pn --script="http-comments-displayer" "$IP" -oA "$TS""nmap_scripts_httpCommentsDisplayer__""$IP"
    # NMAP Http Sitemap generator
    echo "$PASS" | sudo -S nmap -Pn --script="http-sitemap-generator" "$IP" -oA "$TS""nmap_scripts_httpSitemapGenerator__""$IP"
    # NMAP Http Sitemap generator
    echo "$PASS" | sudo -S nmap -Pn --script="http-userdir-enum" "$IP" -oA "$TS""nmap_scripts_httpUserdirEnum__""$IP"
    
    # SQL injection
    #echo "$PASS" | sudo -S nmap -sV -p80 --script="http-sql-injection" "$IP" -oA "$TS""nmap_scripts_httpSqlInjection__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -sV -p80 --script="http-sql-injection" "$IP" -oA "$TS""nmap_scripts_httpSqlInjection__""$IP"
    
    #-- SSL --#
    # NMAP SSL script
    echo "$PASS" | sudo -S nmap -Pn --script="ssl-*" "$IP" -oA "$TS""nmap_scripts_SSL__""$IP"

    #-- dirb --#
    # dirb index page non recursive... should later add different ports
    dirb "http://""$IP" -r -o "$TS""dirb_nonRecursive_index__""$IP"".txt"
    # dirb index page... should later add different ports
    #dirb "http://""$IP" -o  "$TS""dirb_recursive_index__""$IP"".txt"

    #-- NIKTO --#
    nikto -Display V -host "$IP" -o "$TS""nikto_displayV__""$IP"".txt"
    #-- cutycapt --#
    #cutycapt --url="http://""$IP" --out="$TS""cutycapt_index__""$IP"".png"

  fi
done

#-PHP Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "php" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scan using any script that has http in it
    echo "$PASS" | sudo -S nmap -Pn -p 80 --script "*php*" "$IP" -oA "$TS""nmap_noPing_scripts_php_p80__""$IP"
  fi
done


#-HTTP Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "http" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scan using any script that has http in it
    echo "$PASS" | sudo -S nmap -Pn -p 80 --script "*http*" "$IP" -oA "$TS""nmap_noPing_scripts_http_p80__""$IP"
  fi
done

#-SQL Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "sql" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scan using any script that has http in it
    echo "$PASS" | sudo -S nmap -Pn -p 80 --script "*sql*" "$IP" -oA "$TS""nmap_noPing_scripts_sql_p80__""$IP"
  fi
done


#-SMB Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "smb" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scan for NetBIOS using nmap
    #echo "$PASS" | sudo -S nmap -v -p 139,445 "$IP" -oA "$TS""nmap_SMB_netBIOS__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -v -p 139,445 "$IP" -oA "$TS""nmap_noPing_SMB_netBIOS__""$IP"
    # Scan for NETBIOS service using nbtscan
    echo "$PASS" | sudo -S nbtscan -r -s : "$IP" > "$TS""nbtscan_SMB_netBIOS__$IP"".txt" 2>&1
    # Use nmap SMB NSE scripts
    #echo "$PASS" | sudo -S nmap -v -p 139,445 --script "*smb*" "$IP" -oA "$TS""nmap_scripts_SMB__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -v -p 139,445 --script "*smb*" "$IP" -oA "$TS""nmap_noPing_scripts_SMB__""$IP"
  fi
done

#-NFS Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "nfs" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scanning if the hosts have portmapper or rpcbind running
    #echo "$PASS" | sudo -S nmap -v -p 111 "$IP" -oA "$TS""nmap_NFS_p111_portmapper_rpcbind__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -v -p 111 "$IP" -oA "$TS""nmap_noPing_NFS_p111_portmapper_rpcbind__""$IP"
    
    # Scanning for services registered with rpcbind
    #echo "$PASS" | sudo -S nmap -sV -p 111 --script="rpcinfo,rpc-grind" "$IP" -oA "$TS""nmap_NFS_services_rpcinfo_rpc-grind__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -sV -p 111 --script="rpcinfo,rpc-grind" "$IP" -oA "$TS""nmap_noPing_NFS_services_rpcinfo_rpc-grind__""$IP"
    # If NFS is running, run NFS Scripts
    echo "$PASS" | sudo -S nmap -Pn -p 111 --script "*nfs*" "$IP" -oA "$TS""nmap_noPing_scripts_NFS__""$IP"
  fi
done

#-SMTP Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "smtp" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Verify if any existing using on a mail server using netcat
    nc -nv "$IP" 25 > "nc_SMTP_25__$IP"".txt" 2>&1
    # There is a python script in Listing 625 that verifies a username
    # Run SMTP scripts
    #echo "$PASS" | sudo -S nmap -p 25 --script "*smtp*" "$IP" -oA "$TS""nmap_scripts_SMTP_25__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -p 25 --script "*smtp*" "$IP" -oA "$TS""nmap_noPing_scripts_SMTP_25__""$IP"
  fi
done

#-SNMP Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "snmp" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    # Scan for open SNMP ports with nmap
    #echo "$PASS" | sudo -S nmap -sU --open -p 161 "$IP" -oA "$TS""nmap_SNMP_open_161__$IP"
    echo "$PASS" | sudo -S nmap -Pn -sU --open -p 161 "$IP" -oA "$TS""nmap_noPing_SNMP_open_161__$IP"
    # onesixtyone -c community -i ips
    # snmpwalk -c public -v1 -t 10 "$IP"
    # Run SNMP scripts
    #echo "$PASS" | sudo -S nmap -p161,162 --script "*snmp*" "$IP" -oA "$TS""nmap_scripts_TCP_161-162_SNMP__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -p161,162 --script "*snmp*" "$IP" -oA "$TS""nmap_noPing_scripts_TCP_161-162_SNMP__""$IP"
    # Run SNMP scripts
    #echo "$PASS" | sudo -S nmap -sU -p161,162 --script "*snmp*" "$IP" -oA "$TS""nmap_scripts_UDP_161-162_SNMP__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -sU -p161,162 --script "*snmp*" "$IP" -oA "$TS""nmap_noPing_scripts_UDP_161-162_SNMP__""$IP"
  fi
done

#-Wordpress Enumeration-#
for arg in "$@"
do
  if [[ "$arg" =~ "wp" ]]
  then
    echo "-------------------------"
    echo "Starting: $arg scan"
    echo "$PASS" | sudo -S nmap -sS -p- --script "*wordpress*" "$IP" -oA "$TS""nmap_SYN_scripts_WordPress__""$IP"
    echo "$PASS" | sudo -S nmap -Pn -p- --script "*wordpress*" "$IP" -oA "$TS""nmap_noPing_scripts_WordPress__""$IP"
    wpscan --url "http://$IP/wp" -e u,vp,tt,vt -o "$TS""wpscan_users_vulnPlugins_timThumb_vulnThemes__""$IP"".txt"
  fi
done

# More default scans... these ones take long
for arg in "$@"
do
  if [[ "$arg" =~ "udp" ]]
  then
    echo "Continuing: $arg scan"
    # TCP scanning
    #nc -nvv -w 1 -z "$IP" 1-65535 > "$TS""nc_TCP_allPorts__""$IP"".txt" 2>&1
    # NC Slow UDP scan all ports
    nc -nv -u -z -w 1 "$IP" 1-65535 > "$TS""nc_UDP_allPorts__""$IP"".txt" 2>&1
    # NMAP UDP Scanning
    #echo "$PASS" | sudo -S nmap -sU -p- "$IP" -oA "$TS""nmap_UDP_allPorts__""$IP"
    #echo "$PASS" | sudo -S nmap -Pn -sU -p- "$IP" -oA "$TS""nmap_UDP_allPorts__""$IP"
  fi
done
# Need to do screenshots of all the ports
