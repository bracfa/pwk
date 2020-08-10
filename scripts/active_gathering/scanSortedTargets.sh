#!/usr/bin/bash

<<COMMENT
This script will run scans on the sortedTargets list
COMMENT

# Path to sortedTargets
sortedT="/home/kali/gitWorkspace/pwk/results/targets/pwk/sortedTargets"
# Path to singleTargetScan
tscan="/home/kali/gitWorkspace/pwk/scripts/active_gathering/singleTargetScan.sh"

cat "$sortedT"

# Perform default scan for every target
while IFS= read -r line
do
  echo "RUNNING SCANS ON: $line"
  $tscan $line def
done < "$sortedT"

