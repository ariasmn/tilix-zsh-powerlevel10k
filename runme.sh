#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "You should run the script as root!"
	exit
fi

# Installing git
apt install -y git
# Installing tilix from official PPA
apt install -y tilix
# Setting Tilix as the default terminal
update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.default-applications.terminal exec tilix"
# Install zsh
apt install -y zsh
# make zsh default shel
su $SUDO_USER -c "chsh -s $(which zsh)"
# Create fonts folder in your home dir
su $SUDO_USER -c "mkdir $HOME/.local/share/fonts"
# Install fonts needed for Powerlevel10k
su $SUDO_USER -c "wget -P /tmp/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf && mv /tmp/MesloLGS\ NF\ Regular.ttf  $HOME/.local/share/fonts/"
su $SUDO_USER -c "wget -P /tmp/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf && mv /tmp/MesloLGS\ NF\ Bold.ttf  $HOME/.local/share/fonts/"
su $SUDO_USER -c "wget -P /tmp/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf && mv /tmp/MesloLGS\ NF\ Italic.ttf  $HOME/.local/share/fonts/"
su $SUDO_USER -c "wget -P /tmp/ https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf && mv /tmp/MesloLGS\ NF\ Bold\ Italic.ttf  $HOME/.local/share/fonts/"
# Install Powerlevel10k
su $SUDO_USER -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
# Reboot would be nice
read -r -p "Do you want to reboot now? [Y/n]" response
response=${response,,} # tolower
 if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    reboot
 fi
