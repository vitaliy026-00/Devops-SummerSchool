#!/bin/bash
getUser=$(cat /etc/passwd | grep $1 | cut -d":" -f1)
if [[ -z $getUser ]]; then
echo "User not exist"
else
	if ! [ -d $2 ];then
		echo "No directory"
	else
		if [ $UID -eq 0 ]; then
		chown -R  $1:$1 $2
		else echo "You're not root"
		fi
	fi 
fi
