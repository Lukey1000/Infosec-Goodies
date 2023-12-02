
``` bash
ffuf -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt:FUZZ -u http://devvortex.htb:80/ -H 'Host: FUZZ.devvortex.htb' -fs 154

```

```

Adding vhosts to hosts oneliner

``` bash
sudo sh -c 'echo "10.1.2.3 devvortex.htb" >> /etc/hosts'
```