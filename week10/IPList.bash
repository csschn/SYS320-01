[ $# -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1 


prefix=$1



[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example:10.0.17\n" && \
exit 1

 
for i in {0..255}
do
	ping -c 1 "$prefix.$i" | awk '/64 bytes from/ {print $4}' | cut -d':' -f1 
done
