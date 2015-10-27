# Zsh Run Commands
#
# Author: Ben White
# URL: benwhite.io

export DOTFILES="$HOME/dotfiles"

# ========================== #
# Antigen Plugins and Themes #
# ========================== #

export ADOTDIR="$DOTFILES/.antigen-repos"
source "$DOTFILES/antigen/antigen.zsh"

# Load oh-my-zsh's library.
antigen use oh-my-zsh

# Plugins (no repo means oh-my-zsh)
# ---------------------------------
antigen bundle git
antigen bundle pip
antigen bundle ruby

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# History search (must go after syntax highlighting)
antigen bundle zsh-users/zsh-history-substring-search

# Theme
# -----
export CONSOLE_POWERLINE=true
antigen theme benjaminwhite/console-theme console

antigen apply

# ====== #
# Custom #
# ====== #

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Enable help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help &> /dev/null
alias help=run-help

# Allow comments in the CLI
setopt interactivecomments

# Vim-mode
# --------
bindkey -v
export KEYTIMEOUT=1

# Allow backspacing past where you started in insert mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# Incrememntal search
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M viins '^r' history-incremental-search-backward

# Allow Ctrl-p and Ctrl-n in insert mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Insert argument from previous command
bindkey '\e.' insert-last-word

# Aliases
# -------

# Git
alias g='git'
alias gg='git g'
alias gca='git commit -v --amend'
alias gcan='git commit --amend --no-edit'
alias gd='git diff -w'
alias gdc='git diff -w --cached'

# Tmux
alias t='tmux'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tnew='tmux new -s'

# Easily edit config files
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmux.conf='vim ~/.tmux.conf'
alias vimperatorrc='vim ~/.vimperatorrc'

# Misc
alias notes='cd ~/google-drive/notes'
alias p8='ping 8.8.8.8'

# Functions
# ---------

# Use ctrl+z to bring to foreground, courtesy of Peter Jaros
foreground-current-job() { fg; }
zle -N foreground-current-job
bindkey -M emacs '^z' foreground-current-job
bindkey -M viins '^z' foreground-current-job
bindkey -M vicmd '^z' foreground-current-job
