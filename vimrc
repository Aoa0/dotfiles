set nocompatible " not vi compatible

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized8

filetype plugin indent on " enable file type detection
set autoindent


"---------------------
" Basic editing config
"---------------------
set autoindent
set nu " number lines
" set rnu " relative line numbering
" set mouse=a " enable mouse mode (scrolling, selection, etc)
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set history=8192 " more history
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set backspace=indent,eol,start " allow backspacing over everything
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/* " Ignore compiled files
set laststatus=2


"--------------------
" Misc configurations
"--------------------

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


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
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" airline
" let g:airline_theme='bubblegum'
" let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
