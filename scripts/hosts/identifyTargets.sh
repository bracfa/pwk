#!/bin/bash

# Command for yesPortScan
#parse-nmap -t 1-65535 -u 1-65535 nmap_yesPortScan_noHostDiscovery_fingerPrint__10.11.1.0m24.xml
# Results directory
RESDIR="/home/kali/gitWorkspace/pwk/results/pwk/"
# Output files (scans) directory
OUTDIR="/home/kali/gitWorkspace/pwk/outputFiles/hosts/pwk/"
# File that will contain all IPs from each output file, will need to be sorted
TARGETS_TO_SORT="targetsToSort"
# File that contain unique targets, already sorted
SORTED_TARGETS="sortedTargets"
# Go to the outputfile directory
cd "$OUTDIR"

# Identify all XML files. This not yet an array!
FNAMES=$(ls *.xml)
SAVEIFS="$IFS"
IFS=$'\n'
FARRAY=($FNAMES)
IFS="$SAVEIFS"


# Create a file for each xml file which shows all the hosts
SUBSTR="yesPortScan"

# Print the number of files
echo "Number of files: ${#FARRAY[@]}"

# Use parse-nmap to get the "alive" hosts for each scan and store each in 
# its own .res file
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
