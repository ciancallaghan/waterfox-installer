#!/bin/bash

if [[ $EUID != 0 ]]; then
		echo "Please run as root/sudo"
		exit
fi

pkginfo=`curl -s "https://api.github.com/repos/WaterfoxCo/Waterfox/releases/latest" | grep linux`
pkgname=`echo $pkginfo | grep name | head -n 1 | cut -d '"' -f 4`
pkgurl=`echo $pkginfo | grep download_url | head -n 1 | cut -d '"' -f 8`

wget $pkgurl
tar -xf $pkgname -C /opt
cp ./waterfox.desktop /usr/share/applications/waterfox.desktop
ln -s /opt/waterfox/waterfox /usr/bin/waterfox
rm $pkgname
