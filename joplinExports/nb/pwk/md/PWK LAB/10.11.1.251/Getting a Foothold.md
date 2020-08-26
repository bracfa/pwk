Getting a Foothold

Getting a Foothold

# Works
1. Scan TCP Ports via NMAP using no ping switch (-Pn)
2. Scan target's port 80 via dirb non-recursive scan. Of interest is the 10.11.1.251/wp directory.
3. Browse to 10.11.1.251/wp and discover it is a WordPress site. 
4. Perform recursive scan of 10.11.1.251/wp to find the 10.11.1.251/wp/wp-admin page which redirects to the 10.11.1.251/wp/wp-login page
5. Enumerate WordPress users using WPScan. 1 username found: admin
6. Dictionary password attack using wordlist rockyou.txt via WPScan. Found password. Creds -> admin:monkey. Verified that the login works
7. The WordPress website 10.11.1.251/wp is written by Sean, which says we can log on to his box with username sean and that we already know the password (monkey)
8. Attempt SSH into the box using sean:monkey. Its works!
![691cf4ba3e46130793bd799786785d24.png](../../_resources/a8efe4329b294acb8840d31f47c1a2ad.png)

