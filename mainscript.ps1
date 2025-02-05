. C:\Users\champuser\SYS320-01\logscript.ps1

clear

$loginoutsTable = logOnlogOffLogs (15)
$loginoutsTable

$startupShutdownTable = powerLogs(25)