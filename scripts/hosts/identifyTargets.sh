#!/bin/bash

# Enumerate the targets from all the scripts
RESDIR="/home/kali/gitWorkspace/pwk/results/pwk/"
OUTDIR="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/"

# Go to the results directory
cd "$OUTDIR"

# Identify all XML files. This not yet an array!
FNAMES=$(ls *.xml)
echo "FNAMES= $FNAMES"
sleep 10
SAVEIFS=$IFS
IFS=$'\n'
FARRAY=($FNAMES)
IFS=$SAVEIFS


# Create a file for each xml file which shows all the hosts
for file in "${FARRAY[@]}"
do
    echo "FILENAME: $file"
    parse-nmap "$file"
done

# Add all the hosts to one file and make sure every target is unique
