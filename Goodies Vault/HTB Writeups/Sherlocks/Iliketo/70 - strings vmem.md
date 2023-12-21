```bash
┌──(kali㉿kali)-[~/htb/iliketo]
└─$ strings I-like-to-27a787c5.vmem | grep 'moveitsvc' > strings.vmem
```


![[Pasted image 20231221134728.png]] ^e69563

```bash
┌──(kali㉿kali)-[~/htb/iliketo]
└─$ grep move.aspx stringsfull.vmem -A 20 -B 20 | grep title
```

```bash
<title>awen asp.net webshell</title>
```

^ed9cf7

