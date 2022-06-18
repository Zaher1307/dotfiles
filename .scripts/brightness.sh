#!/bin/bash

arg=$1
[ $arg = "up"   ] && xbacklight -inc 10
[ $arg = "down" ] && xbacklight -dec 10
