#!/bin/bash

# Check for existing docker installation
if path=$(command -v docker) ; then
    echo "Docker already installed as $path. Aborting."
    exit 1
fi

# Let user choose installation method
echo "Installation methods:"
PS3="Selection: "
select option in "Snap" "Repository" "Official script" do
    case $option in
        "Snap")
            echo "Installing from snap package."
            sudo snap install docker
            break;;
        "Repository")
            echo "Installing from system repository."
            sudo apt install docker.io
            break;;
        "Official script")
            echo "Installing using official get-docker script."
            curl -sSL https://get.docker.com | sh
            break;;
        *);;
    esac
done

# Create docker user group
if ! grep -q "docker" /etc/group; then
    sudo groupadd docker
fi

# Assign current user to docker user group
if ! grep -q "docker:[a-z0-9:]*:[\w,]*$USER[\w,]*" /etc/group; then
    sudo usermod -aG docker $USER
    echo "Please log out and back in to complete the setup."
fi