-- Vimscript to lua
-- References
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Themes
-- Plug 'tomasr/molokai'
-- Plug 'joshdick/onedark.vim'
-- Plug 'rakr/vim-one'
-- Plug 'morhetz/gruvbox'
-- Plug 'fxn/vim-monochrome'
Plug 'haze/sitruuna.vim'
Plug('folke/tokyonight.nvim', { branch = 'main' })
-- End of themes


Plug 'tpope/vim-fugitive' --for git stuff
Plug 'tpope/vim-rhubarb' -- more git stuff
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'
Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist' -- required for some navigation features
Plug 'tpope/vim-commentary'
Plug ('scrooloose/nerdtree', { on= 'NERDTreeToggle' })
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alaviss/nim.nvim'
--
-- Plug 'alx741/vim-hindent'

-- moving to lsp
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-------------- completions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
-------------- end compeletions

Plug 'glepnir/lspsaga.nvim'
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- Plug 'RishabhRD/popfix'
-- Plug 'RishabhRD/nvim-lsputils'
Plug 'scalameta/nvim-metals'


---- UNUSED PLUGINS ------
-- Plug 'teal-language/vim-teal'
-- Plug 'ziglang/zig.vim'
-- Plug 'elmcast/elm-vim'
-- Plug 'vim-ruby/vim-ruby'
-- Plug 'tpope/vim-rails'
-- Plug 'powerman/vim-plugin-AnsiEsc'
-- Plug 'purescript-contrib/purescript-vim'
-- Plug 'posva/vim-vue'
-- Plug 'frigoeu/psc-ide-vim'
-- Plug 'Tetralux/odin.vim'
--
-- ----- COLORS -----
-- Plug 'flazz/vim-colorschemes'
-- Plug 'dracula/vim', { 'as': 'dracula' }
-- Plug 'liuchengxu/space-vim-dark'
-- Plug 'rafalbromirski/vim-aurora'
-- Plug 'ayu-theme/ayu-vim'

---- END UNUSED PLUGINS ------

vim.call('plug#end')


