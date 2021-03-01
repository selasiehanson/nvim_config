let g:python2_host_prog = '/usr/local/Cellar/python@2/2.7.16/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.1/bin/python3'

" --- PLUGINS ---------
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'fxn/vim-monochrome'
" End of themes

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'jparise/vim-graphql'        " GraphQL syntax
" Plug 'styled-components/vim-styled-components'

Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist' " required for some navigation features
Plug 'slashmili/alchemist.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alaviss/nim.nvim'
" Plug 'rescript-lang/vim-rescript' "-- Messes with neovim. Consider using it
" in vim instead
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
" Plug 'prabirshrestha/asyncomplete.vim' "needed for nim.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}} "Great completion library
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'alx741/vim-hindent'

"" UNUSED PLUGINS ------
" Plug 'ziglang/zig.vim'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'elmcast/elm-vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'purescript-contrib/purescript-vim'
" Plug 'posva/vim-vue'
" Plug 'frigoeu/psc-ide-vim'
" Plug 'Tetralux/odin.vim'
" ----- COLORS -----
" Plug 'flazz/vim-colorschemes'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'liuchengxu/space-vim-dark'
" Plug 'rafalbromirski/vim-aurora'
" Plug 'ayu-theme/ayu-vim'

"" END UNUSED PLUGINS ------


call plug#end()
" --- END OF PLUGINS

exe 'source' '~/.config/nvim/configurations/basic.vim'
exe 'source' '~/.config/nvim/configurations/navigation.vim'
exe 'source' '~/.config/nvim/configurations/theme-ui.vim'
exe 'source' '~/.config/nvim/configurations/linting-formating.vim'
exe 'source' '~/.config/nvim/configurations/purescript.vim'
exe 'source' '~/.config/nvim/configurations/coc.vim'
exe 'source' '~/.config/nvim/configurations/nim.vim'
exe 'source' '~/.config/nvim/configurations/php.vim'
exe 'source' '~/.config/nvim/configurations/ocaml.vim'
