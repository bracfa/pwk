#!/usr/bin/python

import re

js=[]

f = open("access_log.txt", "r")

for x in f:
  if re.search(".js",x):
    tmp = x.split()[6].split("/")[2]
    if tmp not in js:
      js.append(tmp)

for j in js:
  print j
