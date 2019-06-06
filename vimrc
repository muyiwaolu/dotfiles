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
call plug#begin('~/.vim/plugged')
  Plug 'joshdick/onedark.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-conflicted'
  Plug 'vim-ruby/vim-ruby'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
  Plug 'slim-template/vim-slim'
  Plug 'hashivim/vim-terraform'
call plug#end()

" Colour scheme
colorscheme onedark

" ALE global configuration
let g:ale_fix_on_save = 1

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Define Ag function
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Bind backslash (\) to Ag function defined above
nnoremap \ :Ag<SPACE>
