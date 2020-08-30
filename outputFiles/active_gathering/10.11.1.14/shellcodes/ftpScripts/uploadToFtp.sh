#!/bin/bash
HOST=10.11.1.14
USER=anonymous
PASSWORD=anonymous
SCODE="$1"
STRIPPED=$(echo "$SCODE" | awk -F "/" '{print $NF}')

echo "Uploading file: $1"
echo "Renamed: $STRIPPED"

ftp -inv $HOST <<EOF
user $USER $PASSWORD

# Non binary
cd /wwwroot
put "$SCODE" "$STRIPPED"
cd ../Scripts
put "$SCODE" "$STRIPPED"

# Put as binary
binary
cd ../wwwroot
put "$SCODE" "b""$STRIPPED"
cd ../Scripts
put "$SCODE" "b""$STRIPPED"

bye

EOF
