let g:python2_host_prog = '/usr/local/Cellar/python@2/2.7.16/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.1/bin/python3'

" --- PLUGINS ---------
call plug#begin('~/.config/nvim/plugged')
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Themes
" Plug 'tomasr/molokai'
" Plug 'joshdick/onedark.vim'
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
" Plug 'fxn/vim-monochrome'
Plug 'haze/sitruuna.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" End of themes


Plug 'tpope/vim-fugitive' "for git stuff
Plug 'tpope/vim-rhubarb' " more git stuff
Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'jparise/vim-graphql'        " GraphQL syntax
" Plug 'styled-components/vim-styled-components'

Plug 'szw/vim-maximizer'
Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist' " required for some navigation features
" Plug 'slashmili/alchemist.vim' "For Elixir
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " For Golang
Plug 'tpope/vim-commentary'
" Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alaviss/nim.nvim'
Plug 'teal-language/vim-teal'
" Plug 'ziglang/zig.vim'
" Plug 'rescript-lang/vim-rescript' "-- Messes with neovim. Consider using it
" in vim instead

" TODO remove:  Not needed anymore - The lsp should be enough
" Plug 'autozimu/LanguageClient-neovim', {
" 			\ 'branch': 'next',
" 			\ 'do': 'bash install.sh'
" 			\ }
" Plug 'prabirshrestha/asyncomplete.vim' "needed for nim.nvim

""""""""""""""""""""""
""""""""""""""""""""""
"""" HASKELL """""
"""" HASKELL """""
""""""""""""""""""""""
""""""""""""""""""""""

" Plug 'alx741/vim-hindent'

" moving to lsp
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

""""""" completions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
""""""" end compeletions

Plug 'glepnir/lspsaga.nvim'
" Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
Plug 'scalameta/nvim-metals'

"" UNUSED PLUGINS ------
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
source ~/.config/nvim/configurations/basic.vim
source ~/.config/nvim/configurations/navigation.vim
source ~/.config/nvim/configurations/theme-ui.vim
source ~/.config/nvim/configurations/linting-formating.vim
" source ~/.config/nvim/configurations/purescript.vim
source ~/.config/nvim/configurations/lsp-config.vim
source ~/.config/nvim/configurations/nim.vim
source ~/.config/nvim/configurations/php.vim
source ~/.config/nvim/configurations/javascript.vim
source ~/.config/nvim/configurations/ocaml.vim
source ~/.config/nvim/configurations/scala.vim
source ~/.config/nvim/configurations/zig.vim

luafile ~/.config/nvim/configurations/lua/cmp-config.lua
luafile ~/.config/nvim/configurations/lua/language-lsp.lua
luafile ~/.config/nvim/configurations/lua/telescope.lua
