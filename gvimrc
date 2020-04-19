" MacVim font
set guifont=SF\ Mono:h12

" Disable bell
autocmd! GUIEnter * set vb t_vb=

" Run tests in terminal.app
let test#strategy = "terminal"
