#!/usr/bin/python
import os

ip="10.11.1."
targets=range(1,255)

for t in targets:
  i=(ip+str(t))
  cmd = 'ping -c 1 %s | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f1 &' % i  
  stream = os.popen(cmd)
  output = stream.read()
  if output:
    print output.strip()
    
