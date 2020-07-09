#!/bin/bash

<<COMMENT
-argument   : <IP>
-purpose    : run ncat tcp scanning on a single IP
-output     : write the output to 'results' directory
COMMENT

# Base config file
source /home/kali/gitWorkspace/pwk/configs/recon/active/ncat_tcp.cfg
# Scripts directory
SCRIPT_BASE="$script_base_dir"
# Number of command line arguments
NUM_ARGS=1
# IP address argument
IP="$1"
# Required number of octets in IP
REQ_OCTETS=4
# Delimiter for parsing IP address 
IFS='.'
# Number of expected octets in IP address argument
NUM_OCTETS=0
# This script name
SCRIPT_FN="$(basename -- "$0")"
# Results file name will be *.txt
RES_FN=""
# Results file extension type
RES_EXT=".txt"
# Results lab directo
# Delimiting the IP with underscores for results filename
IP_UNDSCR="${IP//./_}"
# Hacking phase (eg. recon, scanning, etc.)
HACK_PHASE_DIR="$script_hack_phase_dir"
# Phase Type
PHASE_TYPE="$script_hack_phase_type"
# The lowest port in a range to scan
LOW_PORT="$lowest_port"
# The highest port in a range to scan
HIGH_PORT="$highest_port"


echo "script name: $SCRIPT_FN"

# Check that a single IP address was added
if [[ $# -ne "$NUM_ARGS" ]]; then
    echo "Requires one IP address"
    exit 1
fi

# Check number of octets equals 4
read -ra IP_ADDR <<< "$IP"
NUM_OCTETS="${#IP_ADDR[@]}"
if [ "$NUM_OCTETS" -ne "$REQ_OCTETS" ]; then
  echo "Bad format for IP address: $IP"
  exit 1
fi

# Check that each octet is between 1-250
for OCTET in "${IP_ADDR[@]}"
do
    if [ "$OCTET" -lt 0 ] || [ "$OCTET" -gt 255 ]; then
    echo "Invalid octet number: $OCTET"
    exit 1
    fi
done

# Run this from the scripts directory
cd "$SCRIPT_BASE"

# Build the base results filename
read -ra SCRIPTNAME <<< "$SCRIPT_FN"
RES_FN="$IP_UNDSCR""__""${SCRIPTNAME[0]}""$RES_EXT"
SUBNET="99"
# Determine the results directory it should be stored
RES_FPATH="$scan_lab_name""$SUBNET""/""$RES_FN"

#CMD="nc -nvv -w 1 -z $IP $LOWEST_PRT-$HIGHEST_PORT > $OUT_PATH_W_NAME 2>&1"
nc -nvv -w 1 -z "$IP" "$LOW_PORT"-"$HIGH_PORT" > "$RES_FPATH" 2>&1
