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
alias jarvis='/Users/Ben/Projects/Jarvis/agent.py'

alias ls="ls -FG"
alias httpserv="python3 -m http.server"
alias geeknote="python ~/geeknote/geeknote.py"
alias gt="python ~/Projects/gt/sample.py"
alias git="hub"
alias tree="tree -F"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmux.conf="vim ~/.tmux.conf"
alias refreshchrome='osascript -e "tell application \"Google Chrome\" to reload active tab of window 1"'

#unalias sl

#clear-ls () {
    #clear
    #ls
#}
#zle -N clear-ls
#bindkey '^K' clear-ls
export GD=~/Google\ Drive/
export CSS=~/.styling/pandoc.css

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
    #alias startblock="sudo /Users/Ben/Documents/Jarvis/blockOSX.py"

    # Customize to your needs...
    export PATH=/usr/local/bin:/usr/local/sbin:/Users/Ben/Projects/Scripts/OSXey-Script:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH

    # Change color ls output
    export LSCOLORS=Exfxcxdxbxegedabagacad

    # Archey
    OSXey

elif [ $PLATFORM = "Linux" ]; then
    archey
fi
