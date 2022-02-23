#!/bin/zsh

# xorg
# feh --no-fehbg --bg-scale '/usr/share/backgrounds/foolmoon2.png' '/usr/share/backgrounds/foolmoon1.png'
# picom &

# wayland
kanshi &
oguri &
exec "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # ?
