#! /bin/bash
cd ~/Pictures
sleep 0.12
if [ $# -eq "0" ];
then scrot --freeze --select;
else 
    if [ $1 = "--clip" ];
    then 
        cd ~/scripts/temp/
        scrot --freeze --select -e 'xclip -selection clipboard -t image/png -i $f'
    fi
fi
