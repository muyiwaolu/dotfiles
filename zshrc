# Allow compilers to find Readline
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# rbenv
eval "$(/usr/local/bin/rbenv init -)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"

# Node
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# editor
export EDITOR="$(which vim)"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

# use homebrew ctags
alias ctgs="`brew --prefix`/bin/ctags"

# autocompletion
autoload -U compinit && compinit

# aliases
alias g="git"

# Python deps take precedence
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Homebrew sbin is available in path
export PATH="/usr/local/sbin:$PATH"

# Link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Silence noisy deprecation warnings
export RUBYOPT='-W:no-deprecated'

# Local config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
