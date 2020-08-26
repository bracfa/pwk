Enumeration

Enumeration

# NMAP
## Ports
TCP Connect Scan
### sudo nmap -sV -sT -p- 10.11.1.237
![5d20dcbd42667f4b10574400be9ca0bf.png](../../_resources/1ef343704a7746c39fa3970d1aa950af.png)

### sudo nmap -sU -p- --defeat-icmp-ratelimit 10.11.1.237
![59553cd2a734c6ce65435b46bc5e99eb.png](../../_resources/7cb32157dd9b4d51800f47cc030fa9a8.png)

### sudo nmap -sU -p111,5353 -A 10.11.1.237
![2aa80fb1e8177d5ef05519b578c579b7.png](../../_resources/ddb89417384a4050b7e4c74c7403a1bc.png)

## Scan for webdav
### sudo nmap --script "http-webdav-scan" 10.11.1.237
![e20feda71418fd09afb5171c95391b91.png](../../_resources/0a301e4a11d84b90a8489f2ca61e3047.png)

### sudo nmap --script "http-iis-webdav-vuln" 10.11.1.237
![175e9792f81993727a8827ac8f1f7c41.png](../../_resources/dfd96e8125914956909de59e22f68759.png)

# dirb
Non-recursive scan
### dirb http://10.11.1.237 -r
![01497a3f7a625605b8bb22ad48af0105.png](../../_resources/cdd0aa134a0243f0b92483498eb8aaf4.png)

Recursive scan on the /webdav dir
### dirb http://10.11.1.237/webdav
![96efe8013cf85d23ad497e9bf621aafa.png](../../_resources/bf39052bfcb84fd88297a1b0dfee4685.png)

# davtest
### davtest -url http://10.11.1.237/webdav
![7e4da62f1aa1218e21a78608af6a3da5.png](../../_resources/4b2f5fe8b7ee4095bf4227449b72f523.png)

# nikto
### nikto -h 10.11.1.237
![22e34897580e3f470c5c4b93bf566758.png](../../_resources/58a6b659a28e4317a57bfdb024d9f767.png)


# exiftool
Stay-Humble.png
![5e6334318dd0075cc65ff51e7912c9d5.png](../../_resources/111a23614808416cb40afe46f30957b8.png)

im-humble.png
![28a58de391c5a139afd8947c95975a29.png](../../_resources/6ccbe947c1e0421e88a47abcacae1538.png)



# Other Tools
