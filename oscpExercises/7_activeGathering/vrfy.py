#!/usr/bin/python

import socket
import sys, getopt

def main(argv):
  # A single user name
  user=''
  # A filename of usernames
  fn=''
  # List of users to check
  ulst=[]
  if len(argv) != 2:
    print "[*] VRFY username script"
    print '[*] Usage:   python vrfy.py -f <list of usernames>'
    print '[*] Usage:   python vrfy.py -u <list of usernames>'
    sys.exit(0)
  try:
    opts, args = getopt.getopt(argv,"hu:f:",["user=","fname="])
  except getopt.GetoptError:
    print "[*] VRFY username script"
    print '[*] Usage:   python vrfy.py -f <list of usernames>'
    print '[*] Usage:   python vrfy.py -u <list of usernames>'
    sys.exit(2)
  for opt,arg in opts:
    if opt == '-h':
      print "[*] VRFY username script"
      print '[*] Usage:   python vrfy.py -f <list of usernames>'
      print '[*] Usage:   python vrfy.py -u <list of usernames>'
      sys.exit()
    elif opt in ("-u", "--user"):
      user=arg.strip()
    elif opt in ("-f", "--fname"):
      fn=arg
  
    
  # Create a Socket
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

  # Connect to the Server
  connect = s.connect(('10.11.1.217',25))

  # Receive the banner
  banner = s.recv(1024)

  print banner

  if user:
    s.send('VRFY ' + user + '\r\n')
    result = s.recv(1024)
    print result
  if fn:
    names = open(fn,"r")
    for n in names:
      s.send('VRFY ' + n.strip() + '\r\n')
      result = s.recv(1024)
      print result
    names.close()

  # Close the socket
  s.close()

if __name__=="__main__":
  main(sys.argv[1:])
