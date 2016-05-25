#!/bin/bash

if (( $EUID !=0 )); then
	echo "Please run as root"
	exit
fi

if [ ! -d "./scripts" ]; then
  echo "Make sure Setup.sh is in the same directory as the scripts folder!"
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
  echo "  5 - Configure Hyperion"
	echo "  6 - Disable Overscan"
  echo
	echo "VERBOSE OUTPUT OPTIONS"
	echo
	echo "  7 - Install All"
  echo "  x - Exit"
  echo
  echo -n "Enter option: "
  read opt


  if [ "$?" != "1" ]
  then
    case $opt in
      1) echo "Install All"; scripts/getip.sh -qq; scripts/moonlightInstall.sh -qq;  scripts/hyperionInstall.sh -qq;	scripts/moonlightConfig.sh -qq;	scripts/hyperionConfig.sh -qq;;
      2) echo "Install Moonlight"; scripts/moonlightInstall.sh -qq;;
      3) echo "Configure Moonlight"; scripts/moonlightConfig.sh -qq;;
      4) echo "Install Hyperion (NOT READY)"; scripts/hyperionInstall.sh -qq;;
      5) echo "Configure Hyperion (NOT READY)"; scripts/hyperionConfig.sh -qq;;
			6) echo "Disable Overscan"; scripts/removeOverscan.sh;;

			7) echo "Install All"; scripts/getip.sh; scripts/moonlightInstall.sh ;  scripts/hyperionInstall.sh;	scripts/moonlightConfig.sh;	scripts/hyperionConfig.sh;;
			8) echo "Install Moonlight"; scripts/moonlightInstall.sh ;;
			9) echo "Configure Moonlight"; scripts/moonlightConfig.sh ;;
			10) echo "Install Hyperion (NOT READY)"; scripts/hyperionInstall.sh;;
			11) echo "Configure Hyperion (NOT READY)"; scripts/hyperionConfig.sh;;

      x) clear; echo; echo "Goodbye."; echo; exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi

  echo
  echo "Press Enter to continue"
  read enterKey

done
