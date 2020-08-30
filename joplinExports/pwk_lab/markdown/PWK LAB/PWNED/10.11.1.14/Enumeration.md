Enumeration

# NMAP
## TCP Ports
TCP Connect Scan with service detection
`sudo nmap -sV -sT -p- 10.11.1.14`
![344de8c7a314268401e5e40acfde7d22.png](../../../_resources/6367232bdfd145b6a82d2ef8f4f2a2a3.png)

# Run nmap scripts
`sudo nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.14`

Interesting results from ftp scan
![7cb24d968d7d45515fcd96b82ae722a8.png](../../../_resources/0407befe13ec4cf39a9f808e2493370d.png)

Interesting results from http enumeration scan
![a617ed34963b7e245201b4a77681aa81.png](../../../_resources/6d5aa27d384a42138e8adbec97e455c1.png)

`sudo nmap --script="http-webdav-scan.nse" -p 80 10.11.1.14`
![bd627febd21965feccb42cb7da00ce88.png](../../../_resources/48246782d3584cf3a852a0818be98a65.png)

`sudo nmap --script="http-iis-webdav-vuln" -p 80 10.11.1.14`
![7f9e58b335e7c765128560c50ce02f95.png](../../../_resources/50796cad32d548bb9df95878e5897192.png)


# dirb
`dirb http://10.11.1.14 -r`
![df403d866142c31962b9dec8f9c202cd.png](../../../_resources/87e05e0824074d498450a49dae32ad0f.png)


# Nikto
`nikto -h 10.11.1.14`
![53183fd3499bb372128bfaeab491e0f1.png](../../../_resources/3ebab49acb6b415e988676d82f459c37.png)


# davtest
`davtest -url http://10.11.1.14`
![1bf558c7b0520317a9570bdd7ffb9eec.png](../../../_resources/c927d5279e4f41e5bf8253b78968860d.png)

`davtest -url http://10.11.1.14/Scripts`
![3b3fadddb9320cf235b613fe46af0056.png](../../../_resources/a4614ebdeffb48a4a7ca844346b7ea8c.png)




