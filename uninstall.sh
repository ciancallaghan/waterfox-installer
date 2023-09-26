#!/bin/sh

set -e

if [ "$(id -u)" != 0 ]; then
	echo "Must be run as sudo/root."
	exit 1
fi

rm -r /opt/waterfox
rm /usr/share/applications/waterfox.desktop
rm /usr/bin/waterfox
