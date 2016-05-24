#!/bin/bash

if (( $EUID !=0 )); then
	echo "Please run as root"
	exit
fi

clear

cat logo

PS3='Please enter your choice: '
options=("Install All" "Install Moonlight" "Configure Moonlight" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Install All")
		echo "You have chosen to install and configure everything"

		# Get Steam Ip address
		echo "Please enter your Steam PC IP address (e.g. 192.168.1.101) : "
		read -p 'IP Address: ' steampc
		export $steampc
		./moonlightInstall.sh
		./hyperionInstall.sh
		./moonlightConfig.sh
		./hyperionConfig.sh
		;;
		"Install And Configure Moonlight")
		echo "you chose choice 2"
		# Get Steam Ip address
		echo "Please enter your Steam PC IP address (e.g. 192.168.1.101) : "
		read -p 'IP Address: ' steampc
		export $steampc
		./moonlightInstall.sh
		;;
		"Configure Moonlight")
		echo "you chose choice 2"
		# Get Steam Ip address
		echo "Please enter your Steam PC IP address (e.g. 192.168.1.101) : "
		read -p 'IP Address: ' steampc
		export $steampc		
		./moonlightConfig.sh
		;;
		"Quit")
		break
		;;
		*) echo invalid option;;
	esac
done
