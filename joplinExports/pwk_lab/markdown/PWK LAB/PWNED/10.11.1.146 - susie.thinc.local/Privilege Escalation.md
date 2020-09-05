Privilege Escalation

Privilege escalation is not required, as we are root upon getting a shell

# 1. Check id
`whoami`
![a0df099e3d7f7680762d7d98b5ee9f5f.png](../../../_resources/48d5496243e040fbb7ae5bec0e059c6b.png)

# 2. Check what directory we're in
`pwd`
![9ee77662099a4564ecf846d91a78046a.png](../../../_resources/7de7cb31e6aa4a7fa400209952e176cc.png)

# 3. Check what files are in /root
`ls -la /root/*`
![9ec485c5e7b188d95c524e18133d4e6f.png](../../../_resources/39aad9dd83d64626821ddc42b26741b5.png)

# 4. Read /root/proof.txt file
`cat /root/proof.txt`
![8894a4ba820ff9200096f3d9e2e82924.png](../../../_resources/0e4165b0ade84e73ad291335dea58e54.png)
