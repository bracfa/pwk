18.1.2.1

# 18.1.2.1
## 18.1.2.1.1. Inspect your Windows and Linux clients by using the tools and commands presented in this section in order to get comfortable with manual local enumeration techniques.

### Debian
#### Enumerating Users
`whoami` displays the username the shell is running as.
![e11fb48fa9b10f33883f62dbb8e5e5a7.png](:/8e14a39ac7d14f82ac38d8fe905d34d1)
`whoami /all` shows all the info that can be gleaned from whoami
![7ba736ea6e93489532413f9023e6d435.png](:/f3bcd8d9d3744bfd80116f720d0e7237)
`net user` lists user accounts on the system
![025b111d273c8f4c3e7d08697e8151b1.png](:/fb98d284141346fa9c2c79c7f2e37f3d)
`net user /help` shows all the options for creating/modifying a user


#### Enumerating the Hostname
Run `hostname`. This is installed on Windows and Linux.
![5c34ecfbcdd47148d5c1059e34cff966.png](:/2ea51df82126412f89c6a83a89c0fcba)


#### Enumerating the Operating System Version and Architecture
We see that we are running MS Win 10 Pro with the following command:
`systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"`
![7ea04427ab813a4ce49dd32ada0dd87e.png](:/e18f5b7f8804425b8facb3c600fced03)
`systeminfo` by itself shows a lot of info
![155d909185ab1ff54e86b7df6124665d.png](:/89fcbfa7f6da4702b9e4f2c5b603e0c6)


#### Enumerating Running Processes and Services
List the running processes. Note that this *DOES NOT* list processes run by privileged users on a Windows.
`tasklist /SVC`
![4e012092c9205df8cb20fa4f76927643.png](:/8ced4039c771472ba460d2fea863c520)


#### Enumerating Networking Information
Determine if the target is connect to multiple networks and could be used as a pivot. Also, the presence of specific virtual interfaces may indicate the existence of virtualization or antivirus software.

We can also investigate port bindings to see if a running service is only available on a loopback address rather than a routable one.

Display the full TCP/IP configuration of all adapters:
`ipconfig /all`
![6011725b1f45a79e69eb51e2303b36a9.png](:/00535a4e379540dfa56f3ba98adbaabd)

Display the network routing tables:
`route print`
![8d7afa65a3769c8fd220b6aa29872009.png](:/dfcb7fd217484a3cbf5b186111ed6206)

View active network connections. The netstat command will list all the listening ports, and include info about established connections that could reveal other users connected to this machine.
`netstat -ano`
![a8f4c9c084e7672868ea5b8c410852ba.png](:/f0ff9af9c8124e7bb5cb25d90913809f)


#### Enumerating Firewall Status and Rules
If a network service is not remotely accessible because it is blocked by the firewall, it is generally accessible locally via the loopback interface. If we can interact with these systems locall, we may be able to exploit them to privesc. As well, we can get info about inbound/outbound port filtering to facilitate port forwarding and tunnelling.
`netsh advfirewall show currentprofile`
![4909b8af4c6cd1c3ed30471f4b94ce05.png](:/87b50751c19c4dc4b4643b21abf25979)

The firewall profile is active, so let's look at the rules. Take note of any apps that can establish both inbound and outbound connections to and from any IP address using any protocol
`netsh advfirewall firewall show rule name=all`
![d6a33adb45237ba337012678b46cc776.png](:/8a10295558f741228e1fc5062edc8739)
`netsh help` shows the different commands in this context
![149c135e48a513f6228fe3d1001c3adf.png](:/0abe90daa47b49f2906bc56a78bd3f7c)


#### Enumerating Scheduled Tasks
If these systems are misconfigured, or the user-created files are left iwt insecure permissions, we can modify these files that will by executed by the scheduling system at a high privilege level.
`schtasks /query /fo LIST /v`
![9ee2b9caf59e2f9b00d98352ebe61c91.png](:/caa8cbd2684748ad9485fba080569744)


#### Enumerating Installed Applications and Patch Levels
We can use the wmic utility to list all installed applications. However it only lists applications that are installed by the **Windows Installer**.
`wmic product get name, version, vendor`
![6088920eeb6038bb767109e2ff966de9.png](:/b1c11d074ac54c8e8923c11d18af98ae)

List system-wide updates
`wmic qfe get Caption, Description, HotFixID, InstalledOn`
![8663beacfc0420a7547c801542d76625.png](:/c52fcd282a6a4ecca04a3e2d62b124d3)


#### Enumerating Readable/Writable Files and Directories
Check the permissions of each file and directory for hard-coded credentials.
This example uses **-u** to suppress errors, **-w** to search for write access permissions, and **-s** to search recursively. If the resultant file(s) are to be executed by a privileged user or a service account, we could attempt to overwrite it with a malicious file of our choice such as a reverse shell.
`accesschk.exe -uws "Everyone" "C:\Program Files"`
![64ea2310cb1a7dfeb26fde1ca3fab722.png](:/215750190c1a4d2684132414b20204ee)

PowerShell can also be used in cases where we can't transfer/execute arbitrary binary files on our target system. In this exapmle, we search for any object that can be modified by members of the Everyone group
`Get-ChildItem "C:\Program Files" -Recurse | Get-ACL | ?{$_.AccessToString -match "Everyone\sAllow\s\sModify"}`
![27b70563f7b0b05c784d8004dfaa7d62.png](:/76954922615e472ea5ae92230cf57d31)


#### Enumerating Unmounted Disks
Drives are automatically mounted at boot time. If there are unmounted drives, check the mount permissions. The following command will list currently mounted drives as well as those that are physically connected but unmounted. In this example, we see that there are 2 mount points that map to the C: and D: drives. There is also a volume with a globally unique identifier 93131ba8-0000-0000-0000-100000000000 which has no mount point.
`mountvol`
![c2eb0c6598a5f93fe2521bba4b6684fd.png](:/28b3da1bc03c4027a9f92fa7560e37ad)


#### Enumerating Device Drivers and Kernel Modules
Compile a list of drivers and kernel modules that are loaded on the target.
`driverquery.exe /v /fo csv | ConvertFrom-CSV | Select-Object ‘Display Name’, ‘Start Mode’, Path`
![c44072dae05abe30cac40c3c4c877277.png](:/d00e98a3c44d45349d9e83ce3d784956)

Take an extra step to request the version number of each loaded driver. Here is an example to look for VMware devices
`Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer | Where-Object {$_.DeviceName -like "*VMware*"}`
![2f66a311abb79d8f6445455e89435c89.png](:/99f24d80f08d4a1d94bff39b299ead3d)


#### Enumerating Binaries that AutoElevate
Check the status of the *AlwaysInstallElevated* registry setting. If this key is enabled (set to 1) in either *HKEY_CURRENT_USER* or *HKEY_LOCAL_MACHINE*, any user can run Windows installer packages with elevated privileges. Check these settings using reg query.In this example, the registries are not found.
`reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer`
`reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer`
![71bffc6cfcf28b1a506886a84b8e8763.png](:/1d0cc46de5f74a7f9e4482a29e0cd1ff)



### Linux
#### Enumerating Users
`whoami`
`id`
`cat /etc/passwd`
![120b89481bf16caef4f9fbb084e3eefb.png](:/d2be737ae4544746854f17eeba2e1c19)


#### Enumerating the Hostname
`hostname`
![ce459d92868b31b608ca1093ac5bf205.png](:/7506ba2d1cac41d6ada8e842c7b14b09)


#### Enumerating the Operating System Version and Architecture
`cat /etc/issue`
`cat /etc/*-release`
`uname -a`
![155a56f2452ccd7fe4025619c5be018f.png](:/7779ce2946294041ad96684f1b95f86a)


#### Enumerating Running Processes and Services
`ps axu` lists system processes (including privileged users)
![1f895e37f5344b850956e163e42adc09.png](:/cb7cfb4b260546b4848031dfbdaa8561)


#### Enumerating Networking Information
`ifconfig` lists the TCP/IP config of every network adapter
![144929f1b9426b6537ab2a8aed5dd205.png](:/d86cb885d2c14551ab4794a425009c90)
`ip a` also lists the TCP/IP config of every network adapter
![e24ac5098f4832c856a75d2f54ea4c2d.png](:/72556aab15684ca99fc29fec89359d00)
`/sbin/route` displays network routing tables
![25fd0a056ae894008a73efe7ff6a0bec.png](:/1a01da0a03c249f0b1390b40c3787e33)
`ss -anp` display ative network connections and listening ports
![c08afdb4fa9e322941bfd5e7b4e63d0b.png](:/1da681038d85485bbde425053b09821a)
`ss -anp | grep -e LISTEN -e ESTAB` lists only listening/established connections 
![bf5d1b05e2c1fe2e821e1423de4d766e.png](:/ac4a9afe36fa464092f3dd5d9060fb50)


#### Enumerating Firewall Status and Rules
`iptables` this can only be run as root
![ceb17490d0463c137f31e3e7b865cb38.png](:/168724792ec148d393c8dcd5b609a782)
We can also search for files created by the *iptables-save* command, which is used to dump the firewall configuration to a file specified by the user. This file is then usually used as input for the *iptables-restore* command and used to restore the firewall rules at boot time. If a system administrator had ever run this command, we could search the configuration directory (/etc) or grep the file system for iptables commands to locate the file. If the file has insecure permissions, we could use the contents to infer the firewall configuration rules running on the system.


#### Enumerating Scheduled Tasks
`ls -lah /etc/cron*`
![1efa21d9b932fe121e780105b113452e.png](:/415d2bcce59844358f8ee14bd2b89abc)
It is worth noting that system administrators often add their own scheduled tasks in the /etc/crontab file. These tasks should be inspected carefully for insecure file permissions as most jobs in this particular file will run as root.
`cat /etc/crontab`
![280471ad9971f7442e6f6c74a7f8b15e.png](:/1c8d1a4fd1d44da591df1dcb5f449702)



#### Enumerating Installed Applications and Patch Levels
`dpkg -l`
![067ad33138847328a54e4d53a0969283.png](:/16a6bd6c665849e08194051dc9bfc58d)


#### Enumerating Readable/Writable Files and Directories
`find / -writable -type d 2> /dev/null` searches for every directory writable by the current user on the target system
![70c470f26d4c1be401876adb577c099e.png](:/d73a69b1afc444d8a6306d624f66e330)


#### Enumerating Unmounted Disks
`mount` lists all mounted filesystems
![63374a744dddad4411065aaea1bc565d.png](:/e39aa698ffeb420ea423dd50953ce30a)
`cat /etc/fstab` lists all drives that will be mounted at boot time
![9771f05322cc1c70d39b9fa317e36059.png](:/3a7597c744d1455cb9e18ddc0de3455a)
`/bin/lsblk` view all available disks
![09f5fe394378815033b83629586ae9d4.png](:/9e5462a808784efd830d4d025b57dd4b)


#### Enumerating Device Drivers and Kernel Modules
`lsmod`Enumerate loaded kernel modules
![17c9feb2473ee206cf860fad466ce520.png](:/1942edcf33a04cfdaba6863182daeb8f)
`/sbin/modinfo libata`Find out more about a module, in this example libata
![b21dfba02baf8df06d7f9cfe5923472b.png](:/499912ef8e8341a1af73c3d457e4337f)


#### Enumerating Binaries that AutoElevate
`find / -perm -u=s -type f 2>/dev/null` searches for SUID-marked binaries
![96bd2735e767d750565b5619266e4deb.png](:/4aa9bd0a1de74614b41646bb2859dc73)


## 18.1.2.1.2. Experiment with different windows-privesc-check and unix_privesc_check options.
### windows-privesc-check
`windows-privesc-check2.exe --dump -G`
![27c4a8baf7a2fd67a0c89b91dbe1d64f.png](:/67bc188112a04a7794ec79f48a9a6c91)
`windows-privesc-check2.exe --dump --drives`
![6f7082271c5e4c8ea6e5b7ebad5e30d9.png](:/057e1226f0ac4e97916c7113747b14e6)
`windows-privesc-check2.exe --dump --shares`
![18c314b61f419fa9c3413602686fba35.png](:/1be01ce7d9e34f1dbab53008c44930ea)
`windows-privesc-check2.exe --dump --tasks`
![b2e5e1ce3d0ae825d8d37294c568828d.png](:/136ea57c9c754d00854eb679b88f2689)
`windows-privesc-check2.exe --dump --reg_keys`
![52a02c3d965b0d0929554292226f3d2c.png](:/de2e989fc6354228a188434330273573)
`windows-privesc-check2.exe --dump --eventLogs`
![321ceb6792975c57e765666b6e3ac57e.png](:/08c2eb4bdad84a2e95ebfee2fcab23de)
`windows-privesc-check2.exe --dump --installed_software`
![e3062599efc139db8ab2fc0381706479.png](:/869c843834844fccb3ae8b4aaab71755)




### unix_privesc_check
`./unix-privesc-check standard`
![ca2c784b1b019095d4688834c47bfaf7.png](:/7f384d9e3eac435a8d588d1fa78ffc11)
`./unix-privesc-check detailed`
![a0365615fcd5281cc54b331761ffc456.png](:/f4cdc724417340feae15428f91d23ec8)




id: bc9eb7cbae544aea85b8bac8d4f8fe07
parent_id: d27f6ba7395a474297651ea8cbb7c0ef
created_time: 2020-10-02T10:18:24.039Z
updated_time: 2020-10-03T08:16:14.235Z
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
user_created_time: 2020-10-02T10:18:24.039Z
user_updated_time: 2020-10-03T08:16:14.235Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1