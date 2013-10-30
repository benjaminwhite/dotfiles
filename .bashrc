# Ben White

# ------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------

platform=$(uname -s)
# Return if not an interactive shell
[[ "$-" != *i* ]] && return

# If it exists and is readable, source ~/.git-completion.bash
[[ -r ~/.git-completion.bash ]] && . ~/.git-completion.bash

# If it exists and is readable, source ~/.bash_local
[[ -r ~/.bash_local ]] && . ~/.bash_local

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

# Escape sequences for colors
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
reset="\033[m"

# Red user if root, green otherwise
if [[ $UID -eq 0 ]]; then
    u="$red"
else
    u="$blue"
fi

# Red @host if ssh, green otherwise
#if [[ -n "${!SSH_CONNECTION[@]}" ]]; then
    #h="$red"
#else
    #h="$blue"
#fi

# Yellow working directory
wd="$yellow"

# Prints the escape sequence for red if nonzero exit status, reset otherwise
function status_color() {
    if [[ $exit_status -ne 0 ]]; then
        echo -ne "$red"
    else
        echo -ne "$reset"
    fi
}

# Store the exit status of the previous process
export PROMPT_COMMAND='exit_status=$?;'

# Surround color escape sequences in PS1 with \[ \] unless SunOS
if [[ $platform == "SunOS" ]]; then
    export PS1="$u\u$h@\h $wd\W \$(status_color)\\$ $reset"
else
    export PS1="\[$u\]\u\[$h\]@\h \[$wd\]\W \[\$(status_color)\]\\$ \[$reset\]"
fi

# ------------------------------------------------------------------------------
# Options
# ------------------------------------------------------------------------------
if [ $platform == "Darwin" ]; then
    export PATH="/usr/local/bin:/usr/local/sbin:~/Scripts/:~/Scripts/OSXey-Script/:$PATH"
else
    export PATH="/usr/local/bin:/usr/local/sbin::$PATH"
fi
#Set vi Mode 
set -o vi
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen
# ^p move up one
bind -m vi-insert "\C-p":history-search-backward
# ^n move down one
bind -m vi-insert "\C-n":history-search-forward
# Ignore duplicates and commands that start with whitespace
export HISTCONTROL="ignoreboth"

# Append history instead of overwriting
shopt -s histappend

# Set default editor
export EDITOR="vim"

# Use vim for man
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man nonu noma nomod' -\""

# Color grep output
export GREP_OPTIONS="--color=auto"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
# Useful
alias 'cd..'='cd ..'
alias ping='ping -c 5'
alias sl='sl -a'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias checkblock="pgrep -f -l -u root blockOSX.py"
alias startblock="sudo /Users/Ben/Documents/Jarvis/blockOSX.py &"
alias chrome="open -a Google\ Chrome --args --disable-web-security"
alias httpserv="python -m SimpleHTTPServer"
# Fun Aliases
alias countryroads='lynx http://www.cowboylyrics.com/lyrics/denver-john/country-roads-23442.html -dump | sed -n '28,51p' | say &'
alias starwars='telnet towel.blinkenlights.nl'
alias engage="play -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14"

# ------------------------------------------------------------------------------
# Archey 
# ------------------------------------------------------------------------------
if [ $platform == "Linux" ]; then
    archey
elif [ $platform == "Darwin" ]; then
    OSXey
fi
