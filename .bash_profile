#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

neofetch
export PATH=$PATH:~/Scripts/:~/.local/bin
startx
xset r rate 180 40
feh --bg-scale .config/i3/wallpapers/fullwall.jpg
