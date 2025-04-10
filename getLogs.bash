logDir ="/var/log/apache2"

allLogs=$(ls "${logDir}" | grep "access.log" | grep "access.log.1")

:> access.txt

for i in ${allLogs}
do
	cat "${logDir}${i}" >> access.txt
done

tail access.txt
