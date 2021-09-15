#!/bin/bash
option=$(ls -1NA /usr/share/man/man1/ | sed -e 's/.gz//g' | rofi -dmenu)
PAGER='less --color=dr --color=uy --mouse --wheel-lines=2' alacritty -t "man $option" -e man $option
