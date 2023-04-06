#!/bin/bash

# Username
user=$(whoami)

# Colors
Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'
NC='\033[0m'
blue='\033[0;34m'
white='\033[0;37m'
lred='\033[0;31m'

# Presentation the script
banner () {
echo -e "${White} ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗                         "
echo -e "${White} ██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║                         "
echo -e "${White} ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║                         "
echo -e "${White} ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║                         "
echo -e "${White} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║ Script ${Red}(stage3)   "
echo -e "${White} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝                         "
}

# Script Body
body () {
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring kitty terminal${White}"
sleep 3
echo ""
sudo rm -rf /home/${user}/.config/kitty
mkdir -p /home/${user}/.config/kitty
cd /home/${user}/.config/kitty
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/kitty/color.ini
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/kitty/kitty.conf
echo ""
echo -e "${White} [${Cyan}+${White}] kitty terminal configured${White}"
sleep 3
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(.zshrc)${White}"
sleep 3
echo ""
cd
sudo rm -rf .zshrc
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.zshrc
echo ""
echo -e "${White} [${Cyan}+${White}] Installing missing dependencies ${Cyan}(.zshrc)${White}"
sleep 3
echo ""
sudo apt update
sudo apt install scrub bat -y
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(.zshrc) ${White}sudo plugin"
sleep 3
echo ""
cd /usr/share
sudo mkdir -p zsh-sudo
cd zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(.zshrc) ${White}powerlevel10k"
sleep 3
echo ""
cd
echo ""
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(.zshrc) ${White}shell-color-scripts"
sleep 3
cd
echo ""
git clone https://github.com/charitarthchugh/shell-color-scripts.git
echo ""
cd shell-color-scripts
sudo rm -rf colorscript.sh
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/colorscript.sh
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(neofetch)${White}"
sleep 3
echo ""
sudo rm -rf /home/${user}/.config/neofetch
mkdir -p /home/${user}/.config/neofetch
cd /home/${user}/.config/neofetch
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/neofetch/config.conf
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(.zshrc) ${White}fzf"
sleep 3
echo ""
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(cava)${White}"
sleep 3
sudo rm -rf /home/${user}/.config/cava
mkdir -p /home/${user}/.config/cava
cd /home/${user}/.config/cava
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/cava/config_other
echo ""
mv config_other config
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(ranger)${White}"
sleep 3
echo ""
sudo rm -rf /home/${user}/.config/ranger
mkdir -p /home/${user}/.config/ranger
cd /home/${user}/.config/ranger
mkdir -p plugins
mkdir -p ranger_udisk_menu
cd plugins
mkdir -p __pycache__
mkdir -p ranger_devicons
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/plugins/__init__.py
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/plugins/compress.py
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/plugins/extract.py
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/plugins/kdeconnect.py
echo ""
cd
cd /home/${user}/.config/ranger
cd ranger_udisk_menu
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/ranger_udisk_menu/ranger.txt
echo ""
cd
cd /home/${user}/.config/ranger
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/commands.py
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/rc.conf
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/rifle.conf
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/ranger/scope.sh
echo ""
}

# Call menus the script
clear
reset
banner
body
