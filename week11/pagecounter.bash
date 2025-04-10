file="/var/log/apache2/access.log"

function pageCount() {
	finalOutput=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c)
}

pageCount

echo "$finalOutput"

