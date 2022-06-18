#!/bin/zsh

current_layout=$(xkb-switch)

[[ $current_layout = "us" ]] && setxkbmap -layout ara,us -model "pc105" -variant ""
[[ $current_layout = "ara" ]] && setxkbmap -layout us,ara -model "pc105" -variant ""

# refresh i3blocks
pkill -SIGRTMIN+12 i3blocks
