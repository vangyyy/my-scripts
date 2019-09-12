#!/bin/bash

# Install nvm (node version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Load nvm and nvm bash_completion into current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install NodeJS (defaults to stable release)
while true; do
    read -p "Would you like to install node $(nvm version-remote)? [y/n]: " answer
    if [ $answer = "y" ]; then
        nvm install stable
        nvm alias default stable
        break
    elif [ $answer = "n" ]; then
        break
    fi
done
