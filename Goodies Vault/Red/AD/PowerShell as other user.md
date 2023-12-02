*On MS01 as mssqlsvc, I used powershell commands to set creds as CPT059, then using those creds, changed the password of the domain\administrator account, found to be in domainadmins group with bloodhound. Then i was able to win-rm in with the new password.

```
$Cred = New-Object System.Management.Automation.PSCredential('DOMAIN\CPT059', $SecPassword) 
$adminPassword = ConvertTo-SecureString 'Pwdgoeshere' -AsPlainText -Force
```