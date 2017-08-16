#!/bin/bash
exec > /dev/null
nmap -sP 192.168.1.*
#sudo nmap -sn 192.168.1.0/24 | egrep 'MAC'
network=$(arp -a -n | egrep -o "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})" | sort -V | awk '!seen[$0]++')
connected=/tmp/$USER/connected.log
> $connected
if egrep -i "14:cc:20:61:7c:1c" <<< "$network" ; then
	echo 'TP-link Router' >> $connected
fi
if egrep -i "00:22:75:01:e0:d5" <<< "$network" ; then
	echo 'Belkin Router' >> $connected
fi
if egrep -i "14:cc:20:d3:cd:6c" <<< "$network" ; then
	echo 'TP-link Extender' >> $connected
fi
if egrep -i "d8:cb:8a:58:6c:50" <<< "$network" ; then
	echo 'H97 Gaming 3' >> $connected
fi
if egrep -i "b8:27:eb:7d:dd:4f" <<< "$network" ; then
	echo 'Raspberry Pi 2 (LAN)' >> $connected
fi
if egrep -i "00:1d:43:30:1e:03" <<< "$network" ; then
	echo 'Raspberry Pi 2 (Wi-Fi)' >> $connected
fi
if egrep -i "54:27:58:95:6c:6d" <<< "$network" ; then
	echo 'LenovoPad' >> $connected
fi
if egrep -i "c0:ee:fb:58:3d:6e" <<< "$network" ; then
	echo 'Oneplus X' >> $connected
fi
if egrep -i "bc:f5:ac:df:d0:8c" <<< "$network" ; then
	echo 'Nexus 4' >> $connected
fi
if egrep -i "60:21:c0:1a:0e:02" <<< "$network" ; then
	echo 'Samsung Galaxy S2' >> $connected
fi
if egrep -i "c0:bd:d1:a9:d4:34" <<< "$network" ; then
	echo 'Samsung Galaxy Note 4' >> $connected
fi
if egrep -i "c4:85:08:10:fd:d8" <<< "$network" ; then
	echo 'Asus UX31A' >> $connected
fi
if egrep -i "60:f8:1d:a8:7e:d6" <<< "$network" ; then
	echo 'Apple Macbook Pro' >> $connected
fi
if egrep -i "c8:ff:28:fa:67:cd" <<< "$network" ; then
	echo 'Acer Aspire F15' >> $connected
fi

exec > /dev/tty
cat $connected
rm $connected
