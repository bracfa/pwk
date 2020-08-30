#!/bin/bash
HOST=10.11.1.14
USER=anonymous
PASSWORD=anonymous
SHELLCODE="$1"

echo "Deleting file: $1"

ftp -inv $HOST <<EOF
user $USER $PASSWORD

# Non binary
cd /wwwroot
delete "$SHELLCODE" 
delete "b$SHELLCODE" 
cd ../Scripts
delete "$SHELLCODE"
delete "b$SHELLCODE"

bye

EOF
