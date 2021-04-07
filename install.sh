#! /bin/sh
clear
files='alacritty/ sway-configs/sway/ sway-configs/waybar/ i3-configs/i3/ i3-configs/polybar/ wmbash/ user-dirs.dirs'
currentfolder=${PWD}
for f in $files; do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/.config/
done

files='.vim/ .vimrc .bashrc .xinitrc'
currentfolder=${PWD}
for f in $files; do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/
done
