#!/bin/bash

if [[ ($1 != "yoga") && ($1 != "desktop") ]]; then
	echo "Error: missing/invalid operand"
	echo "Usage: setup [yoga/desktop]"
	exit
fi

# Add repositories
sudo add-apt-repository -y ppa:webupd8team/java

# Update and Upgrade
sudo apt -y update
sudo apt -y upgrade

# dropbox, docky, synergy

sudo apt install -y git gnome-session gnome-tweak-tool gnome-system-monitor gedit-plugins baobab rhythmbox thunderbird gimp virtualbox deluge vlc chromium-browser gparted adb oracle-java8-installer texlive-full unrar curl

sudo snap remove gnome-system-monitor gnome-calculator gnome-characters gnome-logs
sudo snap install communitheme insomnia postman spotify
sudo snap install --classic atom
sudo snap install --classic phpstorm
sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic android-studio
sudo snap install --classic slack

sudo git clone https://github.com/vangyyy/My-Custom-Gnome.git /usr/share/icons/My-Custom-Gnome

# Config system settings
gsettings set org.gnome.desktop.interface show-battery-percentage  true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface clock-show-date  true
gsettings set org.gnome.desktop.interface clock-format 24h
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.background picture-options 'wallpaper'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'
gsettings set org.gnome.desktop.background picture-uri 'file:////usr/share/gnome-control-center/pixmaps/noise-texture-light.png'
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom-Gnome'
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5500
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.desktop volumes-visible true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"

# gnome-shell extensions install
sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
#gnomeshell-extension-manage --install --extension-id 442 --version 3.22 --user #Drop Down Terminal
gnomeshell-extension-manage --install --extension-id 104 --version 3.26 --user #NetSpeed
gnomeshell-extension-manage --install --extension-id 1128 --version 3.22 --user #Hide Activities Button
gnomeshell-extension-manage --install --extension-id 112 --version 3.18 --user #Remove Accessibility
gnomeshell-extension-manage --install --extension-id 723 --version 3.22 --user #Pixel Saver
#gnomeshell-extension-manage --install --extension-id 805 --version 3.22 --user #Hide Dash X
gnomeshell-extension-manage --install --extension-id 808 --version 3.22 --user #Hide Workspace Thumbnails
gnomeshell-extension-manage --install --extension-id 1011 --version 3.22 --user #Dynamic Panel Transparency

# Pixel Saver workaround
cd ~/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me/themes
mv Ambiance Ambiance.bak
ln -s default Ambiance

# Global dark theme
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=1
EOF

# Change grub background and default OS to Windows
sudo bash -c 'cat << EOF > /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub
if background_color 0,0,0; then
  clear
fi
EOF'
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT=2/' /etc/default/grub
sudo update-grub

# Lock-screen scaling
sudo bash -c 'cat << EOF > /usr/share/glib-2.0/schemas/30_my-text-factor.gschema.override
[org.gnome.desktop.interface]
scaling-factor=1
text-scaling-factor=1.25
EOF'
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

if [[ ($1 == "yoga") ]]; then
	# Disable input sources
	echo 'while read id; do xinput disable $id; done <<< $(xinput | grep 'Wacom' | cut -d"=" -f2 | cut -f1)' >> ~/.profile
fi

if [[ ($1 == "desktop") ]]; then
	# Install Nvidia drivers
	sudo ubuntu-drivers autoinstall
	# Disable suspend
	gsettings set org.gnome.desktop.session idle-delay 'uint32 0'
fi

# Clean
sudo apt purge apport memtest86+
sudo apt -y autoremove
sudo apt -y clean

