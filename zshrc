# Unix
export EDITOR="$(which vim)"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

# Left prompt
PROMPT='%~ (%?) (%T) > '

# Support history
touch ~/.zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Right prompt
# https://stackoverflow.com/a/1128583/4165455
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# Allow compilers to find Readline
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# Ruby
eval "$(/usr/local/bin/rbenv init -)"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Useful aliases
alias g="git"
alias b="bundle"

# Link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Silence noisy deprecation warnings
export RUBYOPT='-W:no-deprecated'

# Homebrew: dependencies take precedence
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Homebrew: sbin is available in path
export PATH="/usr/local/sbin:$PATH"

# Autocompletion
# https://stackoverflow.com/a/58517668/4165455
autoload -Uz compinit && compinit

# Machine local config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
