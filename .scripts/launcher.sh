#!/bin/sh

choice=$(printf "Ranger\nVim\nDiscord\nFirefox\nTelegram\nSyncplay\nYouTube Music\n" |  dmenu -p "Launcher: " -i)

case "$choice" in
    "Ranger")         i3-msg 'exec urxvt -e ranger'                                 ;;
    "Vim")            i3-msg 'exec urxvt -e vim'                                    ;;
    "Discord")        discord                                                       ;;
    "Firefox")        firefox                                                       ;;
    "Telegram")       telegram-desktop                                              ;;
    "Syncplay")       syncplay                                                      ;;
    "YouTube Music")  xfce4-terminal -e $HOME/.scripts/music.sh -T "YouTube Music"  ;;
    *)              exit
esac
