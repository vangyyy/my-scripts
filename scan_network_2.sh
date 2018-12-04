#!/usr/bin/env bash

# Character for separating values
# (commas are not safe, because some servers return speeds with commas)
sep=";"

# Temporary file holding ...
log=/tmp/$USER/scan_network.log

# Display header?
if test "$1" = "--header"; then
	tplinkRouter="TP-link Router"
	belkinRouter="Belkin Router"
	extender="TP-link Extender"
	h97="H97 Gaming 3"
	rpi2wifi="Raspberry Pi 2 (LAN)"
	rpi2lan="Raspberry Pi 2 (Wi-Fi)"
	lenovopad="LenovoPad"
	oneplusX="Oneplus X"
	nexus4="Nexus 4"
	sgs2="Samsung Galaxy S2"
	sgn4="Samsung Galaxy Note 4"
	zenbook="Asus UX31A"
	macbook="Apple Macbook Pro"
	aceraspiref15="Acer Aspire F15"
else
	mkdir -p `dirname $log`

	exec > /dev/null
	#ping -b 192.168.1.255 -c 4
	nmap -sP 192.168.1.*
	#sudo nmap -sn 192.168.1.0/24 | egrep 'MAC'
	network=$(arp -a -n | egrep -o "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})" | sort -V | awk '!seen[$0]++')
	>$log

	# Parse
	if egrep -i "14:cc:20:61:7c:1c" <<< "$network" ; then
		echo 'TP-link Router' >> $log
	fi
	if egrep -i "00:22:75:01:e0:d5" <<< "$network" ; then
		echo 'Belkin Router' >> $log
	fi
	if egrep -i "14:cc:20:d3:cd:6c" <<< "$network" ; then
		echo 'TP-link Extender' >> $log
	fi
	if egrep -i "d8:cb:8a:58:6c:50" <<< "$network" ; then
		echo 'H97 Gaming 3' >> $log
	fi
	if egrep -i "b8:27:eb:7d:dd:4f" <<< "$network" ; then
		echo 'Raspberry Pi 2 (Ethernet)' >> $log
	fi
	if egrep -i "00:1d:43:30:1e:03" <<< "$network" ; then
		echo 'Raspberry Pi 2 (Wi-Fi Dongle)' >> $log
	fi
	if egrep -i "54:27:58:95:6c:6d" <<< "$network" ; then
		echo 'LenovoPad' >> $log
	fi
	if egrep -i "c0:ee:fb:58:3d:6e" <<< "$network" ; then
		echo 'Oneplus X' >> $log
	fi
	if egrep -i "bc:f5:ac:df:d0:8c" <<< "$network" ; then
		echo 'Nexus 4' >> $log
	fi
	if egrep -i "60:21:c0:1a:0e:02" <<< "$network" ; then
		echo 'Samsung Galaxy S2' >> $log
	fi
	if egrep -i "c0:bd:d1:a9:d4:34" <<< "$network" ; then
		echo 'Samsung Galaxy Note 4' >> $log
	fi
	if egrep -i "a4:34:d9:a9:cf:36" <<< "$network" ; then
		echo 'Lenovo X1 Yoga (Wi-Fi)' >> $log
	fi
	if egrep -i "00:0e:c6:de:2f:fc" <<< "$network" ; then
		echo 'Lenovo X1 Yoga (Ethernet Dongle)' >> $log
	fi
	if egrep -i "60:f8:1d:a8:7e:d6" <<< "$network" ; then
		echo 'Apple Macbook Pro (Wi-Fi)' >> $log
	fi
	if egrep -i "00:e0:4c:68:5b:4c" <<< "$network" ; then
		echo 'Apple Macbook Pro (Ethernet Dongle)' >> $log
	fi

	exec > /dev/tty
	cat $log
	rm $log
fi

# Send to IFTTT
#secret_key="bG4D_FeohOfjeR0AHoibO9"
#value1=`echo $server_ping | cut -d" " -f1`
#value2=`echo $download | cut -d" " -f1`
#value3=`echo $upload | cut -d" " -f1`
#json="{\"value1\":\"${value1}\",\"value2\":\"${value2}\",\"value3\":\"${value3}\"}"
#curl -X POST -H "Content-Type: application/json" -d "${json}" https://maker.ifttt.com/trigger/scanNetwork/with/key/${secret_key}
