#!/bin/bash

dconf dump / > /tmp/old

while true; do
	read -p "Make dconf changes. Done? [Y]: " answer
	if [[ ($answer = "y") || ($answer = "Y") ]]; then
		break
	fi
done

dconf dump / > /tmp/new

diff /tmp/old /tmp/new
rm /tmp/old /tmp/new
