Enumeration

Enumeration

# NMAP
## TCP Ports
TCP SYN stealth scan with OS Fingerprint
`sudo nmap -sS -p- -O 10.11.1.5`
![9c0d26103d357f8b1639032fcc3ddc4f.png](../../../_resources/aa9fd06defc843ca97cecdf96986cb8c.png)

TCP CONNECT scan with service detection
`sudo nmap -sV -sT -p- 10.11.1.5`
![203db4a640c50ec9f17040b8fbb5368b.png](../../../_resources/27d71ea5b89f480f85fa02200c211f5a.png)

## UDP Ports
Fast UDP scan
`sudo nmap -sU -p- --defeat-icmp-ratelimit 10.11.1.5`
![d2271c8ccae26b1ce1dd0a98ab0d8385.png](../../../_resources/fb00b02f28f0416f93f90ea0ca003431.png)

Normal UDP Scan for ports listed in fast UDP scan
`sudo nmap -sU -p 135,137,1028 10.11.1.5`
![96c635304bb734e798000b84892df79b.png](../../../_resources/dbc863dc2d3148dba13e3b01a18f019e.png)



# dirb
Non-recursive scan found nothing
`dirb http://10.11.1.5`
![d15e9f20a9834034f62b0bd95620906e.png](../../../_resources/37cb13e22b2642aa9a3bdd410f889b58.png)


# Nikto
Default Nikto scan
`nikto -h 10.11.1.5`
![a5e2a038458dce6e83d035b89045f07c.png](../../../_resources/90a62329f9c44b29a775804c77d8dec9.png)

Since there is no webserver at the default port 80, try the other ports
`nikto -h 10.11.1.5 -p 135,139,445,1025`
![b7a03a53ce5f68e05494af77ad7ec39f.png](../../../_resources/0e8453d529e64a2ea5971cc746f766b3.png)





# Other Tools
