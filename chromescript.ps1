clear

if (Get-Process -Name chrome) {
    Stop-Process -Name chrome
} else {
    start "C:\Program Files\Google\Chrome\Application\chrome.exe" "champlain.edu"
}