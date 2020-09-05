Interesting Commands

Interesting Commands

# Initial Information Gathering
`ipconfig /all`
![67eabac2e68a02702833ee75b62f7242.png](../../../_resources/8f3c60b5fd8e43b2b14020e80b11eac9.png)

`systeminfo | findstr /B /C:"OS Name" /C:"OS Version"`
![c0048483ca06ad3f6d1721c46a99eece.png](../../../_resources/7c06e1142d594717b706c8f19553365c.png)

`hostname`
![830aa0cbf4b74bac54055b4565c31e29.png](../../../_resources/2fd6197f19f54562af0c3d757e0b3d54.png)

`echo %username%`
![f641f620627b30fcd49e1ef39c653b60.png](../../../_resources/aa08a49bb3334661b6b730f69fe91242.png)

`net Administrator`
![ff83546de89e427321c595f7861e0c97.png](../../../_resources/bba6fb46fcae4807a239affdfc46555c.png)

`net users`
![dd4d5500e334ce3dc49a898d2d7a34f2.png](../../../_resources/49dc1654abdc49a8ad693b2512fe86cf.png)

`net user bob`
![ebf52e01ba96df87de3c49e389ad9d8a.png](../../../_resources/315f4d257e764f53b696990177359081.png)

`net user IUSR_BOB`
![93302ad63f5d72bf0ed0727acf819cbc.png](../../../_resources/5bd8e0abeb7a4173bdc0bc770dc510de.png)

`net user IWAM_BOB`
![5c7bd69aa22cbb516e447d3aa72bedbd.png](../../../_resources/8278f7d7c967473dae94ff07bd5fc566.png)

`net user Guest`
![04cee78512ced5882a927b216a95f9be.png](../../../_resources/3ff1bd23092c431e8210193e2ccf6e5e.png)

`net user HelpAssistant`
![4fe3a9841fab84f53f8f858ac8efe556.png](../../../_resources/a68dd053944a4033a78ccb552536600e.png)

`net user SUPPORT_388945a0`
![3980860a65910eb6747fbe72a46097d4.png](../../../_resources/10b6c3f03fea41ed98c287af352d5c49.png)

`ipconfig /all`
![cbcfade154cc68ea461e2f8b34e23d6f.png](../../../_resources/bfad285f330647418da7340b4f63fb69.png)

`route print`
![628a75992a975fbea0e4c49baf2315a3.png](../../../_resources/cc9d85541df240c5a577d01975a9db62.png)


`arp -A`
![5b4b60f3583874a1a972a02e975e2c02.png](../../../_resources/2a476dae604a450ebb29d58ce803acc7.png)

`netstat -ano`
![8b49f5d7fce56cba36f8b426f177eff5.png](../../../_resources/966bcac81d5d49f99f33f6c02bdc1147.png)

`netsh firewall`
![ce1884b9bb07fcc63e69ca1e970b0bb7.png](../../../_resources/9ab4aba01f774502b55858d344be6673.png)

`schtasks /query /fo LIST /v`
![2df47153c63388abfd96bd1cbd2b8395.png](../../../_resources/46ce59ee00514e10b87c895b9de5acd6.png)

`tasklist /SVC`
![9b7b00bb6e94b9c7de9678d5260cf79a.png](../../../_resources/3fefd8157c3c4590baf7366880e15903.png)

`net start`
![b1d324f3e1ae1635c984ab064b6b050f.png](../../../_resources/a17afc9c227f476db9f9e8e0b3f82898.png)

`DRIVERQUERY`
DRIVERQUC:\WINDOWS\system32>DRIVERQUERY
DRIVERQUERY                                                                           
                                                                                      
Module Name  Display Name           Driver Type   Link Date                           
============ ====================== ============= ======================              
ACPI         Microsoft ACPI Driver  Kernel        8/29/2002 9:09:03 AM                
ACPIEC       ACPIEC                 Kernel        8/17/2001 9:57:55 PM                
AFD          AFD Networking Support Kernel        8/17/2011 2:49:53 PM                
agp440       Intel AGP Bus Filter   Kernel        8/17/2001 9:57:59 PM                
AsyncMac     RAS Asynchronous Media Kernel        8/17/2001 9:55:29 PM                
atapi        Standard IDE/ESDI Hard Kernel        8/29/2002 9:27:48 AM                
Atmarpc      ATM ARP Client Protoco Kernel        8/17/2001 9:46:40 PM                
audstub      Audio Stub Driver      Kernel        8/17/2001 9:59:40 PM  
Beep         Beep                   Kernel        8/17/2001 9:47:33 PM  
cbidf2k      cbidf2k                Kernel        8/17/2001 9:52:06 PM  
Cdaudio      Cdaudio                Kernel        8/17/2001 9:52:26 PM  
Cdfs         Cdfs                   File System   8/29/2002 9:58:50 AM  
Cdrom        CD-ROM Driver          Kernel        8/29/2002 9:27:55 AM  
CmBatt       Microsoft AC Adapter D Kernel        8/29/2002 9:09:04 AM  
Compbatt     Microsoft Composite Ba Kernel        8/17/2001 9:57:58 PM  
Disk         Disk Driver            Kernel        8/29/2002 9:27:56 AM  
dmboot       dmboot                 Kernel        8/17/2001 9:58:34 PM  
dmio         Logical Disk Manager D Kernel        8/17/2001 9:58:27 PM  
dmload       dmload                 Kernel        8/17/2001 9:58:15 PM  
Fastfat      Fastfat                File System   8/29/2002 10:12:45 AM 
Fdc          Floppy Disk Controller Kernel        8/17/2001 9:51:22 PM  
Fips         Fips                   Kernel        8/18/2001 2:31:49 AM  
Flpydisk     Floppy Disk Driver     Kernel        8/29/2002 9:27:43 AM  
Ftdisk       Volume Manager Driver  Kernel        8/17/2001 9:52:41 PM  
Gpc          Generic Packet Classif Kernel        8/17/2001 9:54:19 PM  
i8042prt     i8042 Keyboard and PS/ Kernel        8/29/2002 10:06:37 AM 
Imapi        CD-Burning Filter Driv Kernel        8/29/2002 9:28:05 AM  
IntelIde     IntelIde               Kernel        8/29/2002 9:27:47 AM  
IpFilterDriv IP Traffic Filter Driv Kernel        8/17/2001 9:55:07 PM  
IpInIp       IP in IP Tunnel Driver Kernel        8/17/2001 9:55:10 PM  
IpNat        IP Network Address Tra Kernel        8/29/2002 9:36:12 AM  
IPSec        IPSEC driver           Kernel        8/29/2002 10:07:19 AM 
IRENUM       IR Enumerator Service  Kernel        8/17/2001 9:51:19 PM  
isapnp       PnP ISA/EISA Bus Drive Kernel        8/17/2001 9:58:01 PM  
Kbdclass     Keyboard Class Driver  Kernel        8/29/2002 9:26:59 AM  
KSecDD       KSecDD                 Kernel        8/17/2001 9:50:01 PM  
mnmdd        mnmdd                  Kernel        8/17/2001 9:57:28 PM  
Modem        Modem                  Kernel        8/17/2001 9:57:35 PM  
Mouclass     Mouse Class Driver     Kernel        8/29/2002 9:27:00 AM  
MountMgr     MountMgr               Kernel        8/17/2001 9:47:36 PM  
MRxDAV       WebDav Client Redirect File System   8/17/2001 9:50:20 PM  
MRxSmb       MRXSMB                 File System   8/29/2002 9:59:51 AM  
Msfs         Msfs                   File System   8/17/2001 9:50:02 PM  
Mup          Mup                    File System   8/29/2002 10:12:53 AM 
NDIS         NDIS System Driver     Kernel        8/29/2002 10:09:23 AM 
NdisTapi     Remote Access NDIS TAP Kernel        8/17/2001 9:55:29 PM  
Ndisuio      NDIS Usermode I/O Prot Kernel        8/29/2002 9:35:40 AM  
NdisWan      Remote Access NDIS WAN Kernel        8/29/2002 9:58:38 AM  
NDProxy      NDIS Proxy             Kernel        8/17/2001 9:55:30 PM  
NetBIOS      NetBIOS Interface      File System   8/29/2002 9:35:45 AM  
NetBT        NetBios over Tcpip     Kernel        8/29/2002 10:01:56 AM 
nm           Network Monitor Driver Kernel        8/29/2002 9:34:32 AM  
Npfs         Npfs                   File System   8/17/2001 9:50:03 PM  
Ntfs         Ntfs                   File System   8/29/2002 10:13:37 AM 
Null         Null                   Kernel        8/17/2001 9:47:39 PM  
NwlnkFlt     IPX Traffic Filter Dri Kernel        8/17/2001 9:54:05 PM  
NwlnkFwd     IPX Traffic Forwarder  Kernel        8/17/2001 9:54:08 PM  
Parport      Parallel port driver   Kernel        8/29/2002 9:27:29 AM  
PartMgr      PartMgr                Kernel        8/18/2001 2:32:23 AM  
ParVdm       ParVdm                 Kernel        8/17/2001 9:49:49 PM  
PCI          PCI Bus Driver         Kernel        8/29/2002 9:09:10 AM  
Pcmcia       Pcmcia                 Kernel        8/29/2002 9:09:09 AM  
PCnet        AMD PCNET Compatable A Kernel        6/5/2001 8:54:43 PM   
PptpMiniport WAN Miniport (PPTP)    Kernel        8/29/2002 10:12:46 AM 
Processor    Processor Driver       Kernel        8/29/2002 9:05:03 AM  
Ptilink      Direct Parallel Link D Kernel        8/17/2001 9:49:53 PM  
RasAcd       Remote Access Auto Con Kernel        8/17/2001 9:55:39 PM  
Rasl2tp      WAN Miniport (L2TP)    Kernel        8/29/2002 10:06:36 AM 
RasPppoe     Remote Access PPPOE Dr Kernel        8/17/2001 9:55:33 PM  
Raspti       Direct Parallel        Kernel        8/17/2001 9:55:32 PM  
Rdbss        Rdbss                  File System   8/29/2002 9:58:48 AM  
RDPCDD       RDPCDD                 Kernel        8/17/2001 9:46:56 PM  
rdpdr        Terminal Server Device Kernel        8/29/2002 9:06:34 AM  
RDPWD        RDPWD                  Kernel        8/29/2002 9:40:38 AM  
redbook      Digital CD Audio Playb Kernel        8/29/2002 9:27:45 AM  
serenum      Serenum Filter Driver  Kernel        8/17/2001 9:50:13 PM  
Serial       Serial port driver     Kernel        8/29/2002 10:08:27 AM 
Sfloppy      Sfloppy                Kernel        8/29/2002 9:27:56 AM  
sr           System Restore Filter  File System   8/29/2002 9:17:56 AM  
Srv          Srv                    File System   8/18/2001 2:32:06 AM  
swenum       Software Bus Driver    Kernel        8/17/2001 9:48:47 PM  
Tcpip        TCP/IP Protocol Driver Kernel        8/29/2002 9:58:10 AM  
TDPIPE       TDPIPE                 Kernel        8/17/2001 9:46:49 PM  
TDTCP        TDTCP                  Kernel        8/17/2001 9:46:43 PM  
TermDD       Terminal Device Driver Kernel        8/29/2002 9:40:32 AM  
Udfs         Udfs                   File System   8/29/2002 9:06:18 AM  
Update       Microcode Update Drive Kernel        8/18/2001 4:53:56 AM  
VgaSave      VgaSave                Kernel        8/29/2002 9:32:03 AM  
vmci         VMware VMCI Bus Driver Kernel        5/18/2013 2:17:35 AM  
vmmouse      VMware Pointing Device Kernel        6/4/2012 10:15:28 AM  
vmscsi       VMware Storage Control Kernel        5/31/2012 10:17:07 AM 
vmxnet       VMware Ethernet Adapte Kernel        5/8/2012 10:38:41 AM  
vmxnet3ndis5 vmxnet3 NDIS 5 Etherne Kernel        9/27/2013 10:19:01 AM 
vmx_svga     vmx_svga               Kernel        11/18/2014 3:12:59 AM 
VolSnap      VolSnap                Kernel        8/17/2001 9:53:19 PM  
vsock        vSockets Driver        Kernel        8/1/2013 3:44:46 AM   
Wanarp       Remote Access IP ARP D Kernel        8/17/2001 9:55:23 PM  
WS2IFSL      Windows Socket 2.0 Non Kernel        8/17/2001 9:55:58 PM ERY`


`wmic /?`
![2ff52dedec24d0cef01577f9b960211b.png](../../../_resources/33b6c810e1064ef88fac2b0b29e77205.png)
















