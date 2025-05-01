IOCLogs=$(cat "$1" | egrep -i -f "$2")

echo "$IOCLogs" >> report.txt
