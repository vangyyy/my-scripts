#!/bin/bash

# http://askubuntu.com/questions/761180/wifi-doesnt-work-after-suspend-after-16-04-upgrade
# gksu service network-manager restart
# gksu systemctl restart network-manager.service
# Android Studio, packettracer, sqldatabase

# Touchegg and palm detection config
cat > ~/.xprofile << EOF
# Touchegg setup
synclient TapButton2=0
synclient ClickFinger2=0
synclient TapButton3=0
synclient ClickFinger3=0
synclient HorizTwoFingerScroll=0
synclient VertTwoFingerScroll=0
touchegg &

# Palm detection setup
xinput set-prop 13 "Synaptics Palm Detection" 1
xinput set-prop "13" "Synaptics Palm Dimensions" 5, 5
EOF

