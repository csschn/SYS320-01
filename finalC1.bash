link="10.0.17.6/IOC.html"

IOC=$(curl -sL "$link" | xmlstarlet select --template --value-of "//table//tr//td" | awk 'NR % 2 == 1')

echo "$IOC" >> IOC.txt
