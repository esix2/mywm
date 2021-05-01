#Keyboard layout
setxkbmap de &

## Disable power saving
xset -dpms
xset s off

session=${1:-kde}
case $session in
    i3|i3wm           ) exec i3;;
    kde               ) export DESKTOP_SESSION=plasma; exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    #     *                 ) exec $1;;
esac
