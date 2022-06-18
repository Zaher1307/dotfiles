#!/bin/zsh

layout=$(xkb-switch)

[[ $layout = 'us' ]] && echo 'EN'
[[ $layout = 'ara' ]] && echo 'AR'
