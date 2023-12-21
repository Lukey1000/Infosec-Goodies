```bash
┌──(kali㉿kali)-[~/htb/iliketo/Triage/uploads]
└─$ sudo systemctl start mysql 
```

```bash
┌──(kali㉿kali)-[~/htb/iliketo/Triage/uploads]
└─$ sudo mysql moveit < moveit.sql
```

```mysql
MariaDB [moveit]> select * from log LIMIT 1\G
```
\\G makes it look better than just a ;

```mysql
MariaDB [moveit]> select LogTime, InstID, Username, IPAddress, FileName, FolderPath from log;
+---------------------+--------+-----------------------------+--------------+--------------------+----------------------------+
| LogTime             | InstID | Username                    | IPAddress    | FileName           | FolderPath                 |
+---------------------+--------+-----------------------------+--------------+--------------------+----------------------------+
| 2023-06-14 02:21:48 |      0 | Automation                  | SCRIPT       |                    |                            |
| 2023-06-14 02:21:48 |      0 | Automation                  | NULL         | NULL               | NULL                       |
| 2023-06-14 02:21:48 |      0 | Automation                  |              |                    |                            |
| 2023-06-14 02:21:48 |      0 | Automation                  | SCRIPT       |                    |                            |
| 2023-06-14 02:21:48 |      0 | Automation                  | NULL         | NULL               | NULL                       |
| 2023-06-14 02:21:48 |      0 | Automation                  |              |                    |                            |
| 2023-06-14 02:21:48 |      0 | Automation                  | SCRIPT       |                    | /Home/sysadmin             |
| 2023-06-14 02:21:48 |      0 | Automation                  | SCRIPT       |                    |                            |
| 2023-06-14 02:27:18 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:35:11 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:35:11 |   3636 | Automation                  | NULL         | NULL               | NULL                       |
| 2023-06-14 02:35:11 |   3636 | 1411u00clwv9ye3h            |              |                    |                            |
| 2023-06-14 02:35:11 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:39:49 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:39:49 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:40:13 |   3636 | 1411u00clwv9ye3h            | 127.0.0.1    |                    | /Home/admin                |
| 2023-06-14 02:40:13 |   3636 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:40:24 |      0 | 1411u00clwv9ye3h            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:40:32 |   3636 | 36svvqix50sans4n            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:41:01 |   3636 | 36svvqix50sans4n            | 127.0.0.1    |                    | /Home/user                 |
| 2023-06-14 02:41:01 |   3636 | 36svvqix50sans4n            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:41:12 |   3636 | 36svvqix50sans4n            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:41:17 |   3636 | vwj883m5p3944q9r            | 127.0.0.1    |                    |                            |
| 2023-06-14 02:41:22 |   3636 | vwj883m5p3944q9r            | 127.0.0.1    |                    |                            |
| 2023-06-15 01:01:11 |      0 | Automation                  |              |                    |                            |
| 2023-06-15 01:01:11 |   3636 | Automation                  | NULL         | NULL               | NULL                       |
| 2023-06-15 01:01:11 |   3636 | Automation                  |              |                    |                            |
| 2023-06-15 01:01:11 |   3636 | Automation                  |              |                    |                            |
| 2023-06-15 01:01:15 |      0 | Automation                  | SCRIPT       | Log_06152023010115 | /Archive/Logs              |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:11:15 |   3636 | anonymous                   | 10.255.254.3 |                    |                            |
| 2023-07-12 02:25:03 |   1234 | Guest:APCUVWMP@WCUURAXH.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 02:25:55 |   3636 | vcjoaquq                    | 10.255.254.3 |                    |                            |
| 2023-07-12 02:26:15 |   3636 | icfshlla                    | 10.255.254.3 |                    |                            |
| 2023-07-12 02:47:11 |   1234 | Guest:AQCSOIFB@YSNSKCUY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:01:05 |   1234 | Guest:RWYBAGIC@HEXGVNAY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:01:56 |   1234 | Guest:MHRFUQCI@LJJNDBUY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:04:43 |   1234 | Guest:YRJXCORD@AQBURYAP.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:06:42 |   1234 | Guest:SJUHAYDO@KAAXLQSI.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:07:30 |   1234 | Guest:COKGEDGV@PKROFIQP.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| 2023-07-12 03:08:37 |   1234 | Guest:LKNLDAEV@XXGYUOKZ.com | 10.255.254.3 |                    | /Messages/Global Messaging |
+---------------------+--------+-----------------------------+--------------+--------------------+----------------------------+
45 rows in set (0.001 sec)
```

```bash
┌──(kali㉿kali)-[~/htb/iliketo/Triage/uploads]
└─$ grep 1234 mysql.dmp 
| msg_post         | 2023-07-12 02:25:03 |   1234 | Guest:APCUVWMP@WCUURAXH.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 02:47:11 |   1234 | Guest:AQCSOIFB@YSNSKCUY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:01:05 |   1234 | Guest:RWYBAGIC@HEXGVNAY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:01:56 |   1234 | Guest:MHRFUQCI@LJJNDBUY.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:04:43 |   1234 | Guest:YRJXCORD@AQBURYAP.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:06:42 |   1234 | Guest:SJUHAYDO@KAAXLQSI.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:07:30 |   1234 | Guest:COKGEDGV@PKROFIQP.com | 10.255.254.3 |                    | /Messages/Global Messaging |
| msg_post         | 2023-07-12 03:08:37 |   1234 | Guest:LKNLDAEV@XXGYUOKZ.com | 10.255.254.3 |                    | /Messages/Global Messaging |
```
