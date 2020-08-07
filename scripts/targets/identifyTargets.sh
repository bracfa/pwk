#!/bin/bash

# Results directory
RESDIR="/home/kali/gitWorkspace/pwk/results/targets/pwk/"
# Output files (scans) directory
OUTDIR="/home/kali/gitWorkspace/pwk/outputFiles/targets/pwk/"
# File that will contain all IPs from each output file, will need to be sorted
TARGETS_TO_SORT="targetsToSort"
# File that contain unique targets, already sorted
SORTED_TARGETS="sortedTargets"
# Timestamp
TS=$(date "+%F_%H%M%S_")

# Subnet
SNET="$1"
# Subnet Directory
SNETDIR="$OUTDIR""$SNET"

# Go to the outputfile directory
cd "$SNETDIR"
# Identify all XML files. This not yet an array!
XML_FNS=$(ls *.xml)
SAVEIFS="$IFS"
IFS=$'\n'
XML_ARR=($XML_FNS)
IFS="$SAVEIFS"

# Create a file for each xml file which shows all the hosts
SUBSTR="yesPortScan"

# Print the number of files
echo "Number of files: ${#XML_ARR[@]}"

# Use parse-nmap to get the "alive" hosts for each scan and store each in 
# its own .res file
for file in "${XML_ARR[@]}"
do
    echo -e "\nFILENAME: $file"
    temp=$(echo $file | awk -F'.xml' '{ print $1 }')
    sleep 1
    if [[ "$file" == *"$SUBSTR"* ]]; then
      parse-nmap -t 1-65535 "$file" --list-file "$RESDIR""$TS""$temp""_targetlist.res"
    else
      parse-nmap "$file" --list-file "$RESDIR""$TS""$temp""_targetlist.res" 
    fi
done

# Change to the results directory 
cd "$RESDIR"

# Remove any target list to sort
if [ -f "$TARGETS_TO_SORT" ]; then
  rm "$TARGETS_TO_SORT"
  echo "Removed $TARGETS_TO_SORT"
else
  touch "$TARGETS_TO_SORT"
fi
# Remove any already sorted target list
if [ -f "$SORTED_TARGETS" ]; then
  rm "$SORTED_TARGETS"
  echo "Removed $SORTED_TARGETS"
else
  touch "$SORTED_TARGETS"
fi

# Dump all the targets from the .res files into a file for sorting
for f in *.res
do
  echo "$f"
  cat "$f" >> "$TARGETS_TO_SORT"
  echo -e "\n" >> "$TARGETS_TO_SORT"
done
# Create a unique sorted target list
sort -V "$TARGETS_TO_SORT" | uniq | tee -a "$SORTED_TARGETS"
