#!/bin/bash

myIP=$(bash myIP.bash)


# Todo-1: Create a helpmenu function that prints help for the script
function helpMenu(){
echo "Script takes exactly two arguments."
echo "HELP MENU"
echo "---------------"
echo "-n: Add -n as an argument for this script to use nmap"
echo " -n external: External NMAP scan"
echo " -n internal: Internal NMAP scan"
echo "-s: Add -s as an argument for this script to use ss"
echo " -s external: External ss(Netstat) scan"
echo " -s internal: Internal ss(Netstat) scan"
}

# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}')
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}')
}


# Only IPv4 ports listening from network
function ExternalListeningPorts(){

# Todo-2: Complete the ExternalListeningPorts that will print the port and application
# that is listening on that port from network (using ss utility)
elpo=$(ss -lntu | awk -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}


# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}



# Todo-3: If the program is not taking exactly 2 arguments, print helpmenu
if [[ "$#" != '2' ]]; then
	helpMenu
	exit 1
fi

# Todo-4: Use getopts to accept options -n and -s (both will have an argument)
# If the argument is not internal or external, call helpmenu
# If an option other then -n or -s is given, call helpmenu
# If the options and arguments are given correctly, call corresponding functions
# For instance: -n internal => will call NMAP on localhost
#               -s external => will call ss on network (non-local)

while getopts ":n:s:" opt; do
	case $1 in
	-n)
	 if [[ "$2" != "internal" && "$2" != "external" ]]; then
		helpMenu
	fi

	if [[ "$2" == "internal" ]]; then
		InternalNmap
		echo "$rin"
	fi
	if [[ "$2" == "external" ]]; then
		ExternalNmap
		echo "$rex"
	fi
	;;

	-s)
         if [[ "$2" != "internal" && "$2" != "external" ]]; then
                helpMenu
        fi

        if [[ "$2" == "internal" ]]; then
                InternalListeningPorts
		echo "$ilpo"
        fi
        if [[ "$2" == "external" ]]; then
                ExternalListeningPorts
		echo "$elpo"
        fi
	;;

	\?)
	helpMenu
	;;
	esac
done
