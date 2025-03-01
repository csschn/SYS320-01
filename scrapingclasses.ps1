clear 

function gatherClasses(){
    $page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.32/Courses.html

    $trs=$page.ParsedHtml.body.getElementsByTagName("tr")
    
    #$trs |ForEach-Object { $_.outerHTML }

    $FullTable=@()
    for($i=1; $i -lt $trs.length; $i++){
        $tds = $trs[$i].getElementsByTagName("td")

        $Times = $tds[5].innerText.split(" ")

        $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText; # use innerText on these elements and fix indexes
                                        "Title"      = $tds[1].innerText;
                                        "Days"       = $tds[4].innerText;
                                        "Time Start" = $Times[0];
                                        "Time End"   = $Times[1];
                                        "Instructor" = $tds[6].innerText;
                                        "Location"   = $tds[9].innerText;
                                        }
    }
    return $FullTable

}

function daysTranslator($FullTable){
for ($i=0; $i -lt $FullTable.length; $i++){
    $Days = @()

    if($FullTable[$i].Days -ilike "M"){ $days += "Monday" }
}