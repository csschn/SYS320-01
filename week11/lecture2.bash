file="/var/log/apache2/access.log"

function countingCurlAccess {
	results=$(cat "$file" | grep "curl/7.81.0" | cut -d' ' -f1,12 | uniq -c)
}
countingCurlAccess
echo "$results"
