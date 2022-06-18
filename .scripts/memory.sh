#!/bin/zsh

total=$(cat /proc/meminfo | head -2 | xargs echo -n | cut -d ' ' -f 2)
avail=$(cat /proc/meminfo | head -2 | xargs echo -n | cut -d ' ' -f 5)

echo $(bc <<< "scale=2; ($total-$avail)/$total * 100")%
