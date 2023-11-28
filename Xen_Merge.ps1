#Powershell script I hacked together to transfrom a XenMobile export (ManagedDevices) into a 'ready to mail merge' format
#I used this to gently nudge the folks that have out of date iOS that have authed within 30 days to update

$domain = ‘domain.com’ #keep it in quotes
Import-Csv -Path '.\Managed Devices.csv' |
    #Exclude users that you don't need to contact
    Where-Object { $_.User -notlike "*Device Enrollment Program User*" -and $_.User -notlike "*anonymous*" } | 
    #Takes the terrible xenmobile iOS versioning numbers and unifies
    ForEach-Object {
        if ($_.('OS Version').Length -lt 5) {
            $_.('OS Version') = $_.('OS Version') + ('.0' * (5-$_.('OS Version').Length))
        }
        #creates an email address for the user as Xenmobile formats these in a super useless way
        $name = ($_.User -split '"')[1]
        $_ | Add-Member -MemberType NoteProperty -Name "Name" -Value $name -PassThru |
            Add-Member -MemberType NoteProperty -Name "FirstName" -Value ($name -split ', ')[1] -PassThru |
            Add-Member -MemberType NoteProperty -Name "Email" -Value ($name.Split(',')[1].Trim() + '.' + $name.Split(',')[0].Trim() + $domain) -PassThru
    } |
    #Xenmobile for some reason exports dates in multiple formats, wtf? Unify and take only devices that have authed in the last 30 days
    Where-Object { [datetime]::ParseExact($_.'Last Auth Date', 'M/d/yy h:mm tt', $null) -ge (Get-Date).AddDays(-30) } |
    Select-Object Email, FirstName, Name, Model, 'OS Version', @{Name="DateFormatted";Expression={[datetime]::ParseExact($_.'Last Auth Date', 'M/d/yy h:mm tt', $null).ToString("yyyy/MM/dd")}} |
    Sort-Object DateFormatted |
    Export-Csv -Path '.\readytomerge.csv' -NoTypeInformation