#!/bin/bash

# http://askubuntu.com/questions/761180/wifi-doesnt-work-after-suspend-after-16-04-upgrade
# gksu service network-manager restart
# gksu systemctl restart network-manager.service
# Android Studio, packettracer, sqldatabase

# Copy wallpapers
while true; do
	read -p "Do you want to copy wallpapers ? [Y/n] " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		if [ -d "Wallpapers" ]; then
			cp -a ./Wallpapers/ ~/Pictures/
			echo "Wallpapers copied."
			break
		else
			echo "Wallpapers folder does not exist. Aborting ..."
			exit 1
		fi
	elif [[ ($answer = "n") || ($answer = "N") ]]; then
		break
	fi
done

# Update and Upgrade
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Virtualbox (uncomment)
#sudo adduser $USER vboxusers

# Grub
sudo apt-get -y remove memtest86+
sudo update-grub

# Install Applications
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:nilarimogard/webupd8 #dropbox
sudo add-apt-repository -y ppa:eugenesan/ppa #smartgit
sudo add-apt-repository -y ppa:mmk2410/intellij-idea-community
sudo add-apt-repository -y ppa:damien-moore/codeblocks-stable
sudo add-apt-repository -y ppa:docky-core/stable
sudo add-apt-repository -y ppa:noobslab/macbuntu
sudo add-apt-repository -y ppa:noobslab/themes #Flatabulous theme
sudo add-apt-repository -y ppa:team-xbmc/ppa #kodi
sudo add-apt-repository -y ppa:gerardpuig/ppa #ubuntu-cleaner
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
sudo apt-get -y update
sudo apt-get -y install docky macbuntu-os-ithemes-lts-v7 flatabulous-theme gcc make valgrind gdb cgdb gedit git gedit-plugins libncurses5-dev libncurses5 cppcheck ncurses-doc vim nano mcedit synaptic arduino fritzing virtualbox atom indicator-netspeed unity-tweak-tool chromium-browser nautilus-dropbox alacarte shutter gimp vlc compizconfig-settings-manager deluge inkscape calibre htop xclip exfat-utils exfat-fuse tlp tlp-rdw gparted smartgit git-cola oracle-java8-installer intellij-idea-community codeblocks spotify-client fastboot adb ubuntu-restricted-extras software-properties-common kodi pepperflashplugin-nonfree freshplayerplugin ubuntu-cleaner rhythmbox-plugin-alternative-toolbar touchegg

# Clone icon packs
while true; do
	read -p "Do you want to clone icon packs ? [Y/n] " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		sudo git clone https://github.com/vangyyy/My-Custom.git /usr/share/icons/My-Custom
		sudo git clone https://github.com/vangyyy/My-Custom-Dark.git /usr/share/icons/My-Custom-Dark
	elif [[ ($answer = "n") || ($answer = "N") ]]; then
		break
	fi
done

# Config system settings
gsettings set com.ubuntu.sound allow-amplified-volume true
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.indicator.datetime show-seconds true
gsettings set com.canonical.indicator.datetime time-format "24-hour"
gsettings set com.canonical.indicator.datetime timezone-name "Europe/Bratislava Bratislava"
gsettings set com.canonical.indicator.messages applications "['thunderbird.desktop']"
gsettings set com.canonical.indicator.sound interested-media-players "['spotify.desktop', 'rhythmbox.desktop']"
gsettings set com.canonical.indicator.sound preferred-media-players "['rhythmbox.desktop']"
gsettings set com.canonical.Unity always-show-menus true
gsettings set com.canonical.Unity integrated-menus true
gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
gsettings set com.canonical.Unity.FilesLens use-locate false
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://gnome-terminal.desktop', 'application://synaptic.desktop', 'application://org.gnome.Software.desktop', 'application://virtualbox.desktop', 'application://libreoffice-writer.desktop', 'application://libreoffice-calc.desktop', 'application://libreoffice-impress.desktop', 'application://deluge.desktop', 'application://chromium-browser.desktop', 'application://chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.desktop', 'application://firefox.desktop', 'unity://running-apps', 'application://cheese.desktop', 'unity://desktop-icon', 'unity://expo-icon', 'unity://devices']"
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-Black'
gsettings set org.gnome.desktop.interface gtk-theme 'Flatabulous'
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom-Dark'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/rastik/Pictures/Wallpapers/Chamonix.jpg'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.wm.preferences auto-raise true
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.rhythmbox.plugins active-plugins "['mmkeys', 'notification', 'rb', 'artsearch', 'generic-player', 'mtpdevice', 'android', 'alternative-toolbar', 'audioscrobbler', 'iradio', 'power-manager', 'audiocd', 'ipod', 'daap', 'mpris', 'dbus-media-server']"
gsettings set org.gnome.gedit.preferences.editor bracket-machting true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.window-state sidebar-width 180
gsettings set org.gnome.metacity show-maximized-titlebars true
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 1
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity 0.74904942512512207
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 40
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ background-color '#555753ff'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
dconf write /org/gnome/mutter/center-new-windows true
dconf write /org/gnome/settings-daemon/peripherals/mouse/locate-pointer true
dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-bias-viewport false
dconf write /org/compiz/profiles/unity/plugins/grid/bottom-left-corner-action 1
dconf write /org/compiz/profiles/unity/plugins/grid/bottom-right-corner-action 3
dconf write /org/compiz/profiles/unity/plugins/grid/top-left-corner-action 7
dconf write /org/compiz/profiles/unity/plugins/grid/top-right-corner-action 9

# Global dark theme
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=1
EOF

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

# Remove bloat
sudo apt-get -y remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-calendar checkbox-gui totem example-content transmission-common transmission-gtk brltty onboard xdiagnose webbrowser-app apport
sudo apt-get -y autoremove && sudo apt-get -y clean all && sudo apt-get -y autoclean all

# Remove useless icons and folders
sudo rm -rf ~/examples.desktop
sudo rm -rf ~/Templates
sudo rm -rf ~/Public
sudo rm -rf /usr/share/applications/webbrowser-app.desktop
sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm -rf /usr/share/applications/gnome-system-log.desktop
sudo rm -rf /usr/share/applications/git-dag.desktop
sudo rm -rf /usr/share/applications/display-im6.desktop #imagemagick
sudo rm -rf /usr/share/applications/display-im6.q16.desktop
