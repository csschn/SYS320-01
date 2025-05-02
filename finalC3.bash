#1.4.7

file="/var/www/html/report.html"
reportFile="/home/champuser/SYS320-01/report.txt"
echo "<html>" >> "$file"
echo "<body>" >> "$file"
echo "<table border=1>" >> "$file"
echo "<tbody>" >> "$file"

cnt=$(wc -l "$reportFile" | cut -d" " -f 1)
for ((i=0; i<="($cnt)"; i++))
	do
		echo "<tr>" >> "$file"
		echo "<td>" >> "$file"
		ipAddress=$(cat "$reportFile" | head -n $i | tail -n1 | cut -d" " -f 1)
		date=$(cat "$reportFile" | head -n $i | tail -n1 | cut -d" " -f 4)
		path=$(cat "$reportFile" | head -n $i | tail -n1 | cut -d" " -f 7)
		echo "$ipAddress" >> "$file"
		echo "</td>" >> "$file"
		echo "<td>" >> "$file"
		echo "$date" >> "$file"
		echo "</td>" >> "$file"
		echo "<td>" >> "$file"
		echo "$path" >> "$file"
		echo "</td>" >> "$file"
		echo "</tr>" >> "$file"
	done
echo "</tbody>" >> "$file"
echo "</table>" >> "$file"
echo "</body>" >> "$file"
echo "</html>" >> "$file"
