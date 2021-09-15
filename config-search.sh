#!/bin/bash
directories=$(cat ~/.scripts/dir-config-files | tr '\n' ' ' |sed -e 's. .|.g'|sed -e 's.|$..g')

option=$(find ~/.config -type f | grep -Ei "$directories" | sed -e 's-/home/ahmed/.config/--g' | rofi -dmenu)

if [ -n "$option" ];then
    xed /home/ahmed/.config/$option
fi
