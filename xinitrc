#!/bin/sh
#
# X11 Initialization Commands
#
# Author: Ben White
# URL: benwhite.io

[[ -f ~/.compton.conf ]] && compton -b --config ~/.compton.conf

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh  --bg-fill ~/dotfiles/wallpapers/stag.jpg

setxkbmap -option ctrl:nocaps
          # -option altwin:swap_alt_win

xset -b

exec i3
