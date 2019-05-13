# Oh my ZSH
export ZSH="/Users/muyiwa/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# FZF
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# rbenv
eval "$(/usr/local/bin/rbenv init -)"

# pip exists in PATH
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# editor
export EDITOR=$(which vimr)
export VISUAL=$EDITOR

# hub 
eval "$(hub alias -s)"

# use homebrew ctags
alias ctgs="`brew --prefix`/bin/ctags"

# Local config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

