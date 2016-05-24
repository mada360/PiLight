#!/bin/bash

# Pair with PC
moonlight pair $steampc

# Do with controller
cd /opt/retropie/configs
mkdir moonlight
cd moonlight
moonlight map controllername.map
