set nocompatible " not vi compatible

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them


set autoindent
set nu " number lines
set rnu " relative line numbering
set history=8192 " more history
set mouse+=a " enable mouse mode (scrolling, selection, etc)


" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set laststatus=2

" let g:airline_theme='bubblegum'
" let g:airline_theme='solarized'

let g:airline#extensions#tabline#enabled = 1

syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized8
