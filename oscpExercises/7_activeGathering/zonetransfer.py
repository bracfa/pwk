#!/usr/bin/python

import sys, getopt
import os

# Simple Zone Transfer Bash Script
# $1 is the first argument given after the bash script
# Check if argument was given, if not, print usage

def main(argv):
  domain = ''
  # Name servers
  ns = []
  # Zone transfers
  zt = []
  try:
    opts, args = getopt.getopt(argv,"hd:",["domain="])
  except getopt.GetoptError:
    print "[*] Simple Zone transfer script"
    print '[*] Usage:   python zonetransfer.py -d <domain name>'
    sys.exit(2)
  for opt,arg in opts:
    if opt == '-h':
      print "[*] Simple Zone transfer script"
      print '[*] Usage:   python zonetransfer.py -d <domain name>'
      sys.exit()
    elif opt in ("-d", "--domain"):
      domain=arg

  # Command to get name server IPs
  ns_cmd = 'host -t ns %s | cut -d " " -f4' % domain

  stream = os.popen(ns_cmd)
  output = stream.read().split("\n")
  for o in output:
    if o != '':
      ns.append(o)
   
  # Command to do zone transfer
  for n in ns:
    z_cmd = 'host -l %s %s | grep "has address"' % (domain,n)
    stream = os.popen(z_cmd)
    output = stream.read().split("\n")
    for o in output:
      if o != '':
        print o

if __name__ == "__main__":
  main(sys.argv[1:])
