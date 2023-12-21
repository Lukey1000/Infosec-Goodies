```bash
┌──(kali㉿kali)-[~/…/Windows/System32/winevt/Logs]
└─$ export EVTDIR=$(pwd)
                                                                                                                                                            
┌──(kali㉿kali)-[~/…/Windows/System32/winevt/Logs]
└─$ echo $EVTDIR        
/home/kali/htb/iliketo/Triage/uploads/auto/C%3A/Windows/System32/winevt/Logs
```

```bash
┌──(kali㉿kali)-[~/…/iliketo/Triage/analysis/chainsaw]
└─$ ./target/release/chainsaw hunt -s sigma/ -r rules/ -m mappings/sigma-event-logs-all.yml $EVTDIR/Security.evtx -o security.chainsaw

 ██████╗██╗  ██╗ █████╗ ██╗███╗   ██╗███████╗ █████╗ ██╗    ██╗
██╔════╝██║  ██║██╔══██╗██║████╗  ██║██╔════╝██╔══██╗██║    ██║
██║     ███████║███████║██║██╔██╗ ██║███████╗███████║██║ █╗ ██║
██║     ██╔══██║██╔══██║██║██║╚██╗██║╚════██║██╔══██║██║███╗██║
╚██████╗██║  ██║██║  ██║██║██║ ╚████║███████║██║  ██║╚███╔███╔╝
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚══╝╚══╝
    By WithSecure Countercept (@FranticTyping, @AlexKornitzer)

[+] Loading detection rules from: rules/, sigma/
[!] Loaded 3173 detection rules (386 not loaded)
[+] Loading forensic artefacts from: /home/kali/htb/iliketo/Triage/uploads/auto/C%3A/Windows/System32/winevt/Logs/Security.evtx (extensions: .evtx, .evt)
[+] Loaded 1 forensic artefacts (21.0 MB)
[+] Hunting: [========================================] 1/1                                                                                                 
[+] 1937 Detections found on 1918 documents
```

```bash
┌──(kali㉿kali)-[~/…/iliketo/Triage/analysis/chainsaw]
└─$ ./target/release/chainsaw dump /home/kali/htb/iliketo/Triage/uploads/auto/C%3A/Windows/System32/winevt/Logs/Security.evtx -o security.json --json
```

```bash
┌──(kali㉿kali)-[~/…/iliketo/Triage/analysis/chainsaw]
└─$ jq '.[] | select(.Event.System.EventID == 4724 and .Event.EventData.TargetUserName == "moveitsvc") | { Time: .Event.System.TimeCreated_attributes.SystemTime, Subject: .Event.EventData.SubjectUserName, Target: .Event.EventData.TargetUserName }' security.json | jq -s 'sort_by(.Time)' 
[
  {                                                                                                                                                         
    "Time": "2023-06-13T10:01:06.010582Z",                                                                                                                  
    "Subject": "Administrator",                                                                                                                             
    "Target": "moveitsvc"                                                                                                                                   
  },                                                                                                                                                        
  {                                                                                                                                                         
    "Time": "2023-06-13T10:57:56.502339Z",                                                                                                                  
    "Subject": "Administrator",                                                                                                                             
    "Target": "moveitsvc"                                                                                                                                   
  },                                                                                                                                                        
  {                                                                                                                                                         
    "Time": "2023-06-13T15:53:07.187058Z",                                                                                                                  
    "Subject": "Administrator",                                                                                                                             
    "Target": "moveitsvc"                                                                                                                                   
  },                                                                                                                                                        
  {                                                                                                                                                         
    "Time": "2023-06-14T07:13:49.111325Z",                                                                                                                  
    "Subject": "Administrator",                                                                                                                             
    "Target": "moveitsvc"                                                                                                                                   
  },                                                                                                                                                        
  {                                                                                                                                                         
    "Time": "2023-06-14T09:21:11.011138Z",                                                                                                                  
    "Subject": "Administrator",                                                                                                                             
    "Target": "moveitsvc"                                                                                                                                   
  },                                                                                                                                                        
  {                                                                                                                                                         
    "Time": "2023-07-12T11:09:27.864823Z",                                                                                                                  
    "Subject": "moveitsvc",                                                                                                                                 
    "Target": "moveitsvc"                                                                                                                                   
  }                                                                                                                                                         
]                                                                                                                                                           
                       
```

^fb7005

## 4624
```bash
┌──(kali㉿kali)-[~/…/iliketo/Triage/analysis/chainsaw]
└─$ cat security.chainsaw | grep -i rdp
│ 2023-07-12 11:11:18 │ ‣ RDP Logon     │ 4624     │ 60793     │ mover           │ moveitsvc     │ 10         │ 10.255.254.3 │
│ 2023-07-12 11:11:18 │ ‣ RDP Logon     │ 4624     │ 60794     │ mover           │ moveitsvc     │ 10         │ 10.255.254.3 │
```
^ccee32
