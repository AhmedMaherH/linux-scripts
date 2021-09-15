#!/bin/bash
option=$(echo -e "suspend
shutdown
logout
reboot
lock"|rofi -dmenu -p "power")

case $option in
    "suspend")
        systemctl suspend
    ;;

    "shutdown")
        shutdown now
    ;;

    "reboot")
        reboot
    ;;

    "logout")
        openbox --exit
    ;;

    "lock")
        dm-tool lock
    ;;

    *)
        echo "Invalid option"
    ;;
esac
