#!/bin/bash

# http://askubuntu.com/questions/761180/wifi-doesnt-work-after-suspend-after-16-04-upgrade
# http://askubuntu.com/questions/142128/open-windows-in-center-of-screen
# Android Studio (Android Studio -> Tools -> Create desktop Entry) ???

# Update and Upgrade
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Virtualbox
sudo adduser $USER vboxusers

# Grub
sudo apt-get -y remove memtest86+
sudo update-grub

# Install Applications
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:nilarimogard/webupd8 #dropbox
sudo add-apt-repository -y ppa:eugenesan/ppa #smartgit
sudo add-apt-repository -y ppa:docky-core/stable
sudo add-apt-repository -y ppa:noobslab/macbuntu
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
sudo apt-get -y update
sudo apt-get -y install docky macbuntu-os-ithemes-lts-v7 gcc make valgrind gdb cgdb gedit git gedit-plugins libncurses5-dev libncurses5 cppcheck ncurses-doc vim nano mcedit synaptic arduino fritzing virtualbox atom indicator-netspeed unity-tweak-tool chromium-browser nautilus-dropbox alacarte shutter gimp vlc compizconfig-settings-manager deluge inkscape calibre htop xclip exfat-utils exfat-fuse tlp tlp-rdw gparted smartgit git-cola spotify-client ubuntu-restricted-extras

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
gsettings set org.gnome.desktop.interface gtk-theme 'MacBuntu-OS-Unity-Classic'
gsettings set org.gnome.desktop.interface icon-theme 'My-Custom'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.wm.preferences auto-raise true
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'sk+qwerty')]"
gsettings set org.gnome.gedit.preferences.editor bracket-machting true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor scheme "cobalt"
gsettings set org.gnome.gedit.plugins active-plugins "['spell', 'quickopen', 'modelines', 'wordcompletion', 'bracketcompletion', 'git', 'codecomment', 'filebrowser', 'snippets', 'docinfo', 'externaltools', 'terminal', 'smartspaces', 'time']"
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.nautilus.window-state sidebar-width 180
gsettings set org.gnome.metacity show-maximized-titlebars true
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 1
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity 0.74169743061065674
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 40
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ background-color '#555753ff'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
dconf write /org/gnome/mutter/center-new-windows true
dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-bias-viewport false
dconf write /org/compiz/profiles/unity/plugins/grid/bottom-left-corner-action 1
dconf write /org/compiz/profiles/unity/plugins/grid/bottom-right-corner-action 3
dconf write /org/compiz/profiles/unity/plugins/grid/top-left-corner-action 7
dconf write /org/compiz/profiles/unity/plugins/grid/top-right-corner-action 9

# Remove bloat
sudo apt-get -y remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-calendar gnome-font-viewer checkbox-gui imagemagick totem example-content transmission-common transmission-gtk brltty onboard xdiagnose
sudo apt-get -y autoremove && sudo apt-get -y clean all && sudo apt-get -y autoclean all

# Remove useless icons and folders
sudo rm -rf ~/examples.desktop
sudo rm -rf ~/Templates
sudo rm -rf ~/Public
sudo rm -rf /usr/share/applications/webbrowser-app.desktop
sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm -rf /usr/share/applications/gnome-system-log.desktop
sudo rm -rf /usr/share/applications/git-dag.desktop
