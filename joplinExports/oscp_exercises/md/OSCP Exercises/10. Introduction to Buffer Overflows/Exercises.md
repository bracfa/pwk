Exercises

# 10.2.5
## 1. Repeat the steps shown in this section to see the 12 A's copied onto the stack.
### Open Immunity Debugger
![024101da8c6bb477f467d67cd64f6a37.png](../../_resources/de4ea238a3634258af04287dbd8f7688.png)

### Open the strcpy.exe file and 12 A's as an argument
![e6981e3f3d602740521acad02b10d62e.png](../../_resources/a1b8558086cd4800bec3f09ce26de753.png)

### Immunity Debugger launches and stops at the program entry point
![014575d38b4a5db5aa9a8de7e6221590.png](../../_resources/e5fc890ed62343c68a591e1fe311e2d8.png)

### Right-click on the disassembly window -> Search for -> All referenced text strings
![a189345f9f47167f90756d8a91d0f3c9.png](../../_resources/dca2e385d9e742aa9f777b5fba10e908.png)

### The result window. Double click on the "Error - You must supply at least one argument"
![d4fc7c23c1a1227e76c1ec8d22d9cc3d.png](../../_resources/c00b23d256014964b1046bf067f4e765.png)

### We are returned to the disassembly windows, but this time inside the main function
![7323ed674e86a7d444807a4c0d57c4fb.png](../../_resources/43a110b13a474878b19e5092c1a75b96.png)

### Set a breakpoint on the strcpy line by pressing F2. The address will turn light blue.
![bb84490e337901c6e5b2dd64068e9687.png](../../_resources/ea69d004efbb4040b47a47bfaf9f1a82.png)

### Continue the exection flow by pressing F9
![638f85e1daf76f527eb39c046388e9c0.png](../../_resources/fdba4517b0d145219c4795b126356994.png)

### Notice that execution stopped at the breakpoint just before the call to the strcpy function (address 0x004015AA). EIP is set to this address as well.
![50dba6e3cab9a8782158370688e07151.png](../../_resources/7b8ab9065d564751bd727982d5f4db5d.png)

### Press F7 once
![4771d0ab6e7aa575da1ceaf51ad21762.png](../../_resources/69647f68785b4b53a9f0ed6a4410d2cf.png)

### Then press F7 a second time and now we’re in the strcpy function. Notice the address change.
![aba08eee0e6616ab43bb2f3c15b3aa2f.png](../../_resources/c658ff168a5f44f79a29c7246fc14004.png)

### Double-click the strcpy destination address (0x0065EFE70) in the stack pane.
![ac02a41231ada73e9b6fafbe1637d1bf.png](../../_resources/cc8fcb22f4b442e2829ce9cb646e870f.png)

### Notice that now we see relative (positive and negative) offsets. The arrow indicator (==>) refers to address 0x0065FE70. Also notice that 0x004015AF is at the top of the stack and is where we will return once strcpy has completed.
![32481cc650eebfd75fa619f2a879f847.png](../../_resources/71cec5510d8947a888c9bb33629dcc0e.png)

### Press CTRL+F9 to continue to the end of the strcpy function. The 12 A’s are now written into the buffer, and we are within the 64-byte buffer limit. Take note of theaddress at +4c (0x004013E3)
![f833fcac548ffa99cb82768a0db8e126.png](../../_resources/02265d7c92494da9998ef8ffa7da95e3.png)

### Press F7 to arrive back to the main function as indicated by the (-14) address. The MOV EAX,0 instruction sends the exit status 0 to the operating system
![3e54650d84b7d68290b9432a25717372.png](../../_resources/ac456a4a917a470aaf20686e0d3da493.png)

### At this point, we have left our main function. Press F7 again, and you’ll be at the LEAVE function 
![9b71d88872b128ed746e7c64e1cdc00d.png](../../_resources/efaaeadcb287490490a7ab5dd739a78b.png)

### Press F7 again to return to pop the main function return address from the top of the stack and execute the code there.
![ee494c63952297477dcf00c13a332716.png](../../_resources/13ffd08fd07d4175b73fbbe0a2f6d98b.png)

### Press F9 to run until the program is terminated.
![43a350a6b1b459f0c4185a1b3cd57d36.png](../../_resources/af03caf7844e4a74a0f7393208dd5f4a.png)



## 2. Supply at least 80 A's and verify that EIP after the *strcpy* will ontain the value 41414141.
### Supply the 80 A's as an argument
![270e619bd317a5e6db3eb7898bdcfc78.png](../../_resources/cd733729407a4be4932064d0efcf536f.png)

### The stack layout showing the 80 A's
![5849ccd91c6c899bf91f417e13c34671.png](../../_resources/a60e123236874de8accaf5e5fb1b6656.png)

### EIP points to 41414141, which is address 0x4c
![4c272df55ea7d311498770c7a5ac893c.png](../../_resources/fb6fab3a9d69430282aa7c9eb779e793.png)



