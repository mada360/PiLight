#CHECK IF STEAM ALREADY THERE
if grep $1 kodi /etc/emulationstation/es_systems.cfg; then
	echo "Kodi already added as a system."
else
#Create backup and then add a shortcut to your pc in Emulation Station.
cp /etc/emulationstation/es_systems.cfg es_systems.cfg.bak

# Add moonlight system and backup old config
mv /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bak

sed '$d' /etc/emulationstation/es_systems.cfg.bak > /etc/emulationstation/es_systems.cfg

ls

cat ./scripts/kodi  >> /etc/emulationstation/es_systems.cfg

fi


# Create "ROM" folder
mkdir /home/pi/RetroPie/roms/kodi

# Now we’re going to create a script or multiple scripts for starting moonlight. I have 3 different scripts that connect to the same computer with either 1080p/30fps, 720p/60fps, or 720p/30fps so I can stream in different qualities depending on how well a certain game streams.

cd /home/pi/RetroPie/roms/kodi


# Creates a profile for the 4 most common streaming settings and allows for streaming more intensive games at lower res/fps for stable connection.

echo "#!/bin/bash
kodi-standalone" > Kodi.sh

chmod +x *
