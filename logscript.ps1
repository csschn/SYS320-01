clear
function logOnlogOfflogs ($days) {

    $loginouts = Get-EventLog System -source Microsoft-Windows-WinLogon -After (Get-Date).AddDays($days - $days * 2)

    $loginoutsTable = @()
    for ($i=0; $i -lt $loginouts.Count; $i++) {


    $event = ""
    if($loginouts[$i].InstanceID -eq 7001) {$event="Logon"}
    if($loginouts[$i].InstanceID -eq 7002) {$event="Logoff"}

    $user = $loginouts[$i].ReplacementStrings[1]

    $sid = $user
    $securityIdentifier = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $sid

    $user = $securityIdentifier.Translate([System.Security.Principal.NTAccount])

    $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                        "Id" = $loginouts[$i].InstanceId;
                                        "Event" = $event;
                                        "User" = $user;
                                        }
    }

return $loginoutsTable
}

logOnlogOffLogs(1)

function powerLogs ($days) {

    $powerLogs = Get-EventLog System -After (Get-Date).AddDays($days - $days * 2)  | where {($_.EventID -eq 6005) -or 
                                                                                            ($_.EventID -eq 6006)} 

    $powerLogsTable = @()
    for ($i=0; $i -lt $powerLogs.Count; $i++) {


    $event = ""
    if($powerLogs[$i].EventID -eq 6005) {$event="poweron"}
    if($powerLogs[$i].EventID -eq 6006) {$event="shutdown"}

    $user = "System"

    $powerLogsTable += [pscustomobject]@{"Time" = $powerLogs[$i].TimeGenerated;
                                        "Id" = $powerLogs[$i].InstanceId;
                                        "Event" = $event;
                                        "User" = $user;
                                        }
    }

return $powerLogsTable
}

powerLogs(1)