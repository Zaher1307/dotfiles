#!/bin/bash

arg=$1

[ $arg = "up"     ] && pactl set-source-volume @DEFAULT_SOURCE@ +5%
[ $arg = "down"   ] && pactl set-source-volume @DEFAULT_SOURCE@ -5%
[ $arg = "toggle" ] && pactl set-source-mute   @DEFAULT_SOURCE@ toggle

pkill -SIGRTMIN+10 i3blocks

