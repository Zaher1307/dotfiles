#!/bin/sh

choice=$(ls $HOME/.scripts/ | dmenu -i -p "Open: ")

[ $choice ] && i3-msg exec "urxvt -e vim $HOME/.scripts/$choice"
