Enumeration

# NMAP
## TCP Ports
### sudo nmap -Pn -p- 10.11.1.251
![e02386bfbd732d559460632148bd4802.png](../../_resources/2e5f9db642e94d6aaf4fe735089e45fc.png)

### sudo nmap -Pn -A -p- 10.11.1.251
![5d68b4cd71fc9b15014b6380bd62033c.png](../../_resources/f8c85169b5184eb79070dafff1954d80.png)

## UDP Ports
Did not scan

# dirb
Non-recursive scan:
### dirb http://10.11.1.251 -r
![9a7bc1c91d012c7a3730308e9e2c630a.png](../../_resources/77a3982497f84987b501af1fc9f1eee5.png)

Recursive scan for Wordpress site
### dirb http://10.11.1.251/wp
![cfbfcbab50f3294339e4ca1a71011ca8.png](../../_resources/a1529377ca9d4508920f290eab1a88c4.png)

# WPScan
Enumerate usernames. There is one username: admin
### wpscan --url http://10.11.1.251/wp --enumerate u
![acee3a14a95b8474852aac3a7de90e98.png](../../_resources/9b05d183258844faa0be02043a9e8990.png)

Dictionary password attack on username: admin using rockyou.txt
### wpscan --url http://10.11.1.251/wp -U admin -P /usr/share/wordlists/rockyou.txt
![f7d4e444a6b28fc74f1501471545109d.png](../../_resources/e5ccbad6f0604df2811eac1a817b9698.png)

Check that the login admin:monkey works
![01803855057a540f211f94ed634a8db7.png](../../_resources/d403119ca8da4f659fb733f20c833e6f.png)

# SSH
Attempt to login with credentials sean:monkey
![cee31872b5317dc394a94f63773dd2ab.png](../../_resources/84ca31526b75481390b923b268682c18.png)






