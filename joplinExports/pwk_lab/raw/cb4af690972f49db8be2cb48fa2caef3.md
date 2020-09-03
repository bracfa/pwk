Privilege Escalation

Privilege Escalation

1. Run the script command
`script /dev/null`
![083d3ac19ffa42b6c9ac47430cacb930.png](:/475b78d2c15f45049e64ceb8c24bb2a5)

2. Run the screen command
`screen`
![94d6ba077c07c6015b0ec92870e59017.png](:/b15c74fe1b8f491084f7bbaf2a3e219f)

3. See which users have terminal access
`cat /etc/passwd | grep /bin/bash`
![c59d86216a00abddbcfa17db59add227.png](:/c79e19b69cf34773b34d966f9f2dc51c)

4. Change to user kibosh and use the credentials from slogin. **fbX8kAx3Y7ycgnm**
`su kibosh`
![a19ae738f6350159376854518bb86eb5.png](:/234d684b2e93415784d9963037e930cb)

5. Check if kibosh has sudo rights. Yes!
`sudo -l`
![0b4c3e6542b5118f84e2e1004e73ff69.png](:/b7badc7928e94d14861815e61dd10a62)

6. Switch to root user
`sudo su -`
![d5b8910acb7b3041be45fb5546c9c7b9.png](:/eb3b498cc3f544ff8108a5b6f70b91ab)








id: cb4af690972f49db8be2cb48fa2caef3
parent_id: c4928f1fb69c4a37969773bc13fe094b
created_time: 2020-08-30T08:07:36.478Z
updated_time: 2020-09-03T05:05:13.252Z
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
user_created_time: 2020-08-30T08:07:36.478Z
user_updated_time: 2020-09-03T05:05:13.252Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1