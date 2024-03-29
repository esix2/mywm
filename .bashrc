# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda config --set auto_activate_base False 2>/dev/null
## <<< conda initialize <<<

##########################################################
####### user defined settings
##########################################################
##########################################################
##########################################################
##########################################################




export HISTSIZE=10000
export NO_AT_BRIDGE=1
export PATH=$HOME/bin:$PATH

# disable CPS LOCK
setxkbmap -option ctrl:nocaps

alias ?='whatis'

### aliases for git
alias gst='git status'
alias gadd='git add'
alias gcomm='git commit -m'
alias gdiff='git diff'
alias gcheck='git checkout'
alias gpull='git pull'
alias gpush='git push'
alias graph='git log --decorate --oneline --graph --all'

# alias for latexmk
alias texmake='latexmk -pdf -pvc -interaction=nonstopmode' 
# alias for easycopy
alias easypath='echo $(pwd) | xclip -i -selection clipboard'
alias lastcomm='!$:p | xclip -i -selection clipboard'

alias easypaste='xclip -selection clipboard -o'
alias easyopen='nemo $(pwd) &'

alias getmonitors='xrandr | grep -w connected'
alias sshti='ssh zandi@draco.ti.rwth-aachen.de'
alias sshcore='ssh m3c@10.1.0.1'
#alias sshcore='ssh m3c@192.168.1.11'
alias sshenb1='ssh -oHostKeyAlgorithms=+ssh-dss admin@192.168.1.44'
alias sshenb2='ssh -oHostKeyAlgorithms=+ssh-dss admin@192.168.1.45'

alias rsrpblinq='snmpwalk -v2c -c public 192.168.2.1 pmpDevCpeLteRSRP.0'
alias rsrpmikro='snmpwalk -v2c -c public 192.168.4.1 mtxrLTEModemSignalRSRP.1'

alias ipa='ip -br -4 a'
alias ipl='ip -br link'
alias gettime='date +%Y-%m-%d-%H-%M-%S'
export PATH=$PATH:/usr/local/go/bin
alias vlanrm='for i in {1..9}; do sudo ip l del vlan."$i"00 2>/dev/null; done'
function bl {
if [ "$1" == "off" ]; then
    bluetoothctl power off
elif [ "$1" == "bose" ]; then
    bluetoothctl power on; bluetoothctl connect 60:AB:D2:7A:22:88
fi
}
alias j='jobs'
alias s='source ~/.bashrc'
alias ,rl='source ~/.bashrc'
export EDITOR=vim

##### To start qutebrowser natively in Wayland
#export XDG_SESSION_TYPE=wayland 
#export GDK_BACKEND=wayland
open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
cd_with_fzf() {
cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 1
}
pacs() {
sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}
#############  Key bindings
bind '"\C-f":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'
bind '"\C-v":"vim\n"'
bind '"\C-t":" fg\n"'
