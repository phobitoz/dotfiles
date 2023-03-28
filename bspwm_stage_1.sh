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
echo -e "${White} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║ Script ${Red}(stage1)   "
echo -e "${White} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝                         "
}

# Script body
echo ""
reset
banner
echo ""
if which bspwm >/dev/null; then
	sleep 1
	echo -e "${White} [${Cyan}+${White}] The bspwm is installed"
	echo ""
	echo -e "${White} [${Cyan}+${White}] Downloading AlvinPix setup"
	sudo rm -rf /home/${user}/.config/bspwm
	mkdir -p /home/${user}/.config/bspwm
        cd /home/${user}/.config/bspwm
	echo ""
        wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/bspwm/bspwmrc
        chmod +x bspwmrc
        echo ""
else
	sleep 1
	echo -e "${White} [${Red}-${White}] The bspwm is not installed"
	echo ""
	echo -e "${White} [${Cyan}+${White}] Installing bspwm"
	echo ""
	sudo apt update
	echo ""
	sudo apt install bspwm -y
	echo ""
	echo -e "${White} [${Cyan}+${White}] Downloading AlvinPix setup"
	echo ""
	mkdir -p /home/${user}/.config/bspwm
	cd /home/${user}/.config/bspwm
	wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/bspwm/bspwmrc
	chmod +x bspwmrc
	echo ""
fi

if which sxhkd >/dev/null; then
	sleep 1
	echo -e "${White} [${Cyan}+${White}] The sxhkd is installed"
	echo ""
	echo -e "${White} [${Cyan}+${White}] Downloading AlvinPix setup"
	sudo rm -rf /home/${user}/.config/sxhkd
        mkdir -p /home/${user}/.config/sxhkd
        cd /home/${user}/.config/sxhkd
	echo ""
        wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/sxhkd/sxhkdrc
        chmod +x sxhkdrc
	echo ""
else
	sleep 1
	echo -e "${White} [${Red}-${White}] The sxhkd is not installed"
	echo ""
	echo -e "${White} [${Cyan}+${White}] Installing bspwm"
	echo ""
	sudo apt update
	echo ""
	sudo apt install sxhkd -y
	echo ""
	echo -e "${White} [${Cyan}+${White}] Downloading AlvinPix setup"
	echo ""
	mkdir -p /home/${user}/.config/sxhkd
	cd /home/${user}/.config/sxhkd
	wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/sxhkd/sxhkdrc
	chmod +x sxhkdrc
fi
