#!/usr/bin/bash

# Download ufpa VPN configuration
# link get from UFPA public domain http://www.ctic.ufpa.br/vpn/fedora.htm
if [ ! -f UFPAvpn-config-Fedora.zip ] then
	wget http://www.ctic.ufpa.br/vpn/files/UFPAvpn-config-Fedora.zip
fi

if [ ! -d UFPAvpn-config-Fedora ] then
	unzip UFPAvpn-config-Fedora.zip
	cd UFPAvpn-config-Fedora/
fi

if [ -f ufpa.conf ] then
	mv ufpa.conf ufpa.ovpn
else
	echo "No configuration file found!"
	exit 0
fi

echo '<ca>' >> ufpa.ovpn
cat ca.crt >> ufpa.ovpn
echo -e '\n<\\ca>' >> ufpa.ovpn




