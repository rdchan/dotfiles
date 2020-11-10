#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\e[36m\d\e[m \@] \u@\e[36m\h\e[m:\w\$ '
PS1='[\e[36m\d\e[m \@]:\W/\$ '
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
HISTSIZE=500

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

alias blue='systemctl start bluetooth.service && bluetoothctl'
alias ls='lsd -l'
alias pavu='pavucontrol'
alias print='systemctl start avahi-daemon.service && systemctl start org.cups.cupsd.service'
alias theme='cd /home/rishi/.config/awesome/themes/junerishi/'
alias xdim='xrandr --output HDMI2 --brightness 0.6 && xrandr --output HDMI1 --brightness 0.6'
alias xnight='xrandr --output HDMI2 --gamma 1:1:0.6 --brightness 0.3 && xrandr --output HDMI1 --gamma 1:1:0.6 --brightness 0.5'
alias xnorm='xrandr --output HDMI2 --brightness 1  && xrandr --output HDMI1 --brightness 1'
alias xevening='xrandr --output HDMI2 --brightness 0.6 &&  xrandr --output HDMI1 --gamma 1:1:0.6 --brightness 0.6'
alias xsame='xrandr --output HDMI2 --same-as HDMI1'
alias xsplit='xrandr --output HDMI2 --auto --mode 1920x1080 --left-of HDMI1'
alias xsolo='xrandr --output HDMI2 --off'
alias xdual='xrandr --output HDMI2 --auto --mode 1920x1080' 
alias fal='cd ~/Documents/fall2020'
alias math='cd ~/Documents/fall2020/math/'
alias os='cd ~/Documents/fall2020/os/'
alias opl='cd ~/Documents/fall2020/opl/'

#if ["$TERM" = "linux" ]; then
#    echo -en "\e]P0282828" #black
#    echo -en "\e]P8504945" #darkgrey
#    echo -en "\e]P1cc241d" #darkred
#    echo -en "\e]P9fb4934" #red
#    echo -en "\e]P298971a" #darkgreen
#    echo -en "\e]PAb8bb26" #green
#    echo -en "\e]P3d79921" #darkyellow
#    echo -en "\e]PBfabd2f" #yellow
#    echo -en "\e]P4458588" #darkblue
#    echo -en "\e]PC83a598" #blue
#    echo -en "\e]P5b16286" #darkmagenta
#    echo -en "\e]PDd3869b" #magenta
#    echo -en "\e]P6289c93" #darkcyan
#    echo -en "\e]PE33c5ba" #cyan
#    echo -en "\e]P7a89984" #lightgrey
#    echo -en "\e]PFebdbb2" #cyan
#    clear #for background artifacting
#fi
