#!/bin/bash

apt-get install libqtcore4 libqtgui4 libqt4-network libusb-1.0-0 libprotobuf7 ca-certificates

wget -N https://raw.github.com/tvdzwan/hyperion/master/bin/install_hyperion.sh

./install_hyperion.sh
