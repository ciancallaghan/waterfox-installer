#!/bin/bash

if [[ $EUID != 0 ]]; then
		echo "Please run as root/sudo"
		exit
fi

rm -r /opt/waterfox
rm /usr/share/applications/waterfox.desktop
rm /usr/share/icons/waterfox.svg
rm /usr/bin/waterfox
