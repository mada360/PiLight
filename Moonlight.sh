#!/bin/bash

if (( $EUID !=0 )); then
	echo "Please run as root"
	exit
fi

if [ ! -d "$DIRECTORY" ]; then
  echo "Folder doesn't exist"
	exit
fi

# Get Steam Ip address
echo "Please enter your Steam PC IP address: "
read -p 'IP Address: ' steampc

# Add moonlight repo
grep -q -F 'deb http://archive.itimmer.nl/raspbian/moonlight jessie main' /etc/apt/sources.list || echo 'deb http://archive.itimmer.nl/raspbian/moonlight jessie main' >> /etc/apt/sources.list

# Install moonlight
apt-get update
apt-get install moonlight-embedded && yes
mkdir ~/Moonlight
cd ~/Moonlight

# Pair with PC
moonlight pair $steampc

#Create backup and then add a shortcut to your pc in Emulation Station.
cp /etc/emulationstation/es_systems.cfg es_systems.cfg.bak

# Add moonlight system
echo "<system>
  <fullname>Steam</fullname>
  <name>Steam</name>
  <path>~/RetroPie/roms/moonlight</path>
  <extension>.sh .SH</extension>
  <command>%ROM%</command>
  <platform>steam</platform>
  <theme>steam</theme>
</system>" >> /etc/emulationstation/es_systems.cfg


# Create "ROM" folder
mkdir ~/RetroPie/roms/moonlight

# Now we’re going to create a script or multiple scripts for starting moonlight. I have 3 different scripts that connect to the same computer with either 1080p/30fps, 720p/60fps, or 720p/30fps so I can stream in different qualities depending on how well a certain game streams.

cd ~/RetroPie/roms/moonlight

echo "#!/bin/bash
moonlight stream $steampc -720 -30fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 720p30fps.sh

echo "#!/bin/bash
moonlight stream $steampc -1080 -30fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 1080p30fps.sh

echo "#!/bin/bash
moonlight stream $steampc -720 -60fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 720p60fps.sh

echo "#!/bin/bash
moonlight stream $steampc -1080 -60fps -mapping /opt/retropie/configs/moonlight/controllername.map" > 1080p60fps.sh

sudo chmod +x *

# Do with controller
cd /opt/retropie/configs
mkdir moonlight
cd moonlight
moonlight map controllername.map

# THEME STUFF
wget -N -P ./download http://jordanhotmann.com/wp-content/uploads/2015/09/steam.zip

unzip ./download/steam.zip

sudo mv steam /etc/emulationstation/themes/simple
