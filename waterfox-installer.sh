#!/bin/bash

pkginfo=`curl -s "https://api.github.com/repos/WaterfoxCo/Waterfox/releases/latest" | grep linux`
pkgname=`echo $pkginfo | grep name | head -n 1 | cut -d '"' -f 4`
pkgurl=`echo $pkginfo | grep download_url | head -n 1 | cut -d '"' -f 8`

echo $pkginfo
echo $pkgname
echo $pkgurl

wget $pkgurl
tar -xf $pkgname -C /opt
cp ./waterfox.desktop /usr/share/applications/waterfox.desktop
cp ./waterfox.svg /usr/share/icons/waterfox.svg
ln -s /opt/waterfox/waterfox /usr/bin/waterfox
rm ./*.tar.*
