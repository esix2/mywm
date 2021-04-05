#! /bin/sh
clear
ln -sf /home/priv/git/mydwm/wmbash/ /home/priv/.config
    files='alacritty/ sway-configs/sway/ sway-configs/waybar/ i3-configs/i3/ i3-configs/polybar/ wmbash/'
currentfolder=${PWD}
for f in $files; do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/.config/
done

files='.vim/ .vimrc .bashrc'
currentfolder=${PWD}
for f in $files; do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/.config/
done
