Exercises

# 6.3.1.1
## 6.3.1.1.1. Use the whois tool in Kali to identify the name servers of MegaCorp One.
```plaintext
kali@kali:~$ whois megacorpone.com | grep "Name Server: .*MEGACORPONE.COM$" | sed -e 's/^[[:space:]]*//' | sort | uniq
Name Server: NS1.MEGACORPONE.COM
Name Server: NS2.MEGACORPONE.COM
Name Server: NS3.MEGACORPONE.COM
kali@kali:~$
```


# 6.4.1.1
## 6.4.1.1.1. Who is the VP of Legal for MegaCorp One and what is their email address?

VP of Legal = Mike Carlow (mcarlow@megacorpone.com)

Google Dork `site:megacorpone.com intitle:contact intext:"VP"`
![2d9f668cdf277bfbd64952c702871486.png](../../_resources/639d1d04e9a645b19f4e78ecd298ae5e.png)
![9265994b884683c4f257e625741b57d7.png](../../_resources/8c36502dc10e4ebc9f69375b597b3a87.png)

## 6.4.1.1.2. Use Google dorks (either your own or any from the GHDB) to search www.megacorpone.com for interesting documents.
Google Dork `site:github.com intitle:megacorpone intext:"xampp.users"`
![263ce46f5cc39b71deccb7d03acc09a8.png](../../_resources/4f8c51348ad34a5b814bfb8443ff5448.png)
![c9ebc3b13e19b74df87ad323edeebc30.png](../../_resources/d53a429b2bd844b48885b23a83471bd5.png)

## 6.4.1.1.3. What other MegaCorp One employess can you identify that are not listed on www.megacorpone.com?
Mike Schneakins - Software Developer
Fred Ducasse - Investments
Stan Denvers - Bill Collector
Handy McKay - Recruiter
Jason Lewis - IT Project Manager
Vicuong Ha - Manager
Ed Mackey - Shipping
Dan Wycza - IT Desktop Support
William Adler - Intern


# 6.5.1.1 Use Netcraft to determine what application server is running on www.megacorpone.com
https://searchdns.netcraft.com/

Enter megacorpone.com into the form
![3fa8f7501cf6764472004cae44a69e40.png](../../_resources/f089253eac9e4922b535169c06ed0bbd.png)

We find 6 hostnames
![b75cf7c031263b092e684e9c73652d8d.png](../../_resources/d2c4411beab84f03a7429a212bcb8fa6.png)

Click on the 'Site report' for www.megacorpone.com. We see that the application server technology used is Apache.
![c2a2a93e6ad37d5b77ae6015533a672a.png](../../_resources/5283a36640f948f894e6ab30aba07697.png)


# 6.6.1.1 *
![237a72948a80800c0ed6a7b47a83e53d.png](../../_resources/ec8927fbad4c4764a89eac4c924af24e.png)


# 6.7.1.1
The MegaCorp One GitHub: https://github.com/megacorpone

Search for `filename:users` 'In this user'
![0a4599338af670136a951979a1a590e5.png](../../_resources/da36dd147c7e461db80425a87a68ddfa.png)

Results show one file: xampp.users
![02e5420e3cd1eee6663834c245da966d.png](../../_resources/4217c1d17f67407c85f21444e6bd4513.png)

xampp.users shows credentials
```plaintext
trivera:$apr1$A0vSKwao$GV3sgGAj53j.c3GkS4oUC0
```
![f762ecb5f0a272d40098d6fef724c64f.png](../../_resources/3a2f90aaa57e4f5990362cf6a6f5c35a.png)


# 6.12.1.1  
## 6.12.1.1.1. Use theHarvester to enumerate email addresses for megacorpone.com.
```bash
kali@kali:~$ theHarvester -d megacorpone.com -b google
table results already exists

*******************************************************************
*  _   _                                            _             *
* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *
* | __|  _ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *
* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *
*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *
*                                                                 *
* theHarvester 3.1.0                                         *
* Coded by Christian Martorella                                   *
* Edge-Security Research                                          *
* cmartorella@edge-security.com                                   *
*                                                                 *
******************************************************************* 

 
[*] Target: megacorpone.com 
 
[*] Searching Google. 
        Searching 0 results.
        Searching 100 results.
        Searching 200 results.
        Searching 300 results.
        Searching 400 results.
        Searching 500 results.

[*] No IPs found.

[*] Emails found: 3
----------------------
first@megacorpone.com
joe@megacorpone.com                                                                                               
mcarlow@megacorpone.com                                                                                           

[*] Hosts found: 19
---------------------
253dsiem.megacorpone.com:
50mail.megacorpone.com:
60mail2.megacorpone.com:
admin.megacorpone.com:3.220.61.179
beta.megacorpone.com:3.220.61.179
fs1.megacorpone.com:3.220.61.179
ip.megacorpone.com:
mail.megacorpone.com:3.220.61.179
mail2.megacorpone.com:3.220.61.179
manager.megacorpone.com:
ns1.megacorpone.com:3.220.61.179
ns2.megacorpone.com:3.211.51.86
ns3.megacorpone.com:3.212.85.86
siem.megacorpone.com:3.220.61.179
support.megacorpone.com:3.212.85.86
syslog.megacorpone.com:3.220.61.179
www.megacorpone.com:3.220.87.155
x22www.megacorpone.com:
kali@kali:~$
```

## 6.12.1.1.2. Experiment with different data sources (-b). Which ones work best for you?

LinkedIn and dnsdumpster worked the best for me.

Here are the results from other sources:
Baidu
![93dba2d4b44ed7b50e5b86ccce5ab757.png](../../_resources/3cf8657c141145648b41b953be9ad85b.png)

crtsh
![6b68f087c9c850262bfac42ed7e963b2.png](../../_resources/c96cb1770c4c430d86f47621779087cb.png)

dnsdumpster
![e2e9c659837d1273423a238fae5f9981.png](../../_resources/58d7c493aa3b48fb890ade835c979964.png)

linkedin
![8351187293223953b70581e4fd406693.png](../../_resources/bd34ffb1520a4cf6b26212df39d3ff0c.png)

linkedin_links
![1dd51304253c23d5ce1c2e972950a4eb.png](../../_resources/ac8fd0db2e504f789f7b4d141db2ace8.png)

netcraft
![94af9803849376b6225fdc0894d46e89.png](../../_resources/d5fc4276a6624260a37c302310f8edbb.png)

otx
![4e79aee16fc9383b740f1ee0c09b298e.png](../../_resources/255ca71833604b32809af2bb8179a019.png)

threatcrowd
![9d53af50ae7a525aebb23bf0b3dbbef0.png](../../_resources/92278aac0b2b421ea86b3493c2e8c56c.png)

yahoo
![863ed9dffa831a284837f8121d673c60.png](../../_resources/6dd2ec5c0be946bf9f7f13c6e3ed9cc9.png)


# 6.13.2.1
## 6.13.2.1.1. Use any of the social media tools previously discussed to identify additional MegaCorp One employees. 




