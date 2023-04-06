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
echo -e "${White} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║ Script ${Red}(stage4)   "
echo -e "${White} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝                         "
}

# Script body
body () {
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring ${Cyan}(polybar) ${White}cuts"
sleep 3
echo ""
sudo rm -rf /home/${user}/.config/polybar
mkdir -p /home/${user}/.config/polybar
cd
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
echo ""
./setup.sh
echo ""
cd /home/${user}/.config/polybar/cuts
sudo rm -rf colors.ini config.ini user_modules.ini
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/polybar/cuts/colors.ini
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/polybar/cuts/config.ini
echo ""
wget https://raw.githubusercontent.com/AlvinPix/dotfiles/main/.config/polybar/cuts/user_modules.ini
echo ""
echo -e "${White} [${Cyan}+${White}] Configuring the last settings"
sleep 3
echo -e "${White} [${Cyan}+${White}] Download your wallpaper for this bspwm"
sleep 5
echo ""
cd /home/${user}/.config/polybar/cuts/scripts
bash colors-dark.sh --gray
cd
git clone https://github.com/pipeseroni/pipes.sh.git
echo ""
}


# Call menus the script
clear
reset
banner
body
