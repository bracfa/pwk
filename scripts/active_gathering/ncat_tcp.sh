#!/bin/bash -x

<<COMMENT
-argument   : <IP>
-purpose    : run ncat tcp scanning on a single IP
-output     : write the output to 'scans' directory
COMMENT

SC_NAME=`basename $0`
SC_PATH=$(dirname $(readlink -f $0))
SC_PATH_W_NAME="$SC_PATH""/""$SC_NAME"
IP="$1"
MIN_PORT=1
MAX_PORT=1000

# Scripts
SCR_BASE="/home/kali/gitWorkspace/pwk/scripts/"
SCR_PHASE="$SCR_BASE""active_gathering/"

# Scans
SCN_BASE="/home/kali/gitWorkspace/pwk/scans/"
SCN_CSJ="$SCN_BASE""subnets/csj/"
SUBNET=""
SCN_SUBNET=""

# Calculate subnet /24
IFS='.'
read -ra ARRAY <<< "$IP"
SUBNET="${ARRAY[2]}"
SCN_SUBNET="$SCN_CSJ""$SUBNET""/"

# Output file info
FN_TYPE=".txt"
IFS='.'
read -ra ARRAY <<< "$SC_NAME"
UNDER_IP="${IP//./_}"
OUT_FN="$UNDER_IP""__""${ARRAY[0]}""$FN_TYPE"
OUT_PATH_W_NAME="$SCN_SUBNET""$OUT_FN"

#CMD="nc -nvv -w 1 -z $IP $MIN_PORT-$MAX_PORT > $OUT_PATH_W_NAME 2>&1"
nc -nvv -w 1 -z "$IP" "$MIN_PORT"-"$MAX_PORT" > "$OUT_PATH_W_NAME" 2>&1

<<COMMENT
echo "SC_NAME   = $SC_NAME"
echo "SC_PATH   = $SC_PATH"
echo "SC_PATH_W_NAME = $SC_PATH_W_NAME"
echo "IP        = $IP"
echo "MIN_PORT  = $MIN_PORT"
echo "MAX_PORT  = $MAX_PORT"
echo "SCR_BASE  = $SCR_BASE"
echo "SCR_PHASE   = $SCR_PHASE"
echo "SCN_CSJ   = $SCN_CSJ"
echo "SCN_SUBNET= $SCN_SUBNET"
echo "FN_TYPE   = $FN_TYPE"
echo "IP     = $IP"
echo "UNDER_IP     = $UNDER_IP"
echo "OUT_FN    = $OUT_FN"
echo "OUT_PATH_W_NAME  = $OUT_PATH_W_NAME"
echo "CMD       = $CMD"
COMMENT
