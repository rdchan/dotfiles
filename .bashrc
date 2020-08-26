#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd -l'
#PS1='[\e[36m\d\e[m \@] \u@\e[36m\h\e[m:\w\$ '
PS1='[\e[36m\d\e[m \@]:\W/\$ '
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
HISTSIZE=500
