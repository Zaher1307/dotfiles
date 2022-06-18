#!/bin/zsh

printf "%.2f%s\n" "$(( $(mpstat 1 1 | tail -1 | awk '{print 100.0-$12}') ))" "%"
