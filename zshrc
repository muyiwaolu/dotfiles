# Oh my ZSH
export ZSH="/Users/muyiwa/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(gitfast zsh-completions)

source $ZSH/oh-my-zsh.sh

# Allow compilers to find Readline
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# pip exists in PATH
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Homebrew binaries take precedence in path
export PATH="/usr/local/bin:$PATH"

# rbenv
eval "$(/usr/local/bin/rbenv init -)"

# editor
export EDITOR=$(which vim)
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

# hub 
eval "$(hub alias -s)"

# use homebrew ctags
alias ctgs="`brew --prefix`/bin/ctags"

# autocompletion
autoload -U compinit && compinit

# Local config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

