Enumeration

Enumeration

# NMAP
## TCP Ports
TCP Connect scan with service detection
`sudo nmap -sV -sT -p- 10.11.1.8`
![c21e96e9d14eba376b6f2361aaa5cdfd.png](../../../_resources/f485d60a7c774eba8cecac05c6b20824.png)

## UDP Ports
UDP Fast Scan
**May need further scanning if no other attack vectors**
`sudo nmap -sU -p- --defeat-icmp-ratelimit 10.11.1.8`
![e96a4128a1905afcc418a327f7a1ff50.png](../../../_resources/a0c710d6619d4d4d986ca9537903e316.png)


# dirb
Non-Recursive scan
`dirb http://10.11.1.8 -r`
![b315cd707e3d92c77d8e975f9ec1eae0.png](../../../_resources/4a7962e2e6ec43d3a025a6d6ea4007b6.png)

Recursive scan on internal directory
`dirb http://10.11.1.8/internal/`
![270403c576cf6e1cf1869a9ab2937130.png](../../../_resources/c7485c7476ab4180b72205111b33ca5f.png)

Recursive scan on /tmp/ directory
`dirb http://10.11.1.8/tmp/`
![b17b354c0d4d0debd95ff7121b51079c.png](../../../_resources/dc6d2d7c94c546549062a206fd109aa2.png)

Recursive scan on /cgi-bin directory
`dirb http://10.11.1.8/cgi-bin`

Recursive scan on /usage directory. Also tried using the -w option to force a scan, but still no results.
`dirb http://10.11.1.8/usage`
![d4d0fcb460fb2ba6355fff79190e7129.png](../../../_resources/c021f2e6ab744997a33b5a100c5d8097.png)


# exiftool
From port 80
![phoenix_port80.jpg](../../../_resources/44db0f97aba347ec9fc82864d2bfd9ed.jpg)
![4884394016dc6a940f0b4e023aa4c69f.png](../../../_resources/8a62e166ce784a219cc68b18604a8372.png)

From port 443
![phoenix_port443.jpg](../../../_resources/17d33c552fb84f30aedab00e384398ff.jpg)
![958994ac0c61e0f75d3135fc000275e4.png](../../../_resources/214749ddc5114294b34a4ea48e783287.png)


# nikto
`nikto -h 10.11.1.8`
![fbf91458388bfe295c7b25fa7d243e5d.png](../../../_resources/c8a525f38bd14ab794b63861d48be19c.png)

`nikto -h 10.11.1.8 -p 631`
![269291917d83b1aab9a4e0b869ac776d.png](../../../_resources/db274f7f20a8431eb7d37991d634038e.png)


# OWASP ZAP
Url to attack: `http://10.11.1.8/internal`
[zap.html](../../../_resources/58dad15dcf4d4c4f95a350a047664280.html)












