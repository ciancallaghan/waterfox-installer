#!/bin/sh

set -e

if [ "$(id -u)" != 0 ]; then
	echo "Must be run as sudo/root"
	exit 1
fi

if ! hash curl; then
	echo "Curl is required. Please install it."
	exit 1
elif ! hash wget; then
	echo "Wget is required. Please install it."
	exit 1
elif ! hash tar; then
	echo "Tar is required. Please install it."
	exit 1
fi

version=$(curl -s "https://api.github.com/repos/WaterfoxCo/Waterfox/releases/latest" | grep "tag_name" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g')
pkgurl="https://cdn1.waterfox.net/waterfox/releases/$version/Linux_x86_64/waterfox-$version.tar.bz2"
pkgname="waterfox-$version.tar.bz2"

wget "$pkgurl"
tar -xf "$pkgname" -C /opt
cp ./waterfox.desktop /usr/share/applications/waterfox.desktop
ln -s /opt/waterfox/waterfox /usr/bin/waterfox
rm "$pkgname"
