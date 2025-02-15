clear

. C:\Users\champuser\SYS320-01\Apache-Logs.ps1

$apacheAccess = apacheLogsFunction("/index.html",404,"Chrome")
$ipCount = $apacheAccess | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipCount | Group-Object -Property IP
$counts | Select-Object Count, Name