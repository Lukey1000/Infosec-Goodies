Grab the metasploit module related to moveit cve
```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/modules/exploits/windows/http/moveit_cve_2023_34362.rb -o ~/htb/iliketo/moveit-metasploit-module.rb
```

## instid

^7d6bd5

```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -i instid ~/htb/iliketo/moveit-metasploit-module.rb
    @moveit_instid = nil
      "UPDATE moveittransfer.users SET InstID='#{@moveit_instid}' WHERE Username='#{hax_username}'",
  def populate_token_instid
      # Get the InstID from the cookies
      fail_with(Msf::Exploit::Failure::Unknown, 'Could not find InstID from cookies!') unless cookies =~ /siLockLongTermInstID=([0-9]+);/
      @moveit_instid = ::Regexp.last_match(1)
      vprint_status("Received siLockLongTermInstID cookie: #{@moveit_instid}")
      'MyPkgInstID' => '1234', # this can be any int value
    # Get the sessionID and siLockLongTermInstID
    print_status('[01/11] Get the sessionID and siLockLongTermInstID')
    populate_token_instid
```

## urls accessed

```bash
┌──(kali㉿kali)-[~/…/inetpub/logs/LogFiles/W3SVC2]
└─$ grep -i normalize ~/htb/iliketo/moveit-metasploit-module.rb
      'uri' => normalize_uri("/api/v1/folders/#{folders_json['items'][0]['id']}/files?uploadType=resumable"),
      'uri' => normalize_uri('moveitisapi/moveitisapi.dll?action=capa'),
      'uri' => normalize_uri('/api/v1/folders'),
      'uri' => normalize_uri('guestaccess.aspx'),
      'uri' => normalize_uri('moveitisapi/moveitisapi.dll?action=m2'),
      'uri' => normalize_uri("/api/v1/files/#{files_json['fileId']}"),
      'uri' => normalize_uri('/api/v1/token'),
      'uri' => normalize_uri("/api/v1/folders/#{folders_json['items'][0]['id']}/files?uploadType=resumable&fileId=#{files_json['fileId']}"),
```