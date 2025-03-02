. (Join-Path $PSScriptRoot apachelogsparse.ps1)
. (Join-Path $PSScriptRoot event-logs.ps1)
clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display Last 10 Apache Logs`n"
$Prompt += "2 - Display Last 10 Failed Logins for all Users`n"
$Prompt += "3 - Display At Risk Users`n"
$Prompt += "4 - Open champlain.edu in Chrome`n"
$Prompt += "5 - Exit`n"

$operation = $true

while ($operation = $true) {
    Write-Host $Prompt | Out-String
    $choice = Read-Host 
    if ($choice -eq 1) {
        $results = ApacheLogs1
        $results[-10..-1]
    }
    

    elseif ($choice -eq 2) {
        $results = getFailedLogins | Sort-Object TimeGenerated -Descending

        $results[-10..-1]

    }
    elseif ($choice -eq 3) {
        $failedLogins = getFailedLogins 180

        $tenFailedLoginUsers = $failedLogins | Group-Object User | Where-Object { $_.Count -gt 10}

        $tenFailedLoginUsers | ForEach-Object {$_.Name}
    }
    elseif ($choice -eq 4) {
        if (Get-Process -Name chrome) {
            Stop-Process -Name chrome
        } else {
            start "C:\Program Files\Google\Chrome\Application\chrome.exe" "champlain.edu"
        }
    }
    elseif ($choice -eq 5) {
        Write-Host "Bye"
        exit 
        $operation = $false
    }
}