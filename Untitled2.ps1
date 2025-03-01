clear

function powerLogs ($days) {

    $powerLogs = Get-EventLog System -After (Get-Date).AddDays($days - $days * 2)  | where {$_.InstanceId -eq 6005,6006}

    $powerLogsTable = @()
    for ($i=0; $i -lt $powerLogs.Count; $i++) {


    $event = ""
    if($powerLogs[$i].EventID -eq 6005) {$event="poweron"}
    if($powerLogs[$i].EventID -eq 6006) {$event="shutdown"}

    $user = $powerLogs[$i].ReplacementStrings[1]

    $sid = $user
    $securityIdentifier = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $sid

    $user = $securityIdentifier.Translate([System.Security.Principal.NTAccount])

    $powerLogsTable += [pscustomobject]@{"Time" = $powerLogs[$i].TimeGenerated;
                                        "Id" = $powerLogs[$i].InstanceId;
                                        "Event" = $event;
                                        "User" = $user;
                                        }
    }

return $powerLogsTable
}

powerLogs(1)