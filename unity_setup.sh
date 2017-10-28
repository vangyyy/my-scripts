#!/bin/bash

# Add repositories
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:mmk2410/intellij-idea
sudo add-apt-repository -y ppa:nilarimogard/webupd8 #dropbox
sudo add-apt-repository -y ppa:docky-core/stable
sudo add-apt-repository -y ppa:noobslab/macbuntu
sudo add-apt-repository -y ppa:noobslab/themes #Flatabulous theme
sudo add-apt-repository -y ppa:team-xbmc/ppa #kodi
sudo add-apt-repository -y ppa:gerardpuig/ppa #ubuntu-cleaner
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
# sudo add-apt-repository -y ppa:eugenesan/ppa #smartgit
# sudo add-apt-repository -y ppa:damien-moore/codeblocks-stable

# Update and Upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install applications
sudo apt-get -y install git chromium-browser gedit gedit-plugins atom vim nano nautilus-dropbox docky macbuntu-os-ithemes-lts-v7 flatabulous-theme unity-tweak-tool gimp inkscape calibre vlc deluge rhythmbox-plugin-alternative-toolbar spotify-client gparted exfat-utils exfat-fuse virtualbox indicator-netspeed synaptic alacarte htop ubuntu-cleaner oracle-java8-installer intellij-idea-ultimate ubuntu-restricted-extras
# gcc make valgrind gdb cgdb libncurses5-dev libncurses5 cppcheck ncurses-doc arduino fritzing shutter compizconfig-settings-manager xclip tlp tlp-rdw smartgit git-cola codeblocks fastboot adb software-properties-common kodi pepperflashplugin-nonfree freshplayerplugin touchegg

# Clone icon packs
while true; do
	read -p "Do you want to clone icon packs from github ? [Y/n] " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		# My-Custom		
		if [ -d /usr/share/icons/My-Custom ]; then
			echo "My-Custom already exists. Aborting ..."
		else
			sudo git clone https://github.com/vangyyy/My-Custom.git /usr/share/icons/My-Custom
			echo "My-Custom cloned."
		fi
		# My-Custom-Dark
		if [ -d /usr/share/icons/My-Custom-Dark ]; then
			echo "My-Custom-Dark already exists. Aborting ..."
		else
			sudo git clone https://github.com/vangyyy/My-Custom-Dark.git /usr/share/icons/My-Custom-Dark
			echo "My-Custom-Dark cloned."
		fi
		break
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
gsettings set org.gnome.gedit.preferences.editor bracket-machting true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-Black'
gsettings set org.gnome.desktop.interface gtk-theme 'Flatabulous'
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom-Dark'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/rastik/Dropbox/Wallpapers/Chamonix.jpg'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.wm.preferences titlebar-font 0
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.rhythmbox.plugins active-plugins "['mmkeys', 'notification', 'rb', 'artsearch', 'generic-player', 'mtpdevice', 'android', 'alternative-toolbar', 'audioscrobbler', 'iradio', 'power-manager', 'audiocd', 'ipod', 'daap', 'mpris', 'dbus-media-server']"
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 1
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity 0.74904942512512207
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ background-color '#555753ff'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
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

# Change grub background
sudo bash -c 'cat << EOF > /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub
if background_color 0,0,0; then
  clear
fi
EOF'
sudo update-grub

# Trackpoint sensitivity setup
sudo bash -c 'cat << EOF > /etc/tmpfiles.d/tpoint.conf
w /sys/devices/platform/i8042/serio1/serio2/speed - - - - 200
w /sys/devices/platform/i8042/serio1/serio2/sensitivity - - - - 200
w /sys/devices/platform/i8042/serio1/serio2/inertia - - - - 6
w /sys/devices/platform/i8042/serio1/serio2/press_to_select - - - - 0
EOF'
sudo systemd-tmpfiles --prefix=/sys --create


# Remove bloat
sudo apt-get -y remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-calendar checkbox-gui totem example-content transmission-common transmission-gtk brltty onboard xdiagnose webbrowser-app apport
sudo apt-get -y autoremove && sudo apt-get -y clean all && sudo apt-get -y autoclean all

# Remove useless icons and folders
sudo rm -rf ~/examples.desktop ~/Templates ~/Public /usr/share/applications/webbrowser-app.desktop /usr/share/applications/ubuntu-amazon-default.desktop /usr/share/applications/gnome-system-log.desktop /usr/share/applications/git-dag.desktop /usr/share/applications/display-im6.desktop /usr/share/applications/display-im6.q16.desktop

