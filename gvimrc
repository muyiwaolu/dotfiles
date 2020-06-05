" MacVim font
set guifont=SF\ Mono:h13

" Disable bell
autocmd! GUIEnter * set vb t_vb=

" vim-test in macVim uses terminal.app
let test#strategy = "terminal"
