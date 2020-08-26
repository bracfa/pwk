Enumeration

Enumeration

# NMAP
## TCP Ports
TCP SYN Stealth, No Ping
![0996597bbf186334bfe33946203e1788.png](../../_resources/3832079fe969485fbb5eb8f94566139c.png)

TCP Connect Scan
### sudo nmap -sV -sT -p- 10.11.1.116
![394f69696a0048fbeed190c60bc7ede3.png](../../_resources/2bd78f46dbe4457394d9d0561c630f1a.png)


# dirb
Non-recursive scan
### dirb http://10.11.1.116 -r
![52deaa60a560201de4064c192e336590.png](../../_resources/58f54a1e74834f4093dd0cd126adb58a.png)

### dirb http://10.11.1.116/administrator/
![c964615bcf9b7f316ca6ca5930f5c5c6.png](../../_resources/c85a35a1e46e4f54abb6937ad30591b0.png)

### dirb http://10.11.1.116/db
![7d9fea80c6a5c98d1a13b16f3b6a81cb.png](../../_resources/07ae0e5ff4bb48eea42326a70dcbf454.png)


# Nikto
### nikto -h 10.11.1.116
![2331cf90a0dca3fadf9e65c814864b85.png](../../_resources/a7309df9c9364aa9b36b265fa46d9e65.png)



# Other Tools
