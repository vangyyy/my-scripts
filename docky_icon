#!/bin/bash

if [[ ($1 != "true") && ($1 != "false") ]]; then
	echo "Error: missing/invalid operand"
	echo "Usage: docky_icon [true/false]"
	exit
fi

gconftool-2 --type Boolean --set /apps/docky-2/Docky/Items/DockyItem/ShowDockyItem $1
service docky restart
