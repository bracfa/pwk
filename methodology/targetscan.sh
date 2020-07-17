#!/bin/bash

# This is a script that scans one target only. What we need is another
# wrapper script that will do the same scan on hosts simultaneously

TARGET="$1"

# Port scanning with netcat
# TCP scan
nc -nvv -w 1 -z "$TARGET" 1-65535 > "ncat_tcp_$TARGET.txt" 2>&1
# UDP scan
nc -nv -u -w 1 -z "$TARGET" 1-65535 > "ncat_udp_$TARGET.txt" 2>&1





# Determine services available
sudo nmap "$TARGET" -p- -sV -vv --open --reason
