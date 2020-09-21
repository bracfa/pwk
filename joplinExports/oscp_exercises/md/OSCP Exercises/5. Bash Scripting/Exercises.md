Exercises

# 5.7.3.1 Exercises

## 5.7.3.1.1. Research Bash loops and write a short script to perform a ping sweep of your target IP range of 10.11.1.0/24.
```bash
#!/bin/bash

for ip in $(seq 1 254); do
  ping -c 1 10.11.1.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f1 &
done
```

## 5.7.3.1.2. Try to do the above exercise with a higher-level scripting language such as Python, Perl, or Ruby.
```python
#!/usr/bin/python
import os

ip="10.11.1."
targets=range(1,255)

for t in targets:
  i=(ip+str(t))
  cmd = 'ping -c 1 %s | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f1 &' % i  
  stream = os.popen(cmd)
  output = stream.read()
  if output:
    print output.strip()

```

## 5.7.3.1.3. Use the practical examples in this module to help you create a Bash script that extracts JavaScript files from the access_log.txt file (http://www.offensive-security.com/pwk-files/access_log.txt.gz). Make sure the file names DO NOT include the path, are unique, and are sorted.
```bash
#!/bin/bash

cat access_log.txt | grep ".js" | awk '{print $7}' | awk -F "/" '{print $3}' | sort | uniq
```

## 5.7.3.1.4. Re-write the previous exercise in another language such as Python, Perl, or Ruby.
```python
#!/usr/bin/python

import re

js=[]

f = open("access_log.txt", "r")

for x in f:
  if re.search(".js",x):
    tmp = x.split()[6].split("/")[2]
    if tmp not in js:
      js.append(tmp)

for j in js:
  print j
```
The output:
```plaintext
kali@kali:~/gitWorkspace/pwk/oscpExercises/5_bashScripting$ python jsfiles.py
jquery.jshowoff.min.js
jquery.js
jshowoff.css
jquery.jshowoff2.js
```



