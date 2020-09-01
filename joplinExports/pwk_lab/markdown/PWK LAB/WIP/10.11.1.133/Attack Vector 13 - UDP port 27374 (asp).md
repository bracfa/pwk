Attack Vector 13 - UDP port 27374 (asp)

The netcat scan showed one open port 27374. **I forget exactly what command was used.** The network was unreachable starting at 22356 and lower. May need to run this again. 
`sudo nc -nv -u -z -w 1 10.11.1.115 1-65535`
![3bd22feb862e80fb36ae2725f8162a97.png](../../../_resources/8220c671d7c04432933b72de303d1ef3.png)

[2020-08-30_230322_nc_UDP_allPorts__10.11.1.133.txt](../../../_resources/6c5a7011f3c64f24bee912d8bc63ed75.txt)

Ran nc on the remaining ports 
`sudo nc -nv -u -z -w 1 10.11.1.133 1-22356 > nc_1-22356.txt 2>&1`
**Still need the output for this**

Netcat for just UDP port 27374 is open (asp)
![6fd27c0526d7da52b089110de008955a.png](../../../_resources/6c226f760652437297d6cd2c03397c01.png)

NMAP scan for UDP all ports show all are open/filtered if using source port 53.
![cd06d5da3ae950a514032292217436d4.png](../../../_resources/a59e9de24d4840e79113984a4904c091.png)

Socat connection didn't reveal any new info
![24bdb3b1517f3dda1ee7f57e64aea1aa.png](../../../_resources/41e8f45cc336414f8cb5e62ff73c5f57.png)






Telnet to that port. Won't work! Telnet only uses TCP!
`telnet 10.11.1.133 27374`
![a727890fd58202642d27358449882d9a.png](../../../_resources/366240f24e2743b4b0c56761651b0c76.png)

