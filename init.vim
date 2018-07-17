call plug#begin('~/.config/nvim/plugged')
" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" Use comma for leader
let g:mapleader=','
" Double backslash for local leader - FIXME: not sure I love this
let g:maplocalleader='\\'

set number " line numbering
" set relativenumber

set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" highlight cursor position
" set cursorline
" set cursorcolumn

"remove highlight after search
nmap <esc><esc> :noh<return>

" Set the title of the iterm tab
set title
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Plugins go here.  Example:
" Plug 'foo/bar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-ruby/vim-ruby'

"Configure FZF
"function! FzfOmniFiles()
"  let is_git = system('git status')
"  if v:shell_error
"    :Files
"  else
"    :GitFiles --exclude-standard --other
"  end
"endfunction

"function! FzfOmniFiles()
"  :Files
"endfunction

"nnoremap <C-p> :call FzfOmniFiles()<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

""End of customization for fzf


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Themes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'

" End of themes
"
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'


" Execute code checks, find mistakes, in the background
Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []

  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_mycredo_maker = {
        \ 'exe': 'mix',
        \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }

Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache'

Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features

Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" Nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

"Show current file in directory
" nmap <silent> <C-I> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" Git marker for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeShowIgnoredStatus=0

" Better statusbar
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17
let g:airline_theme='one'
set laststatus=2


Plug 'airblade/vim-gitgutter'

Plug 'elmcast/elm-vim'

Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'reasonml-editor/vim-reason'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'zchee/deoplete-clang'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
"ctlp configuration"
"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"
"End ctrlp configuration"

" must be called after plug#end
set background=dark
syntax enable

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    " colorscheme elflord
    colorscheme one
  else
    " colorscheme fu
    colorscheme one
  endif
endif

let g:gruvbox_contrast_dark='hard'

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
"End Syntastic configuration

"Elm configuration
  let g:polyglot_disabled = ['elm']
  let g:elm_detailed_complete = 1
  let g:elm_format_autosave = 1
  let g:elm_syntastic_show_warnings = 1

  :au BufWritePost *.elm ElmMake

"End Elm configuration

"Javascript Config

  let g:syntastic_javascrtipt_checkers = ['prettier']
"  autocmd BufWritePre *.js Neoformat

"End Javascript config

"Ruby configuration"
 " let g:syntastic_ruby_checkers = ['rubocop', 'reek']
 " let g:syntastic_ruby_checkers = ['rubocop']
"End ruby configuration"


"Golang configuration
set number
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Strip whitespace on save
let g:strip_whitespace_on_save = 1
