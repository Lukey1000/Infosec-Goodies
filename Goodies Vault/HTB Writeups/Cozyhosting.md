Target IP: 10.10.11.230

```bash
sudo nmap 10.10.11.230 -sC -sV -oA -p- cozyhosting 
```

![[Pasted image 20231203185411.png]]

Nmap shows port 7777 with service cbt?, as well as a vhost.
Quickly add it to hosts:

``` bash
sudo sh -c 'echo "10.10.11.230 cozyhosting.htb" >> /etc/hosts'
```

![[Pasted image 20231203191504.png]]

/admin redirects us straight to login.
/asdfjkl;, quote, plain are all error with status 404
/error though gave a status 999:

![[Pasted image 20231203191438.png]]

I popped this into google and it appears to be an error with Springboot. What do you know, there's a Hacktricks page on Springboot!
https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/spring-actuators

Further research reveals that there's a ton of interesting things that can be under actuator.

![[Pasted image 20231203192718.png]]

Sessions looks promising.



![[Pasted image 20231203192938.png]]

{"CA6521756CF530BAFAFF7DBAEDFCBDF1":"kanderson"}

We get a potential username. Since this was in sessions, it's likely that this is a Cookie.

The API doco at https://docs.spring.io/spring-boot/docs/current/actuator-api/htmlsingle/#mappings shows us several more actuator directories including mappings.

![[Pasted image 20231203193954.png]]

Additionally, there is /addhost that looks interesting, both are access denied for now.


Todo: add rest of notes here regarding getting hash.

![[Pasted image 20231204194405.png]]

![[Pasted image 20231204194607.png]]

Well that was an easy privesc, copy pasted straight from hacktricks! 

``` bash
sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
```
