Attack Vector 14 - Bad Ph33r

Attack Vector 14 - Bad Ph33r


From the website... but how do we find this website???
![e8d99ba2907c6ea445346e1ef02bb6c5.png](../../../_resources/c466882376ba4749ab6f822e229be773.png)



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