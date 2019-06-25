#!/bin/bash

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~ Adding repositories, update, upgrade ~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo add-apt-repository -y ppa:linuxuprising/java
sudo add-apt-repository -y ppa:alexlarsson/flatpak
sudo add-apt-repository -y ppa:gerardpuig/ppa #ubuntu-cleaner
sudo apt -y update
sudo apt -y upgrade

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~ Installing apt packages ~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~ TO DO: dropbox, synergy, teamviewer ~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Gnome related
sudo apt -y install gnome-tweaks gnome-system-monitor gnome-calculator chrome-gnome-shell
# Core packages
sudo apt -y install git adb vim unrar curl net-tools gedit-plugins exfat-fuse exfat-utils
# Java (interactive)
sudo apt -y install oracle-java12-installer oracle-java11-installer
# Flatpak
sudo apt -y install flatpak gnome-software-plugin-flatpak
# LaTeX
sudo apt -y install texlive-full latexila
# Necessities
sudo apt -y install baobab rhythmbox gparted dconf-editor usb-creator-gtk gimp inkscape ubuntu-cleaner virtualbox deluge deluged vlc chromium-browser
# Ssh
sudo apt -y install openssh-client openssh-server

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~ Installing snap packages ~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo snap install communitheme
sudo snap install --classic webstorm
sudo snap install --classic phpstorm
sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic android-studio
sudo snap install --classic code
sudo snap install --classic slack

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~ Installing pip packages ~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo pip install --upgrade scour #for Papirus

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~ Installing flatpak packages ~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak -y install postman spotify skype googleplaymusicdesktopplayer

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~ Cloning repositories ~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

rm -rf $HOME/Templates/ $HOME/Public/
mkdir $HOME/.icons $HOME/.themes $HOME/bin
git clone https://github.com/vangyyy/my-scripts.git $HOME/bin/my-scripts
#TODO: Replace with Papirus
git clone https://github.com/vangyyy/My-Custom-Gnome.git $HOME/.icons/My-Custom-Gnome

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~ Configuring gsettings ~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~ TO DO: switch to Communitheme from login screen ~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-format 24h
gsettings set org.gnome.desktop.interface clock-show-seconds true
#TODO: Replace with Papirus
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom-Gnome'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.background picture-options 'wallpaper'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'
gsettings set org.gnome.desktop.background picture-uri 'file:////usr/share/gnome-control-center/pixmaps/noise-texture-light.png'
gsettings set org.gnome.desktop.screensaver picture-options 'wallpaper'
gsettings set org.gnome.desktop.screensaver primary-color '#000000'
gsettings set org.gnome.desktop.screensaver secondary-color '#000000'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:////usr/share/gnome-control-center/pixmaps/noise-texture-light.png'
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5500
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.desktop volumes-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ foreground-color 'rgb(255,255,255)'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ foreground-color 'rgb(255,255,255)'
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~ Setting up scaling ~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Lockscreen and text scaling
sudo bash -c 'cat << EOF > /usr/share/glib-2.0/schemas/30_my-text-factor.gschema.override
[org.gnome.desktop.interface]
scaling-factor=1
text-scaling-factor=1.25
EOF'
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

# Chromium scaling
sudo sed -i 's/CHROMIUM_FLAGS=""/CHROMIUM_FLAGS="--force-device-scale-factor=1"/' /etc/chromium-browser/default

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~ Installing Gnome extensions ~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
gnomeshell-extension-manage --install --extension-id 800 --user #Remove Dropdown Arrows
gnomeshell-extension-manage --install --extension-id 1217 --user #Appfolders Management
gnomeshell-extension-manage --install --extension-id 1267 --user #No Title Bar
gnomeshell-extension-manage --install --extension-id 1011 --user #Dynamic Panel Transparency

gnomeshell-extension-manage --install --extension-id 355 --version 3.26 --user #Status Area Horizontal Spacing
#gnomeshell-extension-manage --install --extension-id 1036 --version 3.22 --user #Extensions
gnomeshell-extension-manage --install --extension-id 1128 --version 3.22 --user #Hide Activities Button
gnomeshell-extension-manage --install --extension-id 112 --version 3.18 --user #Remove Accessibility

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~ GRUB settings ~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Change grub background and default OS to Windows
sudo bash -c 'cat << EOF > /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub
if background_color 0,0,0; then
  clear
fi
EOF'
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT=2/' /etc/default/grub
sudo update-grub

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~ Autostart Synergy ~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Start Synergy 5 seconds upon startup
cat > $HOME/.config/autostart/synergy.desktop << EOF
[Desktop Entry]
Type=Application
Name=Synergy
Comment=Keyboard and mouse sharing solution
Exec=/usr/bin/synergy
Icon=synergy
X-GNOME-Autostart-Delay=5
EOF

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~ Device specific settings ~~~~~~~~~~~~~~~~~~~~/'

if grep -Fxq 31 '/sys/class/dmi/id/chassis_type'; then
	echo -e '/~~~~~~~~~~~~~~~~~~~~~~~ Thinkpad X1 Yoga ~~~~~~~~~~~~~~~~~~~~~~~~~/'
	echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

	# Installing apt packages
	sudo apt install xournal

	# Installing Gnome extensions
	gnomeshell-extension-manage --install --extension-id 1319 --user # GSConnect
	gnomeshell-extension-manage --install --extension-id 945 --user # CPU Power Manager

	# Disable input sources
	line='while read id; do xinput disable $id; done <<< $(xinput | grep 'Finger' | cut -d"=" -f2 | cut -f1)' # Use 'Wacom' for all touch input
	file=$HOME/.profile
	grep -qF "$line" "$file" || echo -e "\n# Disable input sources\n$line" >> "$file"

	# Trackpoint sensitivity
	sudo bash -c 'cat << EOF > /etc/udev/rules.d/10-trackpoint.rules
ACTION=="add", SUBSYSTEM=="input", ATTR{name}=="TPPS/2 IBM TrackPoint", ATTR{device/speed}="255"
EOF'

fi

if grep -Fxq 3 '/sys/class/dmi/id/chassis_type'; then
	echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Desktop ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
	echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

	# Install Nvidia drivers
	sudo ubuntu-drivers autoinstall

	# Disable suspend
	gsettings set org.gnome.desktop.session idle-delay 'uint32 0'
fi

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~ Removing packages ~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo snap remove gnome-system-monitor gnome-calculator gnome-characters gnome-logs
sudo apt -y purge apport memtest86+
sudo apt -y autoremove
sudo apt -y clean
