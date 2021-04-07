#Keyboard layout
setxkbmap de &

## Restarting dwm without exiting
#while true; do
#    dwm > /dev/null 2>&1
#done
## to disable screen saver (blanking)
xset -dpms
xset s off

exec i3
#exec cinnamon-session2d
#exec lightdm
