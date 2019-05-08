#!/bin/sh

[[ -f "$HOME/.dotfiles/config/mac/Brewfile.local" ]] && brew bundle --file="$HOME/.dotfiles/config/mac/Brewfile.local"
