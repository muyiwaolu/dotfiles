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

" Disable swap
set noswapfile

" Mouse scrolling works as expected in Tmux
set mouse=a

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
  " General
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'christoomey/vim-conflicted'
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-dispatch'

  " Ruby
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'

  " Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
  Plug 'slim-template/vim-slim'
  Plug 'hashivim/vim-terraform'
  Plug 'tpope/vim-repeat'

  " Clojure
  Plug 'guns/vim-clojure-static'
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-salve'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
  Plug 'tpope/vim-fireplace'
  Plug 'venantius/vim-cljfmt'
  Plug 'luochen1990/rainbow'
  Plug 'bhurlow/vim-parinfer'
call plug#end()

" ALE global configuration
let g:ale_fix_on_save = 1

" Vim signify colours
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" Vim Fireplace
nnoremap <Leader>ef :%Eval<CR>
nnoremap <Leader>el :'<,'>Eval<CR>
nnoremap <Leader>rt :RunTests<CR>

" Vim Cljfmt
let g:clj_fmt_autosave = 0
nnoremap <Leader>cf :Cljfmt<CR>

" Navigate the quickfix list
nnoremap <Leader>qn :cn<CR>
nnoremap <Leader>qp :cp<CR>


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

" Ranibow parenthesis
let g:rainbow_active = 1
let g:rainbow_conf = {
      \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \  'separately': {
      \      '*': 0,
      \      'clojure': {},
      \  }
      \}

" Define Ag function
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Bind backslash (\) to Ag function defined above
nnoremap \ :Ag<SPACE>
