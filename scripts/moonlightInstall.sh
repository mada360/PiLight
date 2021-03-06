#!/bin/bash

if (( $EUID !=0 )); then
	echo "Please run as root"
	exit
fi


# Add moonlight repo
grep -q -F 'deb http://archive.itimmer.nl/raspbian/moonlight jessie main' /etc/apt/sources.list || echo 'deb http://archive.itimmer.nl/raspbian/moonlight jessie main' >> /etc/apt/sources.list

# Install moonlight
apt-get $1 update
apt-get install moonlight-embedded
mkdir ~/Moonlight


#CHECK IF STEAM ALREADY THERE
if grep $1 steam /etc/emulationstation/es_systems.cfg; then
	echo "Steam already added as a system."
else
#Create backup and then add a shortcut to your pc in Emulation Station.
cp /etc/emulationstation/es_systems.cfg es_systems.cfg.bak

# Add moonlight system and backup old config
mv /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bak

sed '$d' /etc/emulationstation/es_systems.cfg.bak > /etc/emulationstation/es_systems.cfg

ls

cat ./scripts/steam  >> /etc/emulationstation/es_systems.cfg

fi


# Create "ROM" folder
mkdir /home/pi/RetroPie/roms/moonlight

# Now we’re going to create a script or multiple scripts for starting moonlight. I have 3 different scripts that connect to the same computer with either 1080p/30fps, 720p/60fps, or 720p/30fps so I can stream in different qualities depending on how well a certain game streams.

cd /home/pi/RetroPie/roms/moonlight


# Creates a profile for the 4 most common streaming settings and allows for streaming more intensive games at lower res/fps for stable connection.

echo "#!/bin/bash
moonlight stream $steampc -1080 -60fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 1080p60fps.sh

echo "#!/bin/bash
moonlight stream $steampc -1080 -30fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 1080p30fps.sh

echo "#!/bin/bash
moonlight stream $steampc -720 -60fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 720p60fps.sh

echo "#!/bin/bash
moonlight stream $steampc -720 -30fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 720p30fps.sh

echo "#!/bin/bash
moonlight pair $steampc" > pairWithPC.sh

chmod +x *

# THEME STUFF (Optional)

read -p "Would you like to install the simple theme? Press Y for yes" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then

	wget -N -P ./download http://www.emulationstation.org/downloads/themes/simple_latest.zip

	unzip $1 ./download/simple_latest.zip

	# Move folder to
	mv simple /etc/emulationstation/themes

	if [ ! -d /etc/emulationstation/themes/simple ]; then
	  printf "\n \n Please make sure you have installed the simple theme through the retropie-setup menu instruction found here - https://github.com/RetroPie/RetroPie-Setup/wiki/Themes \n \n"
		exit
	fi

	# Download steam theme
	wget -N -P ./download http://jordanhotmann.com/wp-content/uploads/2015/09/steam.zip

	unzip ./download/steam.zip

	# Move folder to
	mv steam /etc/emulationstation/themes/simple
fi
