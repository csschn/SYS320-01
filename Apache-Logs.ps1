clear

function apacheLogsFunction ($Page, $HTTPCode, $Browser){
    $filePath = "C:\xampp\apache\logs\access.log"
    $apacheLogs = Get-Content $filePath
    $apacheLogs[1]

    $finalIps = foreach ($line in $apacheLogs){
            $portions = $line -split ' '

            $ip = $portions[0]

            $apachePage = $portions[6].Trim(' ')

            $apacheCode = $portions[8]

            $apacheBrowser = ($portions[11..($portions.Length-2)] -join ' ').Substring(1,($portions[11..($portions.Length-2)] -join ' ').Length-2)
            $test
            if ($apachePage -eq $Page -and $apacheCode -eq $HTTPCode -and $apacheBrowser -ilike "*$Browser*") {
                $ip
            }
    }
    return $finalIps
}