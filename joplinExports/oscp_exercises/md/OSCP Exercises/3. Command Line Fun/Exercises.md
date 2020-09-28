Exercises

# 3.1.3.2

## 3.1.3.2.1 Inspect your bash history and use history expansion to re-run a command from it.
```plaintext
kali@kali:~$ history
    1  2020-09-15 17:31:39 history
    2  2020-09-15 17:31:53 touch file
    3  2020-09-15 17:32:13 mkdir -p one/two/three
    4  2020-09-15 17:32:19 rm -r one/two/three
    5  2020-09-15 17:32:19 ls
    6  2020-09-15 17:32:24 rm file
    7  2020-09-15 17:32:26 rm mytemp
    8  2020-09-15 17:32:31 history
kali@kali:~$ !2
touch file
```

## 3.1.3.2.2 Execute different commands of your choice and experiment browsing the history through the shortcuts as well as the reverse-i-search facility.

Using the reverse-i-search facility:
```plaintext
kali@kali:~$ history
    1  2020-09-15 17:31:39 history
    2  2020-09-15 17:31:53 touch file
    3  2020-09-15 17:32:13 mkdir -p one/two/three
    4  2020-09-15 17:32:19 rm -r one/two/three
    5  2020-09-15 17:32:19 ls
    6  2020-09-15 17:32:24 rm file
    7  2020-09-15 17:32:26 
    8  2020-09-15 17:32:31 history
    9  2020-09-15 17:32:39 touch file
   10  2020-09-15 17:36:05 firefox-esr megacorpone.com
   11* 2020-09-15 17:36:20 
   12  2020-09-15 17:37:04 echo "hello there"
   13  2020-09-15 17:37:24 sudo msfconsole -q
   14  2020-09-15 17:37:50 dirb mgegacorpone.com
   15  2020-09-15 17:38:04 dirb http://megacorpone.com
   16  2020-09-15 17:38:17 searchsploit -m 10
   17  2020-09-15 17:38:18 ls
   18  2020-09-15 17:38:21 rm 10.c
   19  2020-09-15 17:38:23 ls
   20  2020-09-15 17:38:26 vi file 
   21  2020-09-15 17:38:29 rm file
   22  2020-09-15 17:38:31 history
(reverse-i-search)`ec': echo "hello there"
```
Using history shortcuts:
```plaintext
kali@kali:~$ history
    1  2020-09-15 17:31:39 history
    2  2020-09-15 17:31:53 touch file
    3  2020-09-15 17:32:13 mkdir -p one/two/three
    4  2020-09-15 17:32:19 rm -r one/two/three
    5  2020-09-15 17:32:19 ls
    6  2020-09-15 17:32:24 rm file
    7  2020-09-15 17:32:26 
    8  2020-09-15 17:32:31 history
    9  2020-09-15 17:32:39 touch file
   10  2020-09-15 17:36:05 firefox-esr megacorpone.com
   11* 2020-09-15 17:36:20 
   12  2020-09-15 17:37:04 echo "hello there"
   13  2020-09-15 17:37:24 sudo msfconsole -q
   14  2020-09-15 17:37:50 dirb mgegacorpone.com
   15  2020-09-15 17:38:04 dirb http://megacorpone.com
   16  2020-09-15 17:38:17 searchsploit -m 10
   17  2020-09-15 17:38:18 ls
   18  2020-09-15 17:38:21 rm 10.c
   19  2020-09-15 17:38:23 ls
   20  2020-09-15 17:38:26 vi file 
   21  2020-09-15 17:38:29 rm file
   22  2020-09-15 17:38:31 history
   23  2020-09-15 17:40:54 echo "hello there"
   24  2020-09-15 17:41:12 history
kali@kali:~$ !!
history
    1  2020-09-15 17:31:39 history
    2  2020-09-15 17:31:53 touch file
    3  2020-09-15 17:32:13 mkdir -p one/two/three
    4  2020-09-15 17:32:19 rm -r one/two/three
    5  2020-09-15 17:32:19 ls
    6  2020-09-15 17:32:24 rm file
    7  2020-09-15 17:32:26 
    8  2020-09-15 17:32:31 history
    9  2020-09-15 17:32:39 touch file
   10  2020-09-15 17:36:05 firefox-esr megacorpone.com
   11* 2020-09-15 17:36:20 
   12  2020-09-15 17:37:04 echo "hello there"
   13  2020-09-15 17:37:24 sudo msfconsole -q
   14  2020-09-15 17:37:50 dirb mgegacorpone.com
   15  2020-09-15 17:38:04 dirb http://megacorpone.com
   16  2020-09-15 17:38:17 searchsploit -m 10
   17  2020-09-15 17:38:18 ls
   18  2020-09-15 17:38:21 rm 10.c
   19  2020-09-15 17:38:23 ls
   20  2020-09-15 17:38:26 vi file 
   21  2020-09-15 17:38:29 rm file
   22  2020-09-15 17:38:31 history
   23  2020-09-15 17:40:54 echo "hello there"
   24  2020-09-15 17:41:12 history
kali@kali:~$ !16
searchsploit -m 10
  Exploit: Samba < 2.2.8 (Linux/BSD) - Remote Code Execution
      URL: https://www.exploit-db.com/exploits/10
     Path: /usr/share/exploitdb/exploits/multiple/remote/10.c
File Type: C source, ASCII text, with CRLF line terminators

Copied to: /home/kali/10.c


kali@kali:~$ !!
searchsploit -m 10
  Exploit: Samba < 2.2.8 (Linux/BSD) - Remote Code Execution
      URL: https://www.exploit-db.com/exploits/10
     Path: /usr/share/exploitdb/exploits/multiple/remote/10.c
File Type: C source, ASCII text, with CRLF line terminators

cp: overwrite '/home/kali/10.c'? y
Copied to: /home/kali/10.c


kali@kali:~$ 

```

# 3.2.5.1

### 3.2.5.1.1 Use the **cat** command in conjunction with **sort** to reorder the content of the **/etc/passwd** file on your Kali Linux system.
```plaintext
kali@kali:~$ cat /etc/passwd | sort
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
avahi:x:124:129:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
colord:x:130:138:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
Debian-snmp:x:118:123::/var/lib/snmp:/bin/false
dnsmasq:x:113:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
geoclue:x:131:139::/var/lib/geoclue:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
inetsim:x:129:137::/var/lib/inetsim:/usr/sbin/nologin
iodine:x:111:65534::/var/run/iodine:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
kali:x:1000:1000:Kali,,,:/home/kali:/bin/bash
king-phisher:x:133:141::/var/lib/king-phisher:/usr/sbin/nologin
lightdm:x:132:140:Light Display Manager:/var/lib/lightdm:/bin/false
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
messagebus:x:108:113::/nonexistent:/usr/sbin/nologin
miredo:x:112:65534::/var/run/miredo:/usr/sbin/nologin
mysql:x:104:110:MySQL Server,,,:/nonexistent:/bin/false
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nm-openconnect:x:126:131:NetworkManager OpenConnect plugin,,,:/var/lib/NetworkManager:/usr/sbin/nologin
nm-openvpn:x:125:130:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
ntp:x:107:112::/nonexistent:/usr/sbin/nologin
postgres:x:120:125:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
pulse:x:127:133:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
redsocks:x:109:114::/var/run/redsocks:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
_rpc:x:117:65534::/run/rpcbind:/usr/sbin/nologin
rtkit:x:116:121:RealtimeKit,,,:/proc:/usr/sbin/nologin
rwhod:x:110:65534::/var/spool/rwho:/usr/sbin/nologin
saned:x:128:135::/var/lib/saned:/usr/sbin/nologin
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
sslh:x:123:128::/nonexistent:/usr/sbin/nologin
statd:x:119:65534::/var/lib/nfs:/usr/sbin/nologin
strongswan:x:106:65534::/var/lib/strongswan:/usr/sbin/nologin
stunnel4:x:121:127::/var/run/stunnel4:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
systemd-network:x:102:103:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:103:104:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
systemd-timesync:x:101:101:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
tcpdump:x:115:119::/nonexistent:/usr/sbin/nologin
tss:x:105:111:TPM software stack,,,:/var/lib/tpm:/bin/false
usbmux:x:114:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
uuidd:x:134:142::/run/uuidd:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
kali@kali:~$ 
```

## 3.2.5.1.2 Redirect the output of the previous exercise to a file of your choice in your home directory
```plaintext
kali@kali:~$ cat /etc/passwd | sort > /home/kali/sortedEtcPasswd
kali@kali:~$ pwd
/home/kali
kali@kali:~$ ls -la sortedEtcPasswd 
-rw-r--r-- 1 kali kali 3157 Sep 15 17:48 sortedEtcPasswd
kali@kali:~$ cat sortedEtcPasswd 
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
avahi:x:124:129:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
colord:x:130:138:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
Debian-snmp:x:118:123::/var/lib/snmp:/bin/false
dnsmasq:x:113:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
geoclue:x:131:139::/var/lib/geoclue:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
inetsim:x:129:137::/var/lib/inetsim:/usr/sbin/nologin
iodine:x:111:65534::/var/run/iodine:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
kali:x:1000:1000:Kali,,,:/home/kali:/bin/bash
king-phisher:x:133:141::/var/lib/king-phisher:/usr/sbin/nologin
lightdm:x:132:140:Light Display Manager:/var/lib/lightdm:/bin/false
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
messagebus:x:108:113::/nonexistent:/usr/sbin/nologin
miredo:x:112:65534::/var/run/miredo:/usr/sbin/nologin
mysql:x:104:110:MySQL Server,,,:/nonexistent:/bin/false
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nm-openconnect:x:126:131:NetworkManager OpenConnect plugin,,,:/var/lib/NetworkManager:/usr/sbin/nologin
nm-openvpn:x:125:130:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
ntp:x:107:112::/nonexistent:/usr/sbin/nologin
postgres:x:120:125:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
pulse:x:127:133:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
redsocks:x:109:114::/var/run/redsocks:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
_rpc:x:117:65534::/run/rpcbind:/usr/sbin/nologin
rtkit:x:116:121:RealtimeKit,,,:/proc:/usr/sbin/nologin
rwhod:x:110:65534::/var/spool/rwho:/usr/sbin/nologin
saned:x:128:135::/var/lib/saned:/usr/sbin/nologin
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
sslh:x:123:128::/nonexistent:/usr/sbin/nologin
statd:x:119:65534::/var/lib/nfs:/usr/sbin/nologin
strongswan:x:106:65534::/var/lib/strongswan:/usr/sbin/nologin
stunnel4:x:121:127::/var/run/stunnel4:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
systemd-network:x:102:103:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:103:104:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
systemd-timesync:x:101:101:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
tcpdump:x:115:119::/nonexistent:/usr/sbin/nologin
tss:x:105:111:TPM software stack,,,:/var/lib/tpm:/bin/false
usbmux:x:114:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
uuidd:x:134:142::/run/uuidd:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
kali@kali:~$ 
```


# 3.3.5.1
## 3.3.5.1.1 Using **/etc/passwd**, extract the user and home directory fields for all users on on your Kali machine for which the shell is set to */bin/false*. Make sure you use a Bash one-liner to print the output to the screen. The output should look similar to Listing 53 below:
![8647d1cd06a9aedca03d35fe96aa6d97.png](../../_resources/c6ed3cd5b6624ff4ac176e7ae29bb647.png)
```plaintext
kali@kali:~$ cat /etc/passwd | grep "/bin/false" | awk -F ":" '{print "The user " $1 "home directory is " $6}'
The user mysqlhome directory is /nonexistent                                                                                                                                            
The user tsshome directory is /var/lib/tpm                                                                                                                                              
The user Debian-snmphome directory is /var/lib/snmp                                                                                                                                     
The user lightdmhome directory is /var/lib/lightdm                                                                                                                                      
kali@kali:~$ 
```

## 3.3.5.1.2 Copy the **/etc/passwd** file to your home directory (**/home/kali**).
```plaintext
kali@kali:~$ cp /etc/passwd ~/
kali@kali:~$ ls
Desktop  Documents  Downloads  gitWorkspace  Music  one  passwd  Pictures  Public  Templates  Videos  vpnCreds
kali@kali:~$ 
```

## 3.3.5.1.3 Use **cat** in a one-liner to print the output of the /kali/passwd and replace all instances of the "Gnome Display Manager" string with "GDM"
```plaintext
kali@kali:~$ cat /home/kali/passwd | sed 's/Gnome Display Manager/GDM/g'
```


# 3.5.3.1

## 3.5.3.1.1 Download the archive from the following URL https://offensive-security.com/pwk-files/scans.tar.gz 
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2$ wget http://offensive-security.com/pwk-files/scans.tar.gz
--2020-09-15 18:04:39--  http://offensive-security.com/pwk-files/scans.tar.gz
Resolving offensive-security.com (offensive-security.com)... 192.124.249.5
Connecting to offensive-security.com (offensive-security.com)|192.124.249.5|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2740 (2.7K) [application/x-gzip]
Saving to: ‘scans.tar.gz’

scans.tar.gz                                  100%[=================================================================================================>]   2.68K  --.-KB/s    in 0s      

2020-09-15 18:04:40 (52.0 MB/s) - ‘scans.tar.gz’ saved [2740/2740]

kali@kali:~/gitWorkspace/pwk/oscpExercises/test2$ 

```

## 3.5.3.1.2 This archive contains the reuslts of scanning the same target machine at different times. Extract the archive and see if you can spot the differences by diffing the scans.

Extract the archive:
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2$ tar -xvf scans.tar.gz 
scans/
scans/10.11.1.234_scan_02.txt
scans/10.11.1.118_scan_02.txt
scans/10.11.1.8_scan_02.txt
scans/10.11.1.234_scan_01.txt
scans/10.11.1.8_scan_01.txt
scans/10.11.1.118_scan_01.txt
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2$ ls
scans  scans.tar.gz
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2$ 
```

### 10.11.1.8_scan_01.txt vs 10.11.1.8_scan_02.txt
These pair of files are not sorted and therefore not suitable for use with the comm command to find differences between them. Differences are more easily spotted with diff or vimdiff.

diff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ diff -u 10.11.1.8_scan_01.txt 10.11.1.8_scan_02.txt 
--- 10.11.1.8_scan_01.txt       2020-01-22 07:10:32.000000000 -0500
+++ 10.11.1.8_scan_02.txt       2020-01-22 07:17:21.000000000 -0500
@@ -1,60 +1,53 @@
-kali@kali:~$ sudo nmap 10.11.1.8 -p- -sV -vv --open --reason
-Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:02 EET
+kali@kali:~$ sudo nmap 10.11.1.8 -p- -sV -vv --open --reason      
+Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:12 EET
 NSE: Loaded 45 scripts for scanning.
-Initiating Ping Scan at 14:02
+Initiating Ping Scan at 14:12
 Scanning 10.11.1.8 [4 ports]
-Completed Ping Scan at 14:02, 0.28s elapsed (1 total hosts)
-Initiating Parallel DNS resolution of 1 host. at 14:02
-Completed Parallel DNS resolution of 1 host. at 14:02, 0.02s elapsed
-Initiating SYN Stealth Scan at 14:02
+Completed Ping Scan at 14:12, 0.14s elapsed (1 total hosts)
+Initiating Parallel DNS resolution of 1 host. at 14:12
+Completed Parallel DNS resolution of 1 host. at 14:12, 0.01s elapsed
+Initiating SYN Stealth Scan at 14:12
 Scanning 10.11.1.8 [65535 ports]
-Discovered open port 445/tcp on 10.11.1.8
-Discovered open port 80/tcp on 10.11.1.8
 Discovered open port 21/tcp on 10.11.1.8
 Discovered open port 22/tcp on 10.11.1.8
-Discovered open port 3306/tcp on 10.11.1.8
-Discovered open port 111/tcp on 10.11.1.8
 Discovered open port 139/tcp on 10.11.1.8
-Discovered open port 443/tcp on 10.11.1.8
-SYN Stealth Scan Timing: About 7.06% done; ETC: 14:09 (0:06:48 remaining)
-SYN Stealth Scan Timing: About 20.12% done; ETC: 14:07 (0:04:02 remaining)
-SYN Stealth Scan Timing: About 29.94% done; ETC: 14:07 (0:03:33 remaining)
-SYN Stealth Scan Timing: About 44.61% done; ETC: 14:06 (0:02:30 remaining)
-SYN Stealth Scan Timing: About 57.62% done; ETC: 14:06 (0:01:51 remaining)
-SYN Stealth Scan Timing: About 74.54% done; ETC: 14:06 (0:01:02 remaining)
-SYN Stealth Scan Timing: About 87.21% done; ETC: 14:06 (0:00:31 remaining)
+Discovered open port 111/tcp on 10.11.1.8
+Discovered open port 445/tcp on 10.11.1.8
+SYN Stealth Scan Timing: About 10.46% done; ETC: 14:16 (0:04:25 remaining)
+SYN Stealth Scan Timing: About 20.79% done; ETC: 14:16 (0:03:52 remaining)
+SYN Stealth Scan Timing: About 34.58% done; ETC: 14:16 (0:02:52 remaining)
+SYN Stealth Scan Timing: About 47.64% done; ETC: 14:16 (0:02:13 remaining)
 Discovered open port 631/tcp on 10.11.1.8
-Completed SYN Stealth Scan at 14:06, 233.80s elapsed (65535 total ports)
-Initiating Service scan at 14:06
-Scanning 9 services on 10.11.1.8
-Completed Service scan at 14:08, 161.62s elapsed (9 services on 1 host)
+SYN Stealth Scan Timing: About 61.61% done; ETC: 14:16 (0:01:34 remaining)
+SYN Stealth Scan Timing: About 72.48% done; ETC: 14:16 (0:01:09 remaining)
+Completed SYN Stealth Scan at 14:15, 238.37s elapsed (65535 total ports)
+Initiating Service scan at 14:15
+Scanning 6 services on 10.11.1.8
+Completed Service scan at 14:16, 11.42s elapsed (6 services on 1 host)
 NSE: Script scanning 10.11.1.8.
 NSE: Starting runlevel 1 (of 2) scan.
-Initiating NSE at 14:08
-Completed NSE at 14:08, 3.92s elapsed
+Initiating NSE at 14:16
+Completed NSE at 14:16, 2.34s elapsed
 NSE: Starting runlevel 2 (of 2) scan.
-Initiating NSE at 14:08
-Completed NSE at 14:08, 2.57s elapsed
+Initiating NSE at 14:16
+Completed NSE at 14:16, 0.56s elapsed
 Nmap scan report for 10.11.1.8
-Host is up, received timestamp-reply ttl 63 (0.14s latency).
-Scanned at 2020-01-22 14:02:10 EET for 402s
-Not shown: 65524 filtered ports, 2 closed ports
-Reason: 65285 no-responses, 239 host-prohibiteds and 2 resets
+Host is up, received echo-reply ttl 63 (0.14s latency).
+Scanned at 2020-01-22 14:12:01 EET for 252s
+Not shown: 65524 filtered ports, 5 closed ports
+Reason: 65275 no-responses, 249 host-prohibiteds and 5 resets
 Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
-PORT     STATE SERVICE     REASON         VERSION
-21/tcp   open  ftp         syn-ack ttl 63 vsftpd 2.0.1
-22/tcp   open  ssh         syn-ack ttl 63 OpenSSH 3.9p1 (protocol 1.99)
-80/tcp   open  http        syn-ack ttl 63 Apache httpd 2.0.52 ((CentOS))
-111/tcp  open  rpcbind     syn-ack ttl 63 2 (RPC #100000)
-139/tcp  open  netbios-ssn syn-ack ttl 63 Samba smbd 3.X - 4.X (workgroup: MYGROUP)
-443/tcp  open  ssl/https?  syn-ack ttl 63
-445/tcp  open  netbios-ssn syn-ack ttl 63 Samba smbd 3.X - 4.X (workgroup: MYGROUP)
-631/tcp  open  ipp         syn-ack ttl 63 CUPS 1.1
-3306/tcp open  mysql?      syn-ack ttl 63
+PORT    STATE SERVICE     REASON         VERSION
+21/tcp  open  ftp         syn-ack ttl 63 vsftpd 2.0.1
+22/tcp  open  ssh         syn-ack ttl 63 OpenSSH 3.9p1 (protocol 1.99)
+111/tcp open  rpcbind     syn-ack ttl 63 2 (RPC #100000)
+139/tcp open  netbios-ssn syn-ack ttl 63 Samba smbd 3.X - 4.X (workgroup: MYGROUP)
+445/tcp open  netbios-ssn syn-ack ttl 63 Samba smbd 3.X - 4.X (workgroup: MYGROUP)
+631/tcp open  ipp         syn-ack ttl 63 CUPS 1.1
 Service Info: OS: Unix
 
 Read data files from: /usr/bin/../share/nmap
 Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
-Nmap done: 1 IP address (1 host up) scanned in 402.78 seconds
-           Raw packets sent: 130960 (5.762MB) | Rcvd: 251 (17.724KB)
+Nmap done: 1 IP address (1 host up) scanned in 253.21 seconds
+           Raw packets sent: 130961 (5.762MB) | Rcvd: 267 (19.044KB)
 
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$
```

vimdiff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ vimdiff 10.11.1.8_scan_01.txt 10.11.1.8_scan_02.txt 
2 files to edit
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ 
```
![a246d33d7ff956acb478d3f505e27c34.png](../../_resources/69c8bfbf17574529b896112b167e2249.png)


### 10.11.1.118_scan_01.txt vs. 10.11.1.118_scan_02.txt
These pair of files are not sorted and finding the differences are best found using the diff or vimdiff commands.

diff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ diff -u 10.11.1.118_scan_01.txt 10.11.1.118_scan_02.txt 
--- 10.11.1.118_scan_01.txt     2020-01-22 07:25:58.000000000 -0500
+++ 10.11.1.118_scan_02.txt     2020-01-22 07:32:36.000000000 -0500
@@ -1,10 +1,61 @@
 kali@kali:~$ sudo nmap 10.11.1.118 -p- -sV -vv --open --reason
-Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:20 EET
+Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:26 EET
 NSE: Loaded 45 scripts for scanning.
-Initiating Ping Scan at 14:20
+Initiating Ping Scan at 14:26
 Scanning 10.11.1.118 [4 ports]
-Completed Ping Scan at 14:20, 3.01s elapsed (1 total hosts)
+Completed Ping Scan at 14:26, 0.13s elapsed (1 total hosts)
+Initiating Parallel DNS resolution of 1 host. at 14:26
+Completed Parallel DNS resolution of 1 host. at 14:26, 0.03s elapsed
+Initiating SYN Stealth Scan at 14:26
+Scanning 10.11.1.118 [65535 ports]
+Discovered open port 445/tcp on 10.11.1.118
+Discovered open port 3389/tcp on 10.11.1.118
+Discovered open port 135/tcp on 10.11.1.118
+Discovered open port 139/tcp on 10.11.1.118
+Discovered open port 49666/tcp on 10.11.1.118
+Discovered open port 49667/tcp on 10.11.1.118
+Discovered open port 49673/tcp on 10.11.1.118
+Discovered open port 49668/tcp on 10.11.1.118
+SYN Stealth Scan Timing: About 24.74% done; ETC: 14:28 (0:01:34 remaining)
+Discovered open port 5040/tcp on 10.11.1.118
+Discovered open port 49664/tcp on 10.11.1.118
+Discovered open port 49669/tcp on 10.11.1.118
+Discovered open port 49665/tcp on 10.11.1.118
+Completed SYN Stealth Scan at 14:27, 73.24s elapsed (65535 total ports)
+Initiating Service scan at 14:27
+Scanning 12 services on 10.11.1.118
+Service scan Timing: About 41.67% done; ETC: 14:29 (0:01:18 remaining)
+Completed Service scan at 14:29, 129.34s elapsed (12 services on 1 host)
+NSE: Script scanning 10.11.1.118.
+NSE: Starting runlevel 1 (of 2) scan.
+Initiating NSE at 14:29
+Completed NSE at 14:29, 1.04s elapsed
+NSE: Starting runlevel 2 (of 2) scan.
+Initiating NSE at 14:29
+Completed NSE at 14:29, 1.01s elapsed
+Nmap scan report for 10.11.1.118
+Host is up, received echo-reply ttl 127 (0.14s latency).
+Scanned at 2020-01-22 14:26:09 EET for 205s
+Not shown: 64843 closed ports, 680 filtered ports
+Reason: 64843 resets and 680 no-responses
+Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
+PORT      STATE SERVICE       REASON          VERSION
+135/tcp   open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+139/tcp   open  netbios-ssn   syn-ack ttl 127 Microsoft Windows netbios-ssn
+445/tcp   open  microsoft-ds? syn-ack ttl 127
+3389/tcp  open  ms-wbt-server syn-ack ttl 127 Microsoft Terminal Services
+5040/tcp  open  unknown       syn-ack ttl 127
+49664/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49665/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49666/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49667/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49668/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49669/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+49673/tcp open  msrpc         syn-ack ttl 127 Microsoft Windows RPC
+Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows
+
 Read data files from: /usr/bin/../share/nmap
-Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
-Nmap done: 1 IP address (0 hosts up) scanned in 3.28 seconds
-           Raw packets sent: 8 (304B) | Rcvd: 0 (0B)
+Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
+Nmap done: 1 IP address (1 host up) scanned in 205.14 seconds
+           Raw packets sent: 80818 (3.556MB) | Rcvd: 70240 (2.810MB)
+
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ 
```

vimdiff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ vimdiff 10.11.1.118_scan_01.txt 10.11.1.118_scan_02.txt 
2 files to edit
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ 
```
![d48ccf1c4e51c6d1e4ef089388370cff.png](../../_resources/21350af2a9b54feab3fe9068f7749533.png)


### 10.11.1.234_scan01.txt vs 10.11.1.234_scan02.txt
comm command
![a6c6ee62696b2f85d57b5dc0093790f9.png](../../_resources/9262bed3b5674a9e96a0d95dfac89504.png)

diff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ diff -u 10.11.1.234_scan_01.txt 10.11.1.234_scan_02.txt 
--- 10.11.1.234_scan_01.txt     2020-01-22 07:35:28.000000000 -0500
+++ 10.11.1.234_scan_02.txt     2020-01-22 07:40:20.000000000 -0500
@@ -1,41 +1,45 @@
-kali@kali:~$ sudo nmap 10.11.1.234 -p- -sV -vv --open --reason 
-Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:34 EET
+kali@kali:~$ sudo nmap 10.11.1.234 -p- -sV -vv --open --reason
+Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-22 14:36 EET
 NSE: Loaded 45 scripts for scanning.
-Initiating Ping Scan at 14:34
+Initiating Ping Scan at 14:36
 Scanning 10.11.1.234 [4 ports]
-Completed Ping Scan at 14:34, 0.14s elapsed (1 total hosts)
-Initiating Parallel DNS resolution of 1 host. at 14:34
-Completed Parallel DNS resolution of 1 host. at 14:34, 0.03s elapsed
-Initiating SYN Stealth Scan at 14:34
+Completed Ping Scan at 14:36, 0.14s elapsed (1 total hosts)
+Initiating Parallel DNS resolution of 1 host. at 14:36
+Completed Parallel DNS resolution of 1 host. at 14:36, 0.01s elapsed
+Initiating SYN Stealth Scan at 14:36
 Scanning 10.11.1.234 [65535 ports]
 Discovered open port 80/tcp on 10.11.1.234
 Discovered open port 22/tcp on 10.11.1.234
+Discovered open port 1337/tcp on 10.11.1.234
 Discovered open port 10443/tcp on 10.11.1.234
-SYN Stealth Scan Timing: About 48.37% done; ETC: 14:35 (0:00:33 remaining)
-Completed SYN Stealth Scan at 14:35, 50.47s elapsed (65535 total ports)
-Initiating Service scan at 14:35
-Scanning 3 services on 10.11.1.234
-Completed Service scan at 14:35, 11.71s elapsed (3 services on 1 host)
+Completed SYN Stealth Scan at 14:37, 49.11s elapsed (65535 total ports)
+Initiating Service scan at 14:37
+Scanning 4 services on 10.11.1.234
+Stats: 0:02:05 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
+Service scan Timing: About 75.00% done; ETC: 14:39 (0:00:25 remaining)
+Completed Service scan at 14:40, 155.52s elapsed (4 services on 1 host)
 NSE: Script scanning 10.11.1.234.
 NSE: Starting runlevel 1 (of 2) scan.
-Initiating NSE at 14:35
-Completed NSE at 14:35, 0.75s elapsed
+Initiating NSE at 14:40
+Completed NSE at 14:40, 0.70s elapsed
 NSE: Starting runlevel 2 (of 2) scan.
-Initiating NSE at 14:35
-Completed NSE at 14:35, 1.07s elapsed
+Initiating NSE at 14:40
+Completed NSE at 14:40, 1.15s elapsed
 Nmap scan report for 10.11.1.234
-Host is up, received reset ttl 63 (0.14s latency).
-Scanned at 2020-01-22 14:34:12 EET for 64s
-Not shown: 65411 closed ports, 121 filtered ports
-Reason: 65411 resets and 121 no-responses
+Host is up, received echo-reply ttl 63 (0.14s latency).
+Scanned at 2020-01-22 14:36:43 EET for 207s
+Not shown: 65381 closed ports, 150 filtered ports
+Reason: 65381 resets and 150 no-responses
 Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
 PORT      STATE SERVICE REASON         VERSION
 22/tcp    open  ssh     syn-ack ttl 63 OpenSSH 5.3p1 Debian 3ubuntu3 (Ubuntu Linux; protocol 2.0)
 80/tcp    open  http    syn-ack ttl 63 Apache httpd 2.2.14 ((Ubuntu))
+1337/tcp  open  waste?  syn-ack ttl 63
 10443/tcp open  http    syn-ack ttl 63 CoreHTTP httpd 0.5.3.1
 Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
 
 Read data files from: /usr/bin/../share/nmap
 Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
-Nmap done: 1 IP address (1 host up) scanned in 64.55 seconds
-           Raw packets sent: 73257 (3.223MB) | Rcvd: 71185 (2.847MB)
+Nmap done: 1 IP address (1 host up) scanned in 206.97 seconds
+           Raw packets sent: 72567 (3.193MB) | Rcvd: 70882 (2.835MB)
+
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$
```

vimdiff command
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$ vimdiff 10.11.1.234_scan_01.txt 10.11.1.234_scan_02.txt 
2 files to edit
kali@kali:~/gitWorkspace/pwk/oscpExercises/test2/scans$
```
![35ea1b6ffeedaf2388be23a05e2d1a42.png](../../_resources/792be46962014033958b020d76248daf.png)


# 3.6.3.1
## 3.6.3.1.1. Find files that have changed on your Kali virtual machine within the past 7 days by running a specific command in the background
```plaintext
kali@kali:~$ sudo find / -type f -mtime -7 -ls &
[1] 4109
kali@kali:~$
```

## 3.6.3.1.2. Re-run the previous command and suspend it; once suspended, background it.
```plaintext
kali@kali:~$ sudo find / -type f -mtime -7 -ls 
  1311572   1032 -rw-------   1 root     root      1050128 Sep 12 15:15 /opt/nessus/etc/nessus/nessus-fetch.db-wal
  1311636      8 -rw-------   1 root     root         5120 Sep 12 14:54 /opt/nessus/etc/nessus/nessus-fetch.db
  1311586     32 -rw-------   1 root     root        32768 Sep 12 15:14 /opt/nessus/etc/nessus/nessus-fetch.db-shm
  1311563    908 -rw-r--r--   1 root     root       926261 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/known_CA.inc
  1311673      4 -rw-r--r--   1 root     root           10 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/.expiration
  1318352     40 -rw-r--r--   1 root     root        39269 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/acme_thttpd_detect.nbin
  1318380    108 -rw-r--r--   1 root     root       108033 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/activesync_collect.nbin
  1318552     48 -rw-r--r--   1 root     root        48790 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/adobe_connect_detect.nbin
  1318598     52 -rw-r--r--   1 root     root        51198 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/adobe_experience_manager_http_detect.nbin
  1318787     68 -rw-r--r--   1 root     root        68946 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/airwatch_collect.nbin
  1318788     40 -rw-r--r--   1 root     root        38197 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/airwatch_settings.nbin
^Z
[1]+  Stopped                 sudo find / -type f -mtime -7 -ls

```

## 3.6.3.1.3 Bring the previous background job into the foreground.
```plaintext
kali@kali:~$ jobs
[1]+  Stopped                 sudo find / -type f -mtime -7 -ls
kali@kali:~$ fg
sudo find / -type f -mtime -7 -ls
  1331958     52 -rw-r--r--   1 root     root        52247 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/alcasar_detect.nbin
  1332036     48 -rw-r--r--   1 root     root        48666 Sep 11 16:48 /opt/nessus/lib/nessus/plugins/ansible_awx_detect.nbin
```

## 3.6.3.1.4 Start the firefox browser on your Kali system. Use **ps** and **grep** to identify Firefox's PID.
```plaintext
kali@kali:~$ ps -ef | grep firefox | grep -v grep | grep -v childID
kali        3477    1279  1 18:18 ?        00:01:13 /usr/lib/firefox-esr/firefox-esr
kali@kali:~$ 
```

## 3.6.3.1.5 Terminate Firefox from the command line using its PID.
```plaintext
kali@kali:~$ kill 3477
kali@kali:~$
```


# 3.7.2.1
## 3.7.2.1.1 Start your apache2 web service and access it locally while monitoring its **access.log** file in real-time.
```plaintext
kali@kali:~$ sudo systemctl start apache2
kali@kali:~$ sudo tail -f /var/log/apache2/access.log
192.168.214.10 - - [15/Sep/2020:19:53:19 -0400] "GET / HTTP/1.1" 200 3380 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"                                                                                                                                                       
192.168.214.10 - - [15/Sep/2020:19:53:19 -0400] "GET /icons/openlogo-75.png HTTP/1.1" 200 6040 "http://192.168.119.214/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:45 -0400] "GET /evil.txt HTTP/1.1" 404 494 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:54 -0400] "GET /evil/ HTTP/1.1" 200 854 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:54 -0400] "GET /icons/blank.gif HTTP/1.1" 200 431 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:54 -0400] "GET /icons/back.gif HTTP/1.1" 200 499 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:54 -0400] "GET /icons/unknown.gif HTTP/1.1" 200 529 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:54 -0400] "GET /icons/text.gif HTTP/1.1" 200 513 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:57 -0400] "GET /evil/evilshell.txt HTTP/1.1" 200 347 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:59 -0400] "GET /evil/ HTTP/1.1" 200 853 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:53:59 -0400] "GET /favicon.ico HTTP/1.1" 404 494 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:01 -0400] "GET /evil/hello.txt HTTP/1.1" 200 290 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:02 -0400] "GET /evil/ HTTP/1.1" 200 853 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:02 -0400] "GET /favicon.ico HTTP/1.1" 404 493 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:04 -0400] "GET /evil/simple-backdoor.php HTTP/1.1" 200 401 "http://192.168.119.214/evil/" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:06 -0400] "GET /evil/ HTTP/1.1" 200 853 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:06 -0400] "GET /favicon.ico HTTP/1.1" 404 493 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:09 -0400] "GET /evil.txt HTTP/1.1" 404 493 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:09 -0400] "GET /favicon.ico HTTP/1.1" 404 493 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.10 - - [15/Sep/2020:19:54:09 -0400] "GET /favicon.ico HTTP/1.1" 404 493 "-" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
192.168.214.44 - - [15/Sep/2020:23:11:07 -0400] "GET /evil HTTP/1.1" 301 582 "-" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"
192.168.214.44 - - [15/Sep/2020:23:11:07 -0400] "GET /evil/ HTTP/1.1" 200 853 "-" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                        
192.168.214.44 - - [15/Sep/2020:23:11:08 -0400] "GET /icons/blank.gif HTTP/1.1" 200 431 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                                                                                                                                                                     
192.168.214.44 - - [15/Sep/2020:23:11:08 -0400] "GET /icons/back.gif HTTP/1.1" 200 499 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                                                                                                                                                                      
192.168.214.44 - - [15/Sep/2020:23:11:08 -0400] "GET /icons/unknown.gif HTTP/1.1" 200 529 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                                                                                                                                                                   
192.168.214.44 - - [15/Sep/2020:23:11:08 -0400] "GET /icons/text.gif HTTP/1.1" 200 513 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                                                                                                                                                                      
192.168.214.44 - - [15/Sep/2020:23:11:08 -0400] "GET /favicon.ico HTTP/1.1" 404 493 "-" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"                  
192.168.214.44 - - [15/Sep/2020:23:11:22 -0400] "GET /evil/evilshell.txt HTTP/1.1" 200 348 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"
192.168.214.44 - - [15/Sep/2020:23:11:25 -0400] "GET /evil/hello.txt HTTP/1.1" 200 290 "http://192.168.119.214/evil/" "Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0"
^C
kali@kali:~$
```

## 3.7.2.1.2 Use a combination of **watch** and **ps** to monitor the most CPU-intensive processes on your Kali machine in a terminal window; launch different applications to see how the list changes in real time.

Run the command
```plaintext
kali@kali:~$ watch 'ps -ef --sort=-pcpu | head -n 6' -n 5
```
Before starting firefox
```plaintext
Every 2.0s: ps -ef --sort=-pcpu | head -n 6 -n 5                                                                                                        kali: Tue Sep 15 23:25:06 2020

UID          PID    PPID  C STIME TTY          TIME CMD
kali        1653    1608  2 17:00 ?        00:10:31 /usr/lib/joplin/joplin --type=renderer --field-trial-handle=8976702045872064593,2970756238422700746,131072 --disable-features=Spar
root         678     625  1 16:59 tty7     00:07:40 /usr/lib/xorg/Xorg :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
root         833     729  0 16:59 ?        00:02:33 docker-containerd --config /var/run/docker/containerd/containerd.toml --log-level info
kali        1205    1143  0 16:59 ?        00:02:40 xfwm4 --display :0.0 --sm-client-id 2b024a7b3-714b-4afb-9d68-4dc4408b84db
```

After starting firefox
```plaintext
Every 2.0s: ps -ef --sort=-pcpu | head -n 6 -n 5                                                                                                        kali: Tue Sep 15 23:29:15 2020

UID          PID    PPID  C STIME TTY          TIME CMD
kali        7630    7573 72 23:28 ?        00:00:10 /usr/lib/firefox-esr/firefox-esr -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 188119 -parentBuildID 202004031711
kali        7573    1279 45 23:28 ?        00:00:07 /usr/lib/firefox-esr/firefox-esr
kali        7680    7573  6 23:28 ?        00:00:00 /usr/lib/firefox-esr/firefox-esr -contentproc -childID 2 -isForBrowser -prefsLen 5752 -prefMapSize 188119 -parentBuildID 202004031
kali        1653    1608  2 17:00 ?        00:10:50 /usr/lib/joplin/joplin --type=renderer --field-trial-handle=8976702045872064593,2970756238422700746,131072 --disable-features=Spar
```

# 3.8.3.1
## 3.8.3.1.1. Download the PoC code for an exploit from https://www.exploit-db.com using **curl**, **wget**, and **axel**, saving each download with a different name
```plaintext
kali@kali:~$ curl -o shellshock_curl https://www.exploit-db.com/download/34900
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3611  100  3611    0     0  22018      0 --:--:-- --:--:-- --:--:-- 21884
kali@kali:~$ wget -O shellshock_wget https://www.exploit-db.com/download/34900
--2020-09-15 23:56:12--  https://www.exploit-db.com/download/34900
Resolving www.exploit-db.com (www.exploit-db.com)... 192.124.249.13
Connecting to www.exploit-db.com (www.exploit-db.com)|192.124.249.13|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3611 (3.5K) [application/txt]
Saving to: ‘shellshock_wget’

shellshock_wget            100%[=====================================>]   3.53K  --.-KB/s    in 0s      

2020-09-15 23:56:12 (8.95 MB/s) - ‘shellshock_wget’ saved [3611/3611]

kali@kali:~$ axel -a -n 20 -o shellshock_axel https://www.exploit-db.com/download/34900
Initializing download: https://www.exploit-db.com/download/34900
File size: unavailable
Opening output file shellshock_axel
Server unsupported, starting from scratch with one connection.
Starting download

Connection 0 finished

Downloaded 3.52637 Kilobyte(s) in 0 second(s). (17.54 KB/s)
kali@kali:~$ ls -la shellshock_*
-rw-r--r-- 1 kali kali 3611 Sep 15 23:56 shellshock_axel
-rw-r--r-- 1 kali kali 3611 Sep 15 23:55 shellshock_curl
-rw-r--r-- 1 kali kali 3611 Sep 15 23:56 shellshock_wget
kali@kali:~$ 

```


# 3.9.3.1

## 3.9.3.1.1 Create an alias named ".." to change to the parent directory and make it persistent across terminal sessions.
```plaintext
kali@kali:~/gitWorkspace/pwk$ echo "alias ..='cd ../'" >> ~/.bashrc
kali@kali:~/gitWorkspace/pwk$ bash
kali@kali:~/gitWorkspace/pwk$ ..
kali@kali:~/gitWorkspace$
```

## 3.9.3.1.2 Permanently configure the history command to store 10000 entries and include the full date in its output.
```plaintext
kali@kali:~$ echo "HISTFILESIZE=10000" >> .bashrc
kali@kali:~$ echo "HISTTIMEFORMAT='%F %T '" >> .bashrc
kali@kali:~$ bash 
kali@kali:~$ history | tail -f
 4992  2020-09-15 18:39:27 cd scans/
 4993  2020-09-15 18:39:27 ls
 4994  2020-09-15 18:39:39 vimdiff 10.11.1.234_scan_01.txt 10.11.1.234_scan_02.txt 
 4995  2020-09-15 23:48:55 history | tail -f
 4996  2020-09-15 23:49:24 echo hello
 4997  2020-09-15 23:49:25 cd
 4998  2020-09-15 23:49:28 ls
 4999  2020-09-15 23:49:33 rm test
 5000  2020-09-15 23:49:36 echo bye
 5001  2020-09-15 23:49:41 history | tail -f

```

