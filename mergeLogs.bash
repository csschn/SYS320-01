logFile="access.txt"

if [[ ! -f "${logFile}" ]]
then
	bash getLogs.bash
fi

cut -d' ' -f 1 access.txt | sort | uniq
