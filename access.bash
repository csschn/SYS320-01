
logs=$(cat /var/log/syslog | grep userlogs-1.bash | tr ':' '-') 

echo "$logs" >> fileaccesslog.txt

cat fileaccesslog.txt | ssmtp connor.schnackenberg@mymail.champlain.edu
