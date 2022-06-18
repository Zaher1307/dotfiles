#!/bin/bash

choice=$(printf "%s\n%s\n%s\n%s" "Shutdown" "Reboot" "Suspend" "Exit" | dmenu -i -p "Choose action: ")

[ $choice = "Shutdown" ] && shutdown now
[ $choice = "Reboot"   ] && shutdown -r now
[ $choice = "Exit"     ] && i3-msg exit
[ $choice = "Suspend"  ] && systemctl suspend
