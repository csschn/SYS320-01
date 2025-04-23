
#! /bin/bash

authfile="/var/log/auth.log.1"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
	failedlogLine=$(cat "$authfile" |grep "failure")
	echo "$failedlogLine"
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To- connor.schnackenberg@mymail.champlain.edu" > emailform.txt
echo "Subject- Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp connor.schnackenberg@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To- connor.schnackenberg@mymail.champlain.edu" > failedemailform.txt
echo "Subject- Failed Logins" >> failedemailform.txt
getFailedLogins >> failedemailform.txt
cat failedemailform.txt | ssmtp connor.schnackenberg@mymail.champlain.edu

