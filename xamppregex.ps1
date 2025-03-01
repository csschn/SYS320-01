﻿clear

$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "\b(?:\d{1,3}\.){3}\d{1,3}\b"

$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
 $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}


$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group-Object -Property IP
$counts | Select-Object Count, Name