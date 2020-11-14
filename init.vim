let g:python2_host_prog = '/usr/local/Cellar/python@2/2.7.16/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.1/bin/python3'

call plug#begin('~/.config/nvim/plugged')

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
:tnoremap <Esc> <C-\><C-n> "allow ability to hit esc when in teminal mode

" --- PLUGINS ---------
" Plugins go here.  Example:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-ruby/vim-ruby'

" Themes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'liuchengxu/space-vim-dark'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'rafalbromirski/vim-aurora'
" Plug 'ayu-theme/ayu-vim'
" End of themes

" Polyglot loads language support on demand!
Plug 'Tetralux/odin.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist' " required for some navigation features
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
" Plug 'elmcast/elm-vim'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alaviss/nim.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
" Plug 'prabirshrestha/asyncomplete.vim' "needed for nim.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}} "Great completion library
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'ziglang/zig.vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'alx741/vim-hindent'

"terraform plugins
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
" --- END OF PLUGINS

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>


" let g:gutentags_cache_dir = '~/.tags_cache'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17
set laststatus=2

"NerdTree
let g:NERDTreeShowIgnoredStatus=0
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


" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


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

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
nmap ??? :Rg <C-r>"<CR>
nmap cc :Commands!<CR>

" nmap <Leader>r :Tags<CR>

""End of customization for fzf

" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []



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


" aurora theme needs this
" set termguicolors

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    " colorscheme elflord
    " color space-vim-dark
    " colorscheme spacegray
    " colorscheme onedark
    colorscheme molokai
    " colorscheme gruvbox
    " colorscheme aurora
    " colorscheme ayu
  else
    " colorscheme fu
    " colorscheme spacegray
    " color space-vim-dark
    " colorscheme onedark
    colorscheme onedark
    " colorscheme gruvbox
    " colorscheme aurora
    " colorscheme ayu
  endif
endif

" --- THEME CUSTOMIZATION---
" call one#highlight('vimLineComment', 'cccccc', '', 'none')
" let g:space_vim_dark_background = 234
" let g:spacegray_underline_search = 1
" let g:spacegray_use_italics = 1
" let g:spacegray_low_contrast = 1

let g:space_vim_dark_background = 234

" --- END THEME CUSTOMIZATION---

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
"End Syntastic configuration

"Elm configuration
" let g:polyglot_disabled = ['elm']
" let g:elm_detailed_complete = 1
" let g:elm_format_autosave = 1
" let g:elm_syntastic_show_warnings = 1

" :au BufWritePost *.elm ElmMake

"End Elm configuration

"Javascript Config

let g:syntastic_javascrtipt_checkers = ['prettier']
 " autocmd BufWritePre *.js Neoformat

"End Javascript config

"Ruby configuration"
" let g:syntastic_ruby_checkers = ['rubocop', 'reek']
" let g:syntastic_ruby_checkers = ['rubocop']
"End ruby configuration"


"Golang configuration
" autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" set number
" let g:go_disable_autoinstall = 0

" Highlight
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_auto_type_info = 1

"" Strip whitespace on save
"let g:strip_whitespace_on_save = 1

""Purescript configuration
let purescript_indent_if = 3
let purescript_indent_case = 5
let purescript_indent_let = 4
let purescript_indent_where = 6
let purescript_indent_in = 1
let purescript_indent_dot = v:true


function! SourceDirectory(file)
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction

" call SourceDirectory('~/.config/nvim/configurations/')
" exe 'source' '~/.config/nvim/configurations/reason-ocaml.vim'

exe 'source' '~/.config/nvim/configurations/coc.vim'
exe 'source' '~/.config/nvim/configurations/nim.vim'

let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': [ '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']
nmap <LocalLeader>t :MerlinTypeOf<CR>

" Auto format these files on save
" autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.purs Neoformat
autocmd BufWritePre *.ml Neoformat
autocmd BufWritePre *.mli Neoformat

nnoremap <leader> F :call CocAction('format')<CR>



let no_ocaml_maps=1


" Scala config
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+ "for json

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>f  :<C-u>CocFix<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>


"" Php Stuff
autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
