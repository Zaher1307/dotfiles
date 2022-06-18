#!/bin/sh
choice=$(printf "⏻|Shutdown\n|Reboot\n|Exit" | rofi -dmenu -font "Cascadia mono 15")

[ $choice = "⏻|Shutdown" ] && shutdown now
[ $choice = "|Reboot"   ] && shutdown -r now
[ $choice = "|Exit"     ] && i3-msg exit
