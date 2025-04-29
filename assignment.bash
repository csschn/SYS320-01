link="10.0.17.6/assignment.html"

pressure=$(curl -sL "$link" | xmlstarlet select --template --value-of "//table[@id='press']//tr//td" | awk 'NR % 2 == 1')

temp=$(curl -sL "$link" | xmlstarlet select --template --value-of "//table[@id='temp']//tr//td" | awk 'NR % 2 == 1')

timestamp=$(curl -sL "$link" | xmlstarlet select --template --value-of "//table[@id='press']//tr//td" | awk 'NR % 2 == 0')

count=$(echo "$pressure" | wc -l)

for ((i=1; i<="($count)"; i++))
	do
		pressureLine=$(echo "$pressure" | head -n $i | tail -n1)
		tempLine=$(echo "$temp" | head -n $i | tail -n1)
		timeLine=$(echo "$timestamp" | head -n $i | tail -n1)

		echo "$pressureLine  $tempLine  $timeLine"
	done
