Enumeration

Enumeration

# NMAP
TCP Connect Scan with service detection on all ports
`sudo nmap -sV -sT -p- 10.11.1.209`
![5ab1b8a7b6179ee79203b72d5f727b5e.png](../../../_resources/508fb960b86f4634addedb825fcff36e.png)

UDP Fast scan on all ports
`sudo nmap -sU -p- --defeat-icmp-ratelimit 10.11.1.209`
![a59513699c913d3cca977038700b5de0.png](../../../_resources/8ad895a354b246cfb975328e0747d5b8.png)

No Ping scan with service detection, and run different scripts
`sudo nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.209`


# dirb
Recursive scan on port 6787
`dirb https://10.11.1.209:6787/`
![9bae74e279f25fb56ff650ea9de77ae1.png](../../../_resources/0aff1a34f51c4173a23052bb697a2996.png)

Recursive scan on port 8009
`dirb http://10.11.1.209:8009/`
![b12db90af19e2f5a5576379d96339ec0.png](../../../_resources/4c9135f3cbb34bde9732d7abb25645f9.png)

Recursive scan on port 8080
`dirb http://10.11.1.209:8080/`
![1d7e7d4c0ce1b74f7e441b9d9a6f4baa.png](../../../_resources/ae93ad20705f46a9965fc41cb692ac03.png)



# Nessus
[nessus_kraken_Basicj.html](../../../_resources/bcf596abfe654ec1b6926ef0a9e69699.html)

![822f492aa0093521cb524f5e54a5cbb1.png](../../../_resources/fbac8b312ec34967b56744b32223dbda.png)







# Nikto
`nikto -h http://10.11.1.209:6787`
![113884c47f14b9bde771b840cd15243f.png](../../../_resources/3e9e5c72bc3f47bf82665f9580364926.png)

`nikto -h https://10.11.1.209:8009`
![1d11f2d949091f5f24042e09a094e534.png](../../../_resources/33a31a2ca98343d19178c4dd78da87c7.png)

`nikto -h http://10.11.1.209:8080`
![8b07c24b46ae375c5c67eb1057eddb40.png](../../../_resources/999a42c6b0ca49a78fed1a8be083e059.png)



















# Other Tools
