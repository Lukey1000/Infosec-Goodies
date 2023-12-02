```
let CompromisedDevice = "laptop";
let SearchWindow = 14d; 
let AMSIEvents = DeviceEvents
     | where Timestamp > ago(SearchWindow)
     | where DeviceName == CompromisedDevice
     | where ActionType contains "Amsi"
     | extend Description = tostring(parse_json(AdditionalFields).Description)
     | project Timestamp, DeviceName, ActionType, Description, FolderPath;
```
