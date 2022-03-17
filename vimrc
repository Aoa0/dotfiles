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
set mouse=a " enable mouse mode (scrolling, selection, etc)


" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set laststatus=2


syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized8

"---------------------
" Basic editing config
"---------------------



" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>


"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" let g:airline_theme='bubblegum'
" let g:airline_theme='solarized'

let g:airline#extensions#tabline#enabled = 1
