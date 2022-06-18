#!/bin/zsh

arg=$(xkb-switch)

[[ $arg == 'us' ]] && echo '[en]'
[[ $arg == 'ar(qwerty)' ]] && echo '[ar]'

