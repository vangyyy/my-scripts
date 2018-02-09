#!/bin/bash

# Add repositories
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:mmk2410/intellij-idea
sudo add-apt-repository -y ppa:maarten-fonville/android-studio
sudo add-apt-repository -y ppa:nilarimogard/webupd8 #dropbox
sudo add-apt-repository -y ppa:docky-core/stable
sudo add-apt-repository -y ppa:team-xbmc/ppa #kodi
sudo add-apt-repository -y ppa:gerardpuig/ppa #ubuntu-cleaner
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
# sudo add-apt-repository -y ppa:eugenesan/ppa #smartgit
# sudo add-apt-repository -y ppa:damien-moore/codeblocks-stable

# Update and Upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install applications
sudo apt-get -y install git chromium-browser firefox gedit gedit-plugins atom vim gksu nautilus-dropbox thunderbird docky gimp calibre vlc deluge deluged rhythmbox-plugin-alternative-toolbar spotify-client gparted exfat-utils exfat-fuse samba virtualbox synaptic ubuntu-cleaner oracle-java8-installer intellij-idea-ultimate android-studio adb pepperflashplugin-nonfree tlp tlp-rdw smartmontools ethtool tp-smapi-dkms acpitool texlive texlive-bibtex-extra biber texlive-latex-extra texlive-lang-czechslovak

# Clone icon packs
while true; do
	read -p "Do you want to clone Gnome icon pack from github ? [Y/n] " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		# My-Custom-Gnome
		if [ -d /usr/share/icons/My-Custom-Gnome ]; then
			echo "My-Custom-Gnome already exists. Aborting ..."
		else
			sudo git clone https://github.com/vangyyy/My-Custom-Gnome.git /usr/share/icons/My-Custom-Gnome
			echo "My-Custom-Gnome cloned."
		fi
		break
	elif [[ ($answer = "n") || ($answer = "N") ]]; then
		break
	fi
done

# Config system settings
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface show-battery-percentage  true
gsettings set org.gnome.desktop.interface clock-show-date  true
gsettings set org.gnome.desktop.interface clock-format 24h
gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.interface scaling-factor 1
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom-Gnome'
gsettings set org.gnome.desktop.peripherals.touchpad speed 1
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.background picture-uri 'file:///home/rastik/Dropbox/Wallpapers/Torvalds_right.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/rastik/Dropbox/Wallpapers/Torvalds.jpg'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5500
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.desktop volumes-visible true
gsettings set org.gnome.gedit.preferences.editor use-default-font false
gsettings set org.gnome.gedit.preferences.editor editor-font 'Monospace 15'
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"
gsettings set org.gnome.rhythmbox.plugins active-plugins "['mmkeys', 'notification', 'rb', 'artsearch', 'generic-player', 'mtpdevice', 'android', 'alternative-toolbar', 'audioscrobbler', 'iradio', 'power-manager', 'audiocd', 'ipod', 'daap', 'mpris', 'dbus-media-server']"

# Lock-screen scaling
sudo bash -c 'cat << EOF > /usr/share/glib-2.0/schemas/30_my-text-factor.gschema.override
[org.gnome.desktop.interface]
scaling-factor=1
text-scaling-factor=1.25
EOF'
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

# Spotify scaling
sudo sed -i 's/Exec=spotify %U/Exec=spotify --force-device-scale-factor=1.25 %U/g' /usr/share/applications/spotify.desktop

# gnome-shell extensions install
sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
gnomeshell-extension-manage --install --extension-id 808 --version 3.22 --user #Hide Workspace Thumbnails
gnomeshell-extension-manage --install --extension-id 570 --user #Todo.txt
gnomeshell-extension-manage --install --extension-id 442 --version 3.22 --user #Drop Down Terminal
gnomeshell-extension-manage --install --extension-id 55 --user #Media Player Indicator
gnomeshell-extension-manage --install --extension-id 104 --user #NetSpeed
gnomeshell-extension-manage --install --extension-id 905 --version 3.22 --user #Refresh WiFi Connections
gnomeshell-extension-manage --install --extension-id 118 --user #No Topleft Hot Corner
gnomeshell-extension-manage --install --extension-id 1128 --version 3.22 --user #Hide Activities Button
gnomeshell-extension-manage --install --extension-id 805 --version 3.22 --user #Hide Dash X
gnomeshell-extension-manage --install --extension-id 118 --user #No Topleft Hot Corner
gnomeshell-extension-manage --install --extension-id 112 --version 3.18 --user #Remove Accessibility
gnomeshell-extension-manage --install --extension-id 723 --version 3.22 --user #Pixel Saver

# Pixel Saver workaround
cd ~/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me/themes
mv Ambiance Ambiance.bak
ln -s default Ambiance

# Global dark theme
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=1
EOF

# Trackpoint sensitivity
sudo bash -c 'cat << EOF > /etc/udev/rules.d/10-trackpoint.rules
ACTION=="add", SUBSYSTEM=="input", ATTR{name}=="TPPS/2 IBM TrackPoint", ATTR{device/speed}="255"
EOF'

# Disable input sources
echo 'while read id; do xinput disable $id; done <<< $(xinput | grep 'Wacom' | cut -d"=" -f2 | cut -f1)' >> ~/.profile

# Change grub background and default OS to Windows
sudo bash -c 'cat << EOF > /usr/share/plymouth/themes/ubuntu-gnome-logo/ubuntu-gnome-logo.grub
if background_color 0,0,0; then
  clear
fi
EOF'
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT=2/' /etc/default/grub
sudo update-grub

#run to change style to vanilla gnome session
sudo apt-get install gnome-session
sudo update-alternatives --config gdm3.css

# Remove bloat
sudo apt-get -y purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku transmission-common transmission-gtk apport gnome-documents
sudo apt-get -y autoremove
sudo apt-get -y clean
