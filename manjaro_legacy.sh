#!bin/bash

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Update ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

yay -Syyu --noconfirm

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~ Remove junk ~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Remove stupid folders
rm -rf $HOME/Templates/ $HOME/Public/ $HOME/.config/autostart/create-template.desktop

# Purge all extensions
sudo rm -rf /usr/share/gnome-shell/extensions/*

# Remove mangaro theming
sudo pacman -Rsc manjaro-gdm-theme manjaro-gnome-assets papirus-icon-theme matcha-gtk-theme

# Remove packages
sudo pacman -Rsc --noconfirm manjaro-hello hexchat appimagelauncher epiphany networkmanager-openconnect mhwd-tui lshw yelp gtkhash imagewriter totem qt4

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~ Official packages ~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo pacman -S --noconfirm adb vim unrar chrome-gnome-shell gedit-plugins openssh deluge gimp inkscape rhythmbox vlc vinagre

# TODO: dropbox

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~ AUR packages ~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Development
yay -S --noconfirm jdk intellij-idea-ultimate-edition android-studio webstorm phpstorm visual-studio-code-bin postman

# Nice to have
yay -S --noconfirm google-chrome spotify gpmdp virtualbox slack-desktop teamviewer texlive-full ttf-roboto-mono noto-fonts etcher

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~ Gnome extensions ~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
gnomeshell-extension-manage --install --extension-id 0019 --user                # User Themes
gnomeshell-extension-manage --install --extension-id 0118 --user                # No Topleft Hot Corner
gnomeshell-extension-manage --install --extension-id 0307 --user                # Dash to Dock
gnomeshell-extension-manage --install --extension-id 0355 --user                # Status Area Horizontal Spacing
gnomeshell-extension-manage --install --extension-id 0800 --user --version 3.30 # Remove Dropdown Arrows
#gnomeshell-extension-manage --install --extension-id 1011 --user # Dynamic Panel Transparency
gnomeshell-extension-manage --install --extension-id 1128 --user --version 3.22 # Hide Activities Button
gnomeshell-extension-manage --install --extension-id 1217 --user                # Appfolders Management

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~ Cloning repositories ~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

mkdir $HOME/.icons $HOME/.themes $HOME/bin
git clone https://github.com/vangyyy/my-scripts.git $HOME/bin/my-scripts
git clone https://github.com/vangyyy/papirus-icon-theme.git $HOME/bin/papirus-icon-theme
$HOME/bin/papirus-icon-theme/my_install.sh

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~ GNOME settings ~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

gsettings set org.gnome.desktop.interface clock-format 24h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface font-name 'Noto Sans Display 11'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans Display 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Roboto Mono Medium 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'firefox.desktop', 'chrome-bgjohebimpjdhhocbknplfelpmdhifhd-Default.desktop', 'chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.desktop', 'gpmdp.desktop', 'spotify.desktop', 'synergy.desktop', 'deluge.desktop', 'postman.desktop', 'visual-studio-code.desktop', 'gnome-system-monitor.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop']"
gsettings set org.gnome.desktop.background picture-options 'wallpaper'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'
gsettings set org.gnome.desktop.background picture-uri 'file:////usr/share/gnome-control-center/pixmaps/noise-texture-light.png'
gsettings set org.gnome.desktop.screensaver picture-options 'wallpaper'
gsettings set org.gnome.desktop.screensaver primary-color '#000000'
gsettings set org.gnome.desktop.screensaver secondary-color '#000000'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:////usr/share/gnome-control-center/pixmaps/noise-texture-light.png'
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_R']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.desktop.session idle-delay 'uint32 0'
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5500
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-color 'rgb(30, 40, 50)'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ foreground-color 'rgb(255,255,255)'
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "solarized-dark"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~ Gnome extensions settings ~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

EXTENSIONS=$HOME/.local/share/gnome-shell/extensions
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock background-color '#000000'
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock background-opacity 1.0
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock force-straight-corner true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings --schemadir $EXTENSIONS/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DOTS'
#gsettings --schemadir $EXTENSIONS/dynamic-panel-transparency@rockon999.github.io/schemas/ set org.gnome.shell.extensions.dynamic-panel-transparency enable-background-color true
#gsettings --schemadir $EXTENSIONS/dynamic-panel-transparency@rockon999.github.io/schemas/ set org.gnome.shell.extensions.dynamic-panel-transparency enable-opacity true
#gsettings --schemadir $EXTENSIONS/dynamic-panel-transparency@rockon999.github.io/schemas/ set org.gnome.shell.extensions.dynamic-panel-transparency theme-opacity 255
#gsettings --schemadir $EXTENSIONS/dynamic-panel-transparency@rockon999.github.io/schemas/ set org.gnome.shell.extensions.dynamic-panel-transparency unmaximized-opacity 255

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~ Custom keyboard shortcuts ~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

KB_SHORTCUTS=(
	'<Primary><Alt>t;	gnome-terminal;			Open terminal'
	'<Alt>d;			xset dpms force off;	Turn off display'
)

for i in "${!KB_SHORTCUTS[@]}"; do
	# Turn 'binding;command;name' into array ['binding', 'command', 'name']
	IFS=";" read -r -a arr <<<"${KB_SHORTCUTS[i]}"

	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ binding "${arr[0]}"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ command "${arr[1]}"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ name "${arr[2]}"

	KEYBINDING_LIST+="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/', "
done

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[${KEYBINDING_LIST::-2}]"

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~ Load bash profile ~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

#TODO: Bash profile

echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~ Synergy  setup ~~~~~~~~~~~~~~~~~~~~~~~~/'
echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

# Install Synergy
yay -S --noconfirm synergy

# Needed to avoid crash upon startup
#gnomeshell-extension-manage --install --extension-id 0615 --user # KStatusNotifierItem/AppIndicator Support

# Start Synergy 5 seconds upon booting up
# cat >$HOME/.config/autostart/synergy.desktop <<EOF
# [Desktop Entry]
# Type=Application
# Name=Synergy
# Comment=Keyboard and mouse sharing solution
# Exec=/usr/bin/synergy
# Icon=synergy
# X-GNOME-Autostart-Delay=5
# EOF

if grep -Fxq 31 '/sys/class/dmi/id/chassis_type'; then
	echo -e '\n/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/'
	echo -e '/~~~~~~~~~~~~~~~~~~~~ Laptop specific settings ~~~~~~~~~~~~~~~~~~~~/'
	echo -e '/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/\n'

	# Install packages
	sudo pacman -S iio-sensor-proxy xournal

	# Start gyroscope service
	systemctl start iio-sensor-proxy

	# Gnome extensions
	gnomeshell-extension-manage --install --extension-id 0945 --user                                          # CPU Power Manager

	# Disable input sources
	line='while read id; do xinput disable $id; done <<< $(xinput | grep 'Finger' | cut -d"=" -f2 | cut -f1)' # Use 'Wacom' for all touch input
	file=$HOME/.profile
	grep -qF "$line" "$file" || echo -e "\n# Disable input sources\n$line" >>"$file"

	# Trackpoint sensitivity
	sudo bash -c 'cat << EOF > /etc/udev/rules.d/10-trackpoint.rules
ACTION=="add", SUBSYSTEM=="input", ATTR{name}=="TPPS/2 IBM TrackPoint", ATTR{device/speed}="255"
EOF'
fi

# Touch screen scrolling in firefox (needed after every update)
sudo sed -i "s|Exec=|Exec=env MOZ_USE_XINPUT2=1 |g" /usr/share/applications/firefox.desktop

# Enableing services
sudo systemctl enable org.cups.cupsd.service

sudo systemctl enable docker
