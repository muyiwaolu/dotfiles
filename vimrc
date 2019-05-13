set encoding=utf-8

" Leader
let mapleader = " "

" 2 spaces for indentation.
" More information: http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Enable line numbers
set number

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" ctags
set tags=tags

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use the silver searcher for FZF
" essentially allows fuzzy searching
" to respect .gitignore.
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Fuzzy Searching
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>

" Automatically install vim-plug if it does not exist.
" Credit: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
" Note: plug#end automatically executes `filetype plugin indent on` 
" and `syntax enable`, so no need to declare them again.
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'icymind/NeoSolarized'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-conflicted'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
call plug#end()

" Colour scheme
set termguicolors
set background=dark
colorscheme NeoSolarized

" ALE global configuration
let g:ale_fix_on_save = 1

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
