#!/bin/bash

# Enumerate the targets from all the scripts

# Identify all XML files
FNAMES=$(ls /home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/*.xml)
RESDIR="/home/kali/gitWorkspace/pwk/results/pwk/"

# Create a file for each xml file which shows all the hosts
for file in "${FNAMES[@]}"; do
    # Get just the filename
    temp=$(echo "$file" | awk -F'/' '{ print $NF }' | awk -F'.xml' '{ print $1 }')
    echo "$temp""res"
done

# Add all the hosts to one file and make sure every target is unique
