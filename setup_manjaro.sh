#!/bin/bash

REMOVE_FILES=(
	$HOME/Templates/ $HOME/Public/
	$HOME/.config/autostart/create-template.desktop
	/usr/share/gnome-shell/extensions/*
)

PACKAGES_TO_REMOVE=(
	manjaro-gdm-theme manjaro-gnome-assets matcha-gtk-theme papirus-icon-theme yaru-gtk-theme \
	manjaro-hello hexchat appimagelauncher epiphany networkmanager-openconnect mhwd-tui yelp \
	gtkhash imagewriter totem qt4
)

PACKAGES_TO_INSTALL=(
	adb vim unrar chrome-gnome-shell gedit-plugins openssh deluge gimp inkscape rhythmbox vlc vinagre \
	jdk intellij-idea-ultimate-edition android-studio webstorm phpstorm visual-studio-code-bin postman \
	google-chrome etcher spotify gpmdp virtualbox slack-desktop teamviewer synergy ttf-roboto-mono \
	noto-fonts manjaro-printer #TODO:texlive-full
)

KB_SHORTCUTS=(
	'<Primary><Alt>t;	gnome-terminal;			Open terminal'
	'<Alt>d;			xset dpms force off;	Turn off display'
)

declare -A EXTENSIONS
EXTENSIONS=(
	[0019]="User Themes"
	[0118]="No Topleft Hot Corner"
	[0307]="Dash to Dock"
	[0355]="Status Area Horizontal Spacing"
	[0800]="Remove Dropdown Arrows"
	[1128]="Hide Activities Button"
	[1217]="Appfolders Management"
)

function log() {
	echo -e "\e[96m[$(date +%T.%3N)]\e[0m $1"
}

function banner() {
	echo -e "\n\e[1m############################################################"
	printf "####  %-48s  ####\n" "$@"
	echo -e "############################################################\e[0m\n"
}

banner "REMOVING FILES AND DIRECTORIES"
for FILE in "${REMOVE_FILES[@]}" ; do
	if [ -d "$FILE" ] ; then
		log "Removing file \e[91m${FILE}\e[0m"
		sudo rm -rf $FILE
	else
		log "Skipping \e[93m$FILE\e[0m (non-existent)"
	fi
done

banner "REMOVING PACKAGES"
for PKG in "${PACKAGES_TO_REMOVE[@]}" ; do
	if yay -Qi $PKG &> /dev/null ; then
		log "Removing \e[91m${PKG}\e[0m"
		yay -Rsc ${PKG} --noconfirm
	else
		log "Skipping \e[93m$PKG\e[0m (not installed)"
	fi
done

banner "INSTALLING PACKAGES"
for PKG in "${PACKAGES_TO_INSTALL[@]}" ; do
	if yay -Qi $PKG &> /dev/null ; then
		log "Skipping \e[93m$PKG\e[0m (already installed)"
	else
		log "Installing \e[32m${PKG}\e[0m"
		yay -S $PKG --noconfirm
	fi
done

banner "GNOME EXTENSIONS"
SCRIPT_NAME="gnomeshell-extension-manage"
if command -v $SCRIPT_NAME > /dev/null ; then
    log "Skipping \e[93m$SCRIPT_NAME\e[0m script (already cloned)"
else
	log "Cloning \e[32m$SCRIPT_NAME\e[0m script"
	SCRIPT_URL="https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
	sudo wget -O /usr/local/bin/$SCRIPT_NAME $SCRIPT_URL
	sudo chmod +x /usr/local/bin/$SCRIPT_NAME
fi
for ID in "${!EXTENSIONS[@]}" ; do
	log "Installing \e[32m${EXTENSIONS[$ID]}\e[0m (id: $ID)"
    gnomeshell-extension-manage --install --extension-id $ID --user --version latest
done

banner "KEYBOARD SHORTCUTS"
for i in "${!KB_SHORTCUTS[@]}"
do
	# Turn 'binding;command;name' into array ['binding', 'command', 'name']
    IFS=";" read -r -a arr <<< "${KB_SHORTCUTS[i]}"	

	BINDING=$(sed -e 's/^[ \t]*//' <<< ${arr[0]})
	COMMAND=$(sed -e 's/^[ \t]*//' <<< ${arr[1]})
	NAME=$(sed -e 's/^[ \t]*//' <<< ${arr[2]})

	log "Setting \e[32m$NAME\e[0m ($BINDING)"

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ binding "$BINDING"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ command "$COMMAND"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/ name "$NAME"

    KEYBINDING_LIST+="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${i}/', "
done

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[${KEYBINDING_LIST::-2}]"