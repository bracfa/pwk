3.7.2.1

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

id: cc7f03b6d3c94dddacb7c8c180f3dd67
parent_id: 3c74b032b131436a88a5aa8b008b9863
created_time: 2020-10-02T19:24:07.493Z
updated_time: 2020-10-02T19:24:08.928Z
is_conflict: 0
latitude: 0.00000000
longitude: 0.00000000
altitude: 0.0000
author: 
source_url: 
is_todo: 0
todo_due: 0
todo_completed: 0
source: joplin-desktop
source_application: net.cozic.joplin-desktop
application_data: 
order: 0
user_created_time: 2020-10-02T19:24:07.493Z
user_updated_time: 2020-10-02T19:24:08.928Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1