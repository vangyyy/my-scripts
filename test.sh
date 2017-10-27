#!/bin/bash

# sudo sed -i 'N;s/<allow\ssend_destination="org.freedesktop.UPower"\n\s\s\s\s\s\s\s\s\s\s\ssend_interface="org.freedesktop.UPower.KbdBacklight"/<deny send_destination="org.freedesktop.UPower"\n           send_interface="org.freedesktop.UPower.KbdBacklight"/' /etc/dbus-1/system.d/org.freedesktop.UPower.conf

# duplicity file:///home/rastik/Desktop/Backups/deja-dup/ ~/Desktop/abc

#sudo bash -c 'cat << EOF > /etc/tmpfiles.d/tpoint.conf
#w /sys/devices/platform/i8042/serio1/serio2/speed - - - - 255
#w /sys/devices/platform/i8042/serio1/serio2/sensitivity - - - - 255
#EOF'
#sudo systemd-tmpfiles --prefix=/sys --create
