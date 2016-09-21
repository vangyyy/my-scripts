#!/bin/bash

# What to backup
backup_files="/home/$USER/.ssh /home/$USER/.gimp-2.8 /home/$USER/.thunderbird /home/$USER/.mozilla /home/$USER/.atom /home/$USER/.bashrc /home/$USER/.gitconfig /home/$USER/.smartgit /home/$USER/.shutter /home/$USER/.gconf /home/$USER/.gnome /home/$USER/.gnome2 /home/$USER/.compiz /home/$USER/.IdeaIC2016.2 /home/$USER/.local /home/$USER/.config /home/$USER/Pictures /home/$USER/Calibre_library /home/$USER/bin /usr/share/icons/My-Custom /usr/share/applications/android-studio.desktop /usr/share/applications/intellij-idea-community.desktop"

# Where to backup to
dest="/home/$USER/Backups"

if [ ! -d "$dest" ]; then
	echo "Location does not exists"
	echo "Creating location ..."
	mkdir -pv $dest
fi

# Create archive filename
TIME_STAMP=$(date +%Y%m%d)
archive_file="$USER@$HOSTNAME-$TIME_STAMP.tgz"

# Print start status message
echo "Backing up to $dest/$archive_file"
date
echo "Please wait, backing up ..."

# Create README file
echo "Created: $(date)
Contains: $backup_files" > README.txt

# Backup the files using tar
tar czf $dest/$archive_file -P --absolute-names $backup_files README.txt

# Remove README file
rm README.txt

# Print end status message
echo "Backup finished !"
date
