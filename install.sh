#! /bin/sh
clear
files='alacritty/ i3/ polybar/ qutebrowser/ sway/ user-dirs.dirs waybar/ wmbash/'
currentfolder=${PWD}/.config
for f in $(ls -F .config); do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/.config/
done

files='bin/ .bashrc .vim/ .vimrc .xinitrc'
currentfolder=${PWD}
for f in $files; do 
    #echo "$currentfolder/$f $HOME/.config"
    ln -sf "$currentfolder/$f" "$HOME"/
done
