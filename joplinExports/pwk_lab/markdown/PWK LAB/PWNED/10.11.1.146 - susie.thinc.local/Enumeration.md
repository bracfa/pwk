Enumeration

Enumeration

# NMAP
## General

### No ping scan on all ports
`sudo nmap -v -Pn -p- -O 10.11.1.146`
PORT    STATE SERVICE
22/tcp  open  ssh
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port

### TCP CONNECT scan for services on all ports
`sudo nmap -sV -sT -p- 10.11.1.146`
PORT    STATE SERVICE     VERSION
22/tcp  open  ssh         OpenSSH 7.4p1 Ubuntu 10 (Ubuntu Linux; protocol 2.0)
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
Service Info: Host: SUSIE; OS: Linux; CPE: cpe:/o:linux:linux_kernel

### Fast UDP Scan
All 65535 scanned ports on 10.11.1.146 are closed|filtered

## Samba Enumeration
A general scan included some smb enumeration
`sudo nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.146`

### smb-enum
![10079c966153c52fb32059c618f5a033.png](../../../_resources/fcfd21f3ee3a476eace17936ce4772d1.png)

### smb-os-discovery
![72713a0889a6cac3162d7042b05ab2a4.png](../../../_resources/d7b40afe8fe24236866eea59633cdefb.png)

### smb-security-mode
![6c008db7ce2c3ea50a2c19d3d6b044ed.png](../../../_resources/84e7130dd87b47d9a13ad1e86800480c.png)



# dirb
Non-recursive scan could not connect to host
`dirb http://10.11.1.146 -r`
![8190e8d866cce8019d3f091ebad3c22d.png](../../../_resources/b42e0d4b870e47da8459191b68940403.png)



# Nessus
Basic scan:
[Full Report](file:///home/kali/gitWorkspace/pwk/outputFiles/active_gathering/10.11.1.146/10_11_1_146_-_Basic_wokp2e.html)

Critical - OS is out of date
[https://www.tenable.com/plugins/nessus/33850](https://www.tenable.com/plugins/nessus/33850)

High - SMB Shares Unprivileged Access
[https://www.tenable.com/plugins/nessus/42411](https://www.tenable.com/plugins/nessus/42411)


# Nikto
General scan could not find the server
`nikto -Display V -host 10.11.1.146`
![a2c8a8af866b1b2127a88b9a8ba455c3.png](../../../_resources/cece90be4b7a43b1b01bccd4a4d2c068.png)



# Other Tools
