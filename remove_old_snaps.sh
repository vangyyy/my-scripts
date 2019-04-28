#!/bin/bash

while true; do
	read -p "Close all snaps to continue. Done? [Y/y]: " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		break
	fi
done

set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
