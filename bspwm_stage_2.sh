#!/bin/bash

# Get usarname
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
echo -e "${White} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║ Script ${Red}(stage2)   "
echo -e "${White} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝                         "
}


# Script body
body () {
echo ""
reset
banner
echo ""
echo -e "${White} [${Cyan}+${White}] Installing missing dependencies"
echo ""
sudo apt install fonts-firacode fonts-cantarell cava rofi lxappearance nitrogen polybar picom compton kitty lsd betterlockscreen flameshot neofetch -y
echo ""
echo -e "${White} [${Cyan}?${White}] Which composer do you want to use?"
echo ""
echo -e "${White} [${Yellow}1${White}] compton"
echo -e "${White} [${Yellow}2${White}] picom"
echo ""
echo -ne "${White} Ghost > ${Yellow}"
read whatcomposer
case $whatcomposer in

1)
cd /home/${user}/.config/bspwm/
echo "compton &" >> bspwmrc
compton &
echo ""
echo -e "${White} [${Cyan}+${White}] Composer configured ${Cyan}(compton.conf)"
sleep 2
exit ;;

2)
mkdir -p /home/${user}/.config/picom
cd /home/${user}/.config/picom
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/picom/picom.conf
echo ""
cd /home/${user}/.config/bspwm/
echo "picom &" >> bspwmrc
echo -e "${White} [${Cyan}+${White}] Composer configured ${Cyan}(picom.conf)"
sleep 2
exit ;;

* )
echo -e "${Blue} The option is not valid please choose a number or letters"
sleep 2
exit ;;
esac
}

# Call menus the script
reset
banner
body
