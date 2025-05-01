ip addr | awk '/inet 10.0/ {print $2}' | cut -d'/' -f1
