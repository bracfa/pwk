Enumeration

Enumeration

# NMAP
## Port


# dirb
Non-recursive
`dirb http://10.11.1.133 -r`
![41445b383e458e5ee2b922fc7b471058.png](../../../_resources/ce7e044193cf4956b607d9bd32ce7ea1.png)

Recursive
`dirb http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt`
[dirb_recursive_10.11.1.133.txt](../../../_resources/415c8c6d1f8340f3ba899fd0b61356d3.txt)


# dirsearch
`python3 dirsearch.py -u http://10.11.1.133 -w /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt -E -r`
![52cd903b93b597663db231f0eda3acf9.png](../../../_resources/75b1b1ad37ce40b6a35f1ff8046632d9.png)





# dotdotpwn
`sudo dotdotpwn -m http -h 10.11.1.133/Sites/Knowledge/Membership/Inspired/ViewCode.asp?`
![9d1fd20fa449fc9884c59146f39738ba.png](../../../_resources/3c52d37a30244a8faf1701eafbb56dcf.png)

`sudo dotdotpwn -m http -h 10.11.1.133/Sites/Knowledge/Membership/Inspired/ViewCode.asp?source=TRAVERSAL`
![424bfaaff758316ac05e865186823a5c.png](../../../_resources/ff5c10f1e8ea4bb4b30f596eec589415.png)

**How to check for false positives?**
`sudo dotdotpwn -m http-url -u http://10.11.1.133/check.php?TRAVERSAL -k "root:" -d 12`
![85f4d8dfdc0912458aaaa089909e34be.png](../../../_resources/61997d2e94a949849c632e3c7077c7da.png)




# exiftool
`exiftool BBP.jpg`
![0b46d4dc383ef8fced3593138cf4ddc7.png](../../../_resources/c37a710b8fcb420994b425196cdd7d58.png)

`exiftool offsec-team.jpg`
![84ff80fd2e36a5525271652b132d12dc.png](../../../_resources/a3e776d2ef914f5b8fedefd7e42275a8.png)


# gobuster
`gobuster dir -u http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt -l`
![221fd36bcf4248f3c082fb8f46cf6ffb.png](../../../_resources/34b3e9fcb4244ee299817b57c787e2f8.png)

Check for .asp files
`gobuster dir -u http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt -l -x .asp`
![222207ecff6c1e0ac44d4c08feae71c5.png](../../../_resources/5dc271f81b3246e59397cfb918ffbe46.png)

Check for .php files... we find one named check.php
`gobuster dir -u http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt -l -x .php`
![6e684c89dde8500a96b87c5de697f994.png](../../../_resources/6ab01e4d60a24316aae3aa52f1405f35.png)

Check for JavaScript (.js) files
`gobuster dir -u http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt -l -x .js`
![d4f301371cd3b411e49f13044f382fce.png](../../../_resources/ccfd3857490a4769a1e1e5c89816de88.png)

Check for Java Server Pages (.jsp) files
`gobuster dir -u http://10.11.1.133 -w /usr/share/wordlists/dirb/big.txt -l -x .jsp`
![f46b6a0b97c8ea550cfadfd51b27bf7b.png](../../../_resources/df2f683c0090420cba6367f8d53586f5.png)

Try using seclist wordlist IIS.fuzz.txt, but no new directories found
`gobuster dir -u http://10.11.1.133 -w /usr/share/seclists/Discovery/Web-Content/IIS.fuzz.txt -l`
![17a4550f715566cfecce64fd53306d84.png](../../../_resources/d5de8ca86a934c03803b267ac0c426ed.png)



# Nessus
Common Platform Enumeration
![15fca56591936c810357b239803056bf.png](../../../_resources/92cf7efed1344dd89182fc95ed95b145.png)

OS Identification
![25a1592e49c8f036a13fc46523f663ac.png](../../../_resources/ad61fb1fe28b4e319266c8225153250a.png)



# Nikto
`nikto -h 10.11.1.133`
![9a2eb934c99021a408f02076559dfb95.png](../../../_resources/1888b85ed21443619a08204225641de0.png)



# p0f
`sudo p0f -i tun0 -p -o /tmp/p0f.log`






# Zap
[zap_10.11.1.133.html](../../../_resources/f128692ab6444b46a481845a73caddbf.html)


