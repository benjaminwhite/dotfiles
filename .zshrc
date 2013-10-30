# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ben"

PLATFORM=$(uname)

ITERM_CURSOR=false

plugins=(brew git vim-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# 10ms for key sequences
KEYTIMEOUT=1

# Help with Zsh Documentation
zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# Aliases
alias ls="ls -F"
alias block="sudo cp /Users/Ben/Documents/Jarvis/hosts.block /private/etc/hosts"
alias httpserv="python -m SimpleHTTPServer"
alias geeknote="python ~/geeknote/geeknote.py"
alias gt="~/Documents/tui/gt.py"
alias ip="curl icanhazip.com"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmux.conf="vim ~/.tmux.conf"



#Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
setopt interactivecomments
# Set default editor
export EDITOR="vim"


if [ $PLATFORM = "Darwin" ]; then
    alias macvim="mvim"
    alias checkblock="pgrep -f -l -u root blockOSX.py"
    alias startblock="sudo /Users/Ben/Documents/Jarvis/blockOSX.py"

    # Customize to your needs...
    export PATH=/usr/local/bin:/usr/local/sbin:~/Scripts:~/Scripts/OSXey-Script:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH

    # Change color ls output
    export LSCOLORS=Exfxcxdxbxegedabagacad

    # Archey
    OSXey

elif [ $PLATFORM = "Linux" ]; then
    archey
fi
