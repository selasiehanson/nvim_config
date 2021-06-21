" Sets
" =========================
syntax on
filetype on
filetype plugin indent on
" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes


" Use comma for leader
let g:mapleader=','
" Double backslash for local leader - FIXME: not sure I love this
let g:maplocalleader='\\'

set number " line numbering
" set relativenumber

" Fixes mouse issue with alacritty
" if has("mouse_sgr")
    " set ttymouse=sgr
" else

set encoding=utf-8
set background=dark
syntax enable

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :nohlsearch<CR>

" highlight cursor position
" set cursorline
" set cursorcolumn

"remove highlight after search
nmap <esc><esc> :nohlsearch<return>

" Set the title of the iterm tab
set title
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
:tnoremap <Esc> <C-\><C-n> "allow ability to hit esc when in teminal mode


set laststatus=2

" TODO Map this
function! IncreasePane()
  " If NERDTree is open in the current buffer
    echo "Welping"
    execute ":vertical res +5"
endfunction
