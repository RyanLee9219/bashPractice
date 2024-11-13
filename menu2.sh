#!/bin/bash


function menu {
    dialog --title "Basic System management Program" \
        --radiolist "Please Choose the menu." 25 35 6 \
        1 "Load Average" off \
        2 "Check Disk" off \
        3 "Check Memory" off \
        4 "Process Tree" off \
        5 "Connect to SSH server" off \
        6 "EXIT" off \
        2>./select
}


function press_key {
	echo
	read -n1 -rsp "Press any key to continue..."
	echo
	echo
}

while true
do
	menu
	case $(<./select) in
		1)
			clear
			echo "Loading average..."
			uptime
			press_key
			;;
		2)
			clear
			echo "Checking Disk..."
			df -h
			press_key
			;;
		3)
			clear
			echo "Checking Memory..."
			free -m
			press_key
			;;
		4)
			clear
			echo "Process tree..."
			pstree
			press_key
			;;
		5)
			clear
			read -p "Please input the name of the server you connect: " WIN_IP
			read -p "Please input your Windows username: " WIN_USR
			sleep 1
			echo "Connecting to ${WIN_IP}..."
			ssh ${WIN_USR}@${WIN_IP}
			;;
		6)
			exit 0;;
		*)
			echo "Invalid input"
			press_key
			;;
	esac
done


