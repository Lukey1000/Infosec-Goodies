Find inetpub in files.out to look for IIS Logs file
```bash
grep inetpub files.out                       
  1180399     52 -rw-r--r--   1 kali     kali        50219 Jul 12 07:25 ./auto/C%3A/inetpub/logs/LogFiles/W3SVC2/u_ex230712.log

```

Extract Server IP's from IIS log file
- Grep -v to exclude comments from the IIS file

Log range: 2023-07-12 10:08:39 - 2023-07-12 11:24:47
## Server IPs
```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -v '\#' u_ex230712.log | awk '{print $3}' | sort | uniq -c
     34 ::1
    303 10.10.0.25
      6 127.0.0.1
```

## Client IPs
```bash
──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -v '\#' u_ex230712.log | awk '{print $9}' | sort | uniq -c 
     34 ::1
     29 10.255.254.2
    274 10.255.254.3
      6 127.0.0.1
```

## User Agents

^f9283e

```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -v '\#' u_ex230712.log | awk '{print $10}' | sort | uniq -c
     16 -
      2 AnyConnect+Darwin_i386+3.1.05160
     34 CWinInetHTTPClient
     51 Mozilla/5.0+(compatible;+Nmap+Scripting+Engine;+https://nmap.org/book/nse.html)
     29 Mozilla/5.0+(Macintosh;+Intel+Mac+OS+X+10_15_7)+AppleWebKit/537.36+(KHTML,+like+Gecko)+Chrome/114.0.0.0+Safari/537.36
     64 Mozilla/5.0+(X11;+Linux+x86_64;+rv:102.0)+Gecko/20100101+Firefox/102.0
    147 Ruby
```

Ruby and Nmap. Whoever used nmap is likely the attacker

```bash
──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep Nmap u_ex230712.log                                       
2023-07-12 10:11:15 10.10.0.25 OPTIONS / - 80 - 10.255.254.3 Mozilla/5.0+(compatible;+Nmap+Scripting+Engine;+https://nmap.org/book/nse.html) - 200 0 0 101
```

## aspx

^52ce0f

```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -v '\#' u_ex230712.log | awk '{print $9" "$5}' | sort | uniq -c | grep aspx | sort -n
      2 10.255.254.3 /move.aspx
      5 10.255.254.3 /human.aspx
      6 127.0.0.1 /machine.aspx
     34 ::1 /machine2.aspx
     64 10.255.254.3 /guestaccess.aspx
```

Human and machine and guest access are part of moveit

## Attacker User Agent

^85eaab

```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep move.aspx u_ex230712.log 
2023-07-12 11:24:43 10.10.0.25 GET /move.aspx - 443 - 10.255.254.3 Mozilla/5.0+(X11;+Linux+x86_64;+rv:102.0)+Gecko/20100101+Firefox/102.0 - 200 0 0 1179
2023-07-12 11:24:47 10.10.0.25 POST /move.aspx - 443 - 10.255.254.3 Mozilla/5.0+(X11;+Linux+x86_64;+rv:102.0)+Gecko/20100101+Firefox/102.0 https://moveit.htb/move.aspx 200 0 0 159
```

