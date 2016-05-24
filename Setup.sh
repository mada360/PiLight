#!/bin/bash

if (( $EUID !=0 )); then
	echo "Please run as root"
	exit
fi


while :
do

  clear

  echo
  cat header
  echo
  echo "MENU"
  echo
  echo "  1 - Install All"
  echo "  2 - Install Moonlight"
  echo "  3 - Configure Moonlight"
  echo "  4 - Install Hyperion"

  echo "  x - Exit"
  echo
  echo
  echo -n "Enter option: "
  read opt


  if [ "$?" != "1" ]
  then
    case $opt in
      1) echo "Install All"; 	scripts/getip.sh; scripts/moonlightInstall.sh ;	.scripts/hyperionInstall.sh;	scripts/moonlightConfig.sh;	scripts/hyperionConfig.sh;;
      2) echo "Install Moonlight"; scripts/moonlightInstall.sh ;;
      3) echo "Configure Moonlight"; scripts/moonlightConfig.sh ;;
      4) echo "Install Hyperion"; scripts/hyperionInstall;;

      x) clear; echo; echo "Goodbye."; echo; exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi

  echo
  echo "Press Enter to continue"
  read enterKey

done
