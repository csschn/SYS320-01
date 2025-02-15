﻿clear

function ApacheLogs1(){
$logsNotformatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for ($i=0; $i -lt $logsNotformatted.Count; $i++) {

$words = $logsNotformatted[$i].split(" ");

$tableRecords += [pscustomobject]@{ "IP" = $words[0];
                                    "Time" = $words[3].Trim('[');
                                    "Method" = $words[5].Trim('"');
                                    "Page" = $words[6];
                                    "Protocol" = $words[7];
                                    "Response" = $words[8];
                                    "Referrer" = $words[9];
                                    "Client" = $words[11..($words.property)];  }
}
return $tableRecords
}


                                           