# Zsh Run Commands
#
# Author: Ben White
# URL: benwhite.io
#

export DOTFILES="$HOME/dotfiles"

# ==========================
# Antigen Plugins and Themes
# ==========================
export ADOTDIR="$DOTFILES/.antigen-repos"
source "$DOTFILES/antigen/antigen.zsh"

# Load oh-my-zsh's library.
antigen use oh-my-zsh

# Plugins (no repo means oh-my-zsh)
# -------
antigen bundle git
antigen bundle pip
antigen bundle ruby

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# History search (must go after syntax highlighting)
antigen bundle zsh-users/zsh-history-substring-search

# My zsh vim mode plugin
antigen bundle benjaminwhite/vim-mode-for-oh-my-zsh

# Theme
# -----
export CONSOLE_POWERLINE=TRUE
export DISABLE_UNTRACKED_FILES_DIRTY=true
antigen theme benjaminwhite/console-theme console

antigen apply

# =======
# Custom
# =======

# Vi options TODO: move to vim-mode plugin
export KEYTIMEOUT=1

# Enable help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help &> /dev/null
alias help=run-help

# Allow comments in the CLI
setopt interactivecomments

# Aliases
# -------

# Easily edit config files
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmux.conf='vim ~/.tmux.conf'
