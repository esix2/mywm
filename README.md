## Put the following lines into /etc/udev/rules.d/backlight.rules

#ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664" 
RUN+="/bin/chgrp wheel /sys/class/backlight/intel_backlight/brightness" 
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"

## Run:
$bash install.sh
