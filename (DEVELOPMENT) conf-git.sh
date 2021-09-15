#!/bin/bash

if [ ! -d "~/.scripts/logs" ]; then
    mkdir -p ~/.scripts/logs
fi

case $1 in
    "cconf")
        if [ ! -d "~/git/.config" ]; then mkdir -p ~/git/.config; fi

        cd ~/git/.config/

        if [ ! -d "fcitx" ]; then mkdir -p ~/git/.config/fcitx; fi
        if [ ! -d "tint2" ]; then mkdir -p ~/git/.config/tint2; fi

        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        cp -rvu ~/.config/{keepassxc,dunst,gtk-3.0,nitrogen,openbox,pcmanfm,PulseEffects,rofi} ~/{.Xresources,.bashrc,.gtkrc-2.0} .
        cp -rvu ~/.config/fcitx/{config,conf} ./fcitx
        cp -rvu ~/.config/tint2/tint2rc ./tint2
        }  >> ~/.scripts/logs/conf-git-log

        if (( $# >= 2 )); then
            case $2 in
                "g")
                    git init
                    read -p "Enter README.md text: " rm_msg
                    echo "$rm_msg"
                    git add -A
                    read -p "Enter commit description: " commit_msg
                    git commit -m "$commit_msg"
                    git branch -M main
                    git remote add origin https://github.com/AhmedMaherH/.config.git
                    git push -u origin main
                ;;
            esac
        fi
        ;;

    "dconf")
        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        cp -rvu ~/git/.config ~/
        } >> ~/.scripts/logs/conf-git-log
        ;;



    "cscript")
        if [ ! -d "~/git/.scripts" ]; then mkdir -p ~/git/.scripts; fi
        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        cp -rvu ~/.scripts/*.sh ~/git/.scripts
        } >> ~/.scripts/logs/conf-git-log
        
        if (( $# >= 2 )); then
            case $2 in
                "g")
                    cd ~/git/.scripts
                    git init
                    read -p "Enter README.md text: " rm_msg
                    echo "$rm_msg"
                    git add -A
                    read -p "Enter commit description: " commit_msg
                    git commit -m "$commit_msg"
                    git branch -M main
                    git remote add origin https://github.com/AhmedMaherH/.scripts.git
                    git push -u origin main
                ;;
            esac
        fi
        ;;

    "dscript")
        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        cp -rvu ~/git/.scripts ~/
        } >> ~/.scripts/logs/conf-git-log
        ;;



    "dwp")
        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        cp -rvu ~/git/wallpapers ~/Pictures/
        } >> ~/.scripts/logs/conf-git-log
        ;;



    "dtheme")
        {
        if [ -s "~/.scripts/logs/conf-git-log" ]; then echo -e '\n\n\n\n';fi
        echo "[ $(date) ]"
        echo -e ''
        sudo cp -rvu ~/git/themes/A* /usr/share/themes
        cp -rvu ~/git/themes/.icons ~/
        } >> ~/.scripts/logs/conf-git-log
        ;;

    *)
        echo "Invalid parameters"
        ;;
esac
