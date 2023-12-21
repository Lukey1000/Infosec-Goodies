https://github.com/EricZimmerman/MFTECmd to analyse the MFT and export to csv / json

```powershell
.\MFTECmd.exe -f "C:\htb\Triage\Triage\uploads\ntfs\%5C%5C.%5CC%3A\`$MFT" --json C:\htb\analysis\mft --csv C:\htb\analysis\mft\
```

## move.aspx
```json
┌──(kali㉿kali)-[~/htb/iliketo]
└─$ grep move.aspx 20231220223657_MFTECmd_\$MFT_Output.json | jq .
{
  "EntryNumber": 1293,                                                                                                                                     
  "SequenceNumber": 31,                                                                                                                                    
  "ParentEntryNumber": 274233,                                                                                                                             
  "ParentSequenceNumber": 9,                                                                                                                               
  "InUse": true,                                                                                                                                           
  "ParentPath": ".\\MOVEitTransfer\\wwwroot",                                                                                                              
  "FileName": "move.aspx",                                                                                                                                 
  "Extension": ".aspx",                                                                                                                                    
  "IsDirectory": false,                                                                                                                                    
  "HasAds": false,                                                                                                                                         
  "IsAds": false,                                                                                                                                          
  "FileSize": 1400,                                                                                                                                        
  "Created0x10": "2023-07-12T11:24:30.4297594+00:00",                                                                                                      
  "LastModified0x10": "2023-07-12T11:24:30.4610703+00:00",                                                                                                 
  "LastModified0x30": "2023-07-12T11:24:30.4297594+00:00",                                                                                                 
  "LastRecordChange0x10": "2023-07-12T11:24:30.4610703+00:00",                                                                                             
  "LastRecordChange0x30": "2023-07-12T11:24:30.4297594+00:00",                                                                                             
  "LastAccess0x10": "2023-07-12T11:24:30.4610703+00:00",                                                                                                   
  "LastAccess0x30": "2023-07-12T11:24:30.4297594+00:00",                                                                                                   
  "UpdateSequenceNumber": 1808772160,                                                                                                                      
  "LogfileSequenceNumber": 609836657,                                                                                                                      
  "SecurityId": 1248,                                                                                                                                      
  "SiFlags": 32,                                                                                                                                           
  "ReferenceCount": 1,                                                                                                                                     
  "NameType": 1,                                                                                                                                           
  "Timestomped": false,                                                                                                                                    
  "uSecZeros": false,                                                                                                                                      
  "Copied": false,                                                                                                                                         
  "FnAttributeId": 2,                                                                                                                                      
  "OtherAttributeId": 4                                                                                                                                    
}                          
```

^b415f3

## moveit.aspx

```json
┌──(kali㉿kali)-[~/htb/iliketo]
└─$ grep 'moveit.asp' 20231220223657_MFTECmd_\$MFT_Output.json | jq . | tail -32
{
  "EntryNumber": 273729,
  "SequenceNumber": 50,
  "ParentEntryNumber": 265340,
  "ParentSequenceNumber": 5,
  "InUse": true,
  "ParentPath": ".\\inetpub\\wwwroot",
  "FileName": "moveit.asp",
  "Extension": ".asp",
  "IsDirectory": false,
  "HasAds": false,
  "IsAds": false,
  "FileSize": 1362,
  "Created0x10": "2023-07-12T11:17:12.6808372+00:00",
  "LastModified0x10": "2023-07-12T11:17:12.7120642+00:00",
  "LastModified0x30": "2023-07-12T11:17:12.6808372+00:00",
  "LastRecordChange0x10": "2023-07-12T11:17:12.7120642+00:00",
  "LastRecordChange0x30": "2023-07-12T11:17:12.6808372+00:00",
  "LastAccess0x10": "2023-07-12T11:17:12.7120642+00:00",
  "LastAccess0x30": "2023-07-12T11:17:12.6808372+00:00",
  "UpdateSequenceNumber": 1808710920,
  "LogfileSequenceNumber": 609432138,
  "SecurityId": 1935,
  "SiFlags": 32,
  "ReferenceCount": 1,
  "NameType": 3,
  "Timestomped": false,
  "uSecZeros": false,
  "Copied": false,
  "FnAttributeId": 2,
  "OtherAttributeId": 3
}
```

^be70b1

