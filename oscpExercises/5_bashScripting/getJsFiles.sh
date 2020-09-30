#!/bin/bash

cat access_log.txt | grep ".js" | awk '{print $7}' | awk -F "/" '{print $3}' | sort | uniq
