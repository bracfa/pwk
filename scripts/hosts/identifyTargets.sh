#!/bin/bash

# Command for yesPortScan
#parse-nmap -t 1-65535 -u 1-65535 nmap_yesPortScan_noHostDiscovery_fingerPrint__10.11.1.0m24.xml
# Enumerate the targets from all the scripts
RESDIR="/home/kali/gitWorkspace/pwk/results/pwk/"
OUTDIR="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/"

# Go to the outputfile directory
cd "$OUTDIR"

# Identify all XML files. This not yet an array!
FNAMES=$(ls *.xml)
echo "$FNAMES"
sleep 2
SAVEIFS="$IFS"
IFS=$'\n'
FARRAY=($FNAMES)
IFS="$SAVEIFS"


# Create a file for each xml file which shows all the hosts
SUBSTR="yesPortScan"
for file in "${FARRAY[@]}"
do
    echo -e "\nFILENAME: $file"
    temp=$(echo $file | awk -F'.xml' '{ print $1 }')
    sleep 1
    if [[ "$file" == *"$SUBSTR"* ]]; then
      parse-nmap -t 1-65535 "$file" --list-file "$RESDIR""$temp""_targetlist.res"
    else
      parse-nmap "$file" --list-file "$RESDIR""$temp""_targetlist.res" 
    fi
done

# Go to the results directory
cd "$RESDIR"
touch targs
for f in *.res
do
  echo "$f"
  cat "$f" >> targs
  echo -e "\n" >> targs
done

touch targetList
sort -V targs | uniq | tee -a targetList 
