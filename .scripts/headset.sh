#!/bin/zsh

has_headset=$(grep -A4 -ri 'Headphone Playback Switch' /proc/asound/card*/* | grep '0x00 0x00')

[[ $has_headset ]] && echo ""
