#!/usr/bin/bash

<<COMMENT
This script will run scans on the sortedTargets list
COMMENT

# Path to sortedTargets
sortedT="/home/kali/gitWorkspace/pwk/results/targets/pwk/sortedTargets"
# Path to singleTargetScan
tscan="/home/kali/gitWorkspace/pwk/scripts/active_gathering/singleTargetScan.sh"

# Perform default scan for every target
while IFS= read -r line
do
  echo "$line"
  "$tscan" "$line" "def"
done < "$sorted"

