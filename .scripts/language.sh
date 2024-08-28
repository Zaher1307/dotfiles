#!/bin/zsh

xkb-switch -n

# refresh i3blocks
pkill -SIGRTMIN+12 i3blocks
