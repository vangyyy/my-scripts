#!/bin/bash
exec > /dev/null
nmap -sP 192.168.1.*
#sudo nmap -sn 192.168.1.0/24 | egrep 'MAC'
network=$(arp -a -n | egrep -o "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})" | sort -V | awk '!seen[$0]++')
> connected.txt
if egrep -i "14:cc:20:d3:cd:6c" <<< "$network" ; then
	echo 'TP-link Extender' >> connected.txt
fi
if egrep -i "c0:ee:fb:58:3d:6e" <<< "$network" ; then
	echo 'Oneplus X' >> connected.txt
fi
if egrep -i "bc:f5:ac:df:d0:8c" <<< "$network" ; then
	echo 'Nexus 4' >> connected.txt
fi
if egrep -i "c4:85:08:10:fd:d8" <<< "$network" ; then
	echo 'Asus UX31A' >> connected.txt
fi
if egrep -i "00:1d:43:30:1e:03" <<< "$network" ; then
	echo 'Raspberry Pi 2 (Chinese adapter)' >> connected.txt
fi
if egrep -i "C0:BD:D1:A9:D4:34" <<< "$network" ; then
	echo '??? Samsung Galaxy Note 4' >> connected.txt
fi
if egrep -i "C8:FF:28:FA:67:CD" <<< "$network" ; then
	echo '??? Acer Aspire F15' >> connected.txt
fi
if egrep -i "b0:d0:9c:37:82:ff" <<< "$network" ; then
	echo 'Samsung Galaxy Tab 10.1' >> connected.txt
fi
if egrep -i "60:21:c0:1a:0e:02" <<< "$network" ; then
	echo 'Samsung Galaxy S2' >> connected.txt
fi
exec > /dev/tty
cat connected.txt
