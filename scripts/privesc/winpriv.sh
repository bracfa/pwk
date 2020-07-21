#!/bin/bash

<<COMMENT
Windows escalation
COMMENT

#--MANUAL ENUMERATION--#

#-Enumerating Users-#
# Display the username
WHO=whoami
echo "$WHO"
# Get more information about the current user
net user "$WHO"
# Find other users on the system
net user

#-Enumerating Hostname-#
# Hostname command
hostname

#-Enumerating the OS version and Architecture"
# Use the systeminfo utility with findstr
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

#-Enumerating Running Processes and Services"
# List the running processes that are mapped to a specific Windows service
tasklist /SVC

#-Enumerating Networking Information-#
# Display the full TCP/IP configuration of all adapters
# High privileges are required to output processes run by privileged users
ipconfig /all
# Display the networking route tables
route print
# View the active network connections
netstat -ano

#-Enumerating Firewall Status and Rules-#
# Display the current firewall profile
netsh advfirewall show currentprofile
# If the current firewall profile is active, display the firewall rules
netsh advfirewall show rule name=all

#-Enumerating Scheduled Tasks-#
# Display tasks in a simple list format
schtasks /query /fo LIST /v

#-Enumerating Installed Applications and Patch Levels-#
# wmic only lists applications that are installed by the Windows Installer
wmic product get name, version, vendor
# List system-wide updates
wmic qfe get Caption, Description, HotFixID, InstalledOn

#-Enumerating Readable/Writable Files and Directories-#
# accesschk.exe can be used to find insecure file permissions
# TODO: check other resources for how to use this command
# The following command searches for file/directories that allow
# the Everyone group write permissions
acesschk.exe -uws "Everyone" "C:\Program Files"
# The above can also be written in PowerShell

#-Enumerating Unmounted Disks-#
# List all drive that are currently mounted, as well as those 
# physically connected but unmounted
mountvol

#-Enumerating Device Drivers and Kernel Modules-#
# Produce a list of loaded drivers
powershell
driverquery.exe /v /fo csv | ConvertFrom-CSV | Select-Object 'Display Name', 'Start Mode', Path
# Target drivers based on their name by piping the output to Where-Object
Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer | Where-Object {$_.DeviceName -like "*TheDriverName*"}

#-Enumerating Binaries that AutoElevate-#
# Check the status of AlwaysInstallElevated registry. If
# this key is enabled (set to 1) in either the HKEY_CURRENT_USER or
# HKEY_LOCAL_MACHINE, any user can run Windows Installer packages with
# elevated privileges.
# Use the reg query to check these settings
reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer

#-AUTOMATED ENUMERATION-#
# Run windows-prevesc-check from Github
# This program has many options, including: groups, shares, installed
# software, tasks, drivers, simple checks, all files, drives, security
# -related reg keys, event logs, and interesting files
windows-privesc-check2.exe --dump
