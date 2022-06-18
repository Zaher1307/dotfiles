#!/bin/sh

invisible=$(i3-msg -t get_tree | jq | grep i3bar)

if [[ -z $invisible ]]
then
    i3-msg bar mode dock 
else
    i3-msg bar mode invisible
fi
