set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let test#strategy = 'neovim'

" Terminal normal mode is Ctrl-O
tmap <C-o> <C-\><C-n>
