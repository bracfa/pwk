import pyDes
import base64
import sys


print "Coldfusion v7 y v8 DataSource password decryptor (c) 2008 Hernan Ochoa (hernan@gmail.com)"
print " "

if len(sys.argv):
  print "syntax: coldfusion_ds_decrypt.py "
  exit(0)

pwd = sys.argv[1]
#key = "0yJ!@1$r8p0L@r1$6yJ!@1rj"
key = "8(^\:(B\#ILU\\]AE2F+L;']2J %]*\:X\\A\=>\n"

k = pyDes.triple_des(key)
d = k.decrypt( base64.decodestring(pwd), "*")

print "decrypted password: " + d
