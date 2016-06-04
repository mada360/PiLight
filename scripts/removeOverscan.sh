#!/bin/bash

# Change value in /boot/config.txt to uncomment the line to disable overscan
sudo sed -i.bak 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
