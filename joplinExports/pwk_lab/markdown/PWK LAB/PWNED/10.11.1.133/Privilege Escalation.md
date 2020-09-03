Privilege Escalation

Privilege Escalation

1. Run the script command
`script /dev/null`
![083d3ac19ffa42b6c9ac47430cacb930.png](../../../_resources/475b78d2c15f45049e64ceb8c24bb2a5.png)

2. Run the screen command
`screen`
![94d6ba077c07c6015b0ec92870e59017.png](../../../_resources/b15c74fe1b8f491084f7bbaf2a3e219f.png)

3. See which users have terminal access
`cat /etc/passwd | grep /bin/bash`
![c59d86216a00abddbcfa17db59add227.png](../../../_resources/c79e19b69cf34773b34d966f9f2dc51c.png)

4. Change to user kibosh and use the credentials from slogin. **fbX8kAx3Y7ycgnm**
`su kibosh`
![a19ae738f6350159376854518bb86eb5.png](../../../_resources/234d684b2e93415784d9963037e930cb.png)

5. Check if kibosh has sudo rights. Yes!
`sudo -l`
![0b4c3e6542b5118f84e2e1004e73ff69.png](../../../_resources/b7badc7928e94d14861815e61dd10a62.png)

6. Switch to root user
`sudo su -`
![d5b8910acb7b3041be45fb5546c9c7b9.png](../../../_resources/eb3b498cc3f544ff8108a5b6f70b91ab.png)






