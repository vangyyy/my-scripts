#!/bin/bash

# Update
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Remove bloat
sudo apt-get -y remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-calendar gnome-font-viewer checkbox-gui imagemagick totem example-content transmission-common transmission-gtk brltty onboard xdiagnose webbrowser-app apport
sudo apt-get -y autoremove && sudo apt-get -y clean all && sudo apt-get -y autoclean all

# Remove useless icons
sudo rm -rf /usr/share/applications/webbrowser-app.desktop
sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm -rf /usr/share/applications/gnome-system-log.desktop
sudo rm -rf /usr/share/applications/git-dag.desktop
