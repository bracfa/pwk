#!/bin/bash

<<COMMENT
Linux escalation
COMMENT

#--MANUAL ENUMERATION--#

#-Enumerating Users-#
# Display the username
who
# Get more information about the current user
id
# Find other users on the system
cat /etc/passwd

#-Enumerating Hostname-#
# Hostname command
hostname

#-Enumerating the OS version and Architecture-#
# View the /etc/issue, /etc/*-release, uname -a, and arch
cat /etc/issue
cat /etc/*-release
uname -a
arch

#-Enumerating Running Processes and Services"
# List system processes including those run by privileged users
ps axu

#-Enumerating Networking Information-#
# Display the full TCP/IP configuration of all adapters
ifconfig a
ip a
# Display the networking route tables
/sbin/route
routel
# View the active network connections
netstat
ss -anp

#-Enumerating Firewall Status and Rules-#
# Display the current firewall profile requires root
iptables
# A standard user may be able to read a specific file /etc/iptables
cat /etc/iptables
# Look for a file in /etc or grep the file system for iptables commands
grep -iRl "iptables" /etc
grep -iRl "iptables" /

#-Enumerating Scheduled Tasks-#
# Display tasks listed in cron
ls -lah /etc/cron*
# Check if an admin added their own tasks to /etc/crontab
cat /etc/crontab
# Check the cron logfile
grep "CRON" /var/log/cron.log

#-Enumerating Installed Applications and Patch Levels-#
# Depending on the distribution, use rpm, yum or dpkg
rpm -qa
yum list installed
dpkg -l

#-Enumerating Readable/Writable Files and Directories-#
# Use the find command to identify files with insecure permissions
find / -writable -type d 2>/dev/null

#-Enumerating Unmounted Disks-#
# List all mounted filesystems
mount
# List all drives that will be mounted at boot time
cat /etc/fstab
# View all available disks
/bin/lsblk

#-Enumerating Device Drivers and Kernel Modules-#
# View the loaded kernel modules
lsmod
# Get more info on a specific kernel module
/sbin/modinfo "kernel module name"

#-Enumerating Binaries that AutoElevate-#
# Look for SUID-marked binaries. If the SUID bit is set on a binary and
# the file is owned by root, any local user can execute that binary 
# with root privileges
find / -perm -u=s -type f 2>/dev/null

#-AUTOMATED ENUMERATION-#
# Run unix_privesc_check. Can use standard or detailed mode 
./unix_privesc-check standard > output.txt
