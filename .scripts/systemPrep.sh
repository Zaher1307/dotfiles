#!/bin/sh

printf "### Syncronizing Database...\n"
sudo pacman -Sy
printf "### Upadate System...\n"
sudo pacman -Su
printf "### Building Tools...\n"
sudo pacman -S git gcc gdb make pkg-config cmake
printf "### Install X...\n"
sudo pacman -S xorg-server xorg-xinit xorg-xbacklight libx11 libxft glibc 
sudo pacman -S xorg
printf "### Install Terminal...\n"
sudo pacman -S rxvt-unicode
printf "### Install i3...\n"
sudo pacman -S i3-gaps i3blocks i3lock i3status
sudo pacman -S xdotool
printf "### Install Suckless Tools...\n"
sudo pacman -S dmenu
printf "### Install Network Manager Applet...\n"
sudo pacman -S network-manager-applet
printf "### Install File Management tools...\n"
sudo pacman -S ranger fzf 
printf "### Install Diagnostics...\n"
sudo pacman -S bashtop
printf "### Install Man Pages...\n"
sudo pacman -S man-pages man-db tealdeer
printf "### Install Multimedia...\n"
sudo pacman -S vlc ffmpeg youtube-dl sxiv maim feh xclip 
printf "### Install General Tools...\n"
sudo pacman -S sxhkd okular firefox alsa-utils pulseaudio unzip arandr rsync shellcheck
printf "### Install Social Programs...\n"
sudo pacman -S discord telegram-desktop
printf "### Install qBittorent...\n"
sudo pacman -S qbittorrent
printf "### Install Filesysems support...\n"
sudo pacman -S fuse-exfat nfs-utils
printf "## Install Disk utils...\n"
sudo pacman -S testdisk ncdu
printf "### Install AUR support...\n"
sudo pacman -S yay
printf "### Install Syncplay...\n"
yay -S syncplay
printf "### Install Fonts...\n"
yay -S nerd-fonts-inconsolata nerd-fonts-sf-mono

#printf "### Copying dotfiles..."
#sudo cp /mnt/hdd/dotfiles/* ~/
#printf "### Copying wallpapers..."
#sudo cp -rv /mnt/hdd/dotfiles/pictures/wallpapers/ /usr/share/slick-greeter/
