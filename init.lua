-- Vimscript to lua
-- References
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plug 'tpope/vim-sensible'
-- Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
-- Plug 'junegunn/fzf.vim'

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
-- Plug 'pangloss/vim-javascript'    -- JavaScript support
-- Plug 'leafgarland/typescript-vim' -- TypeScript syntax
-- Plug 'maxmellon/vim-jsx-pretty'   -- JS and JSX syntax
-- Plug 'jparise/vim-graphql'        -- GraphQL syntax
-- Plug 'styled-components/vim-styled-components'

Plug 'szw/vim-maximizer'
Plug 'neomake/neomake'
Plug 'tpope/vim-projectionist' -- required for some navigation features
-- Plug 'slashmili/alchemist.vim' --For Elixir
-- Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } -- For Golang
Plug 'tpope/vim-commentary'
-- Plug 'mileszs/ack.vim'
Plug ('scrooloose/nerdtree', { on= 'NERDTreeToggle' })
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alaviss/nim.nvim'
Plug 'teal-language/vim-teal'
-- Plug 'ziglang/zig.vim'
-- Plug 'rescript-lang/vim-rescript' ---- Messes with neovim. Consider using it
-- in vim instead

-- TODO remove:  Not needed anymore - The lsp should be enough
-- Plug 'autozimu/LanguageClient-neovim', {
-- 			\ 'branch': 'next',
-- 			\ 'do': 'bash install.sh'
-- 			\ }
-- Plug 'prabirshrestha/asyncomplete.vim' --needed for nim.nvim

--------------------------------------------
--------------------------------------------
-------- HASKELL ----------
-------- HASKELL ----------
--------------------------------------------
--------------------------------------------

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
-- Plug 'hrsh7th/nvim-compe'
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- Plug 'RishabhRD/popfix'
-- Plug 'RishabhRD/nvim-lsputils'
Plug 'scalameta/nvim-metals'


---- UNUSED PLUGINS ------
-- Plug 'reasonml-editor/vim-reason-plus'
-- Plug 'elmcast/elm-vim'
-- Plug 'vim-ruby/vim-ruby'
-- Plug 'tpope/vim-rails'
-- Plug 'powerman/vim-plugin-AnsiEsc'
-- Plug 'purescript-contrib/purescript-vim'
-- Plug 'posva/vim-vue'
-- Plug 'frigoeu/psc-ide-vim'
-- Plug 'Tetralux/odin.vim'
-- ----- COLORS -----
-- Plug 'flazz/vim-colorschemes'
-- Plug 'dracula/vim', { 'as': 'dracula' }
-- Plug 'liuchengxu/space-vim-dark'
-- Plug 'rafalbromirski/vim-aurora'
-- Plug 'ayu-theme/ayu-vim'

---- END UNUSED PLUGINS ------


vim.call('plug#end')


-- TODO
-- Move everything above to plugins.lua

----
--

require('telescope_conf')
require('my_colors')
require('cmp-config')
require('language-lsp')
require('keymaps')

-- TODO move this into its own plugin in the future
require ('configurations/lua/ts-eval')


--
-- Sets
-------------------------------------
-- Old vim command
vim.cmd([[
    syntax on
]])

-- syntax enable

vim.cmd([[
    filetype on
]])

vim.cmd([[
    filetype plugin indent on
]])
-- " Sane tabs
-- " - Two spaces wide
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- " - Expand them all
vim.opt.expandtab = true
-- " - Indent by 2 spaces by default
vim.opt.shiftwidth = 2
-- " if hidden is not set, TextEdit might fail.
vim.opt.hidden  = true
-- " Better display for messages
vim.opt.cmdheight = 2
-- " Smaller updatetime for CursorHold & CursorHoldI
-- vim.opt.updatetime=300
-- " don't give |ins-completion-menu| messages.
vim.cmd([[
    set shortmess+=c
]])
-- " always show signcolumns
-- TODO fix
-- vim.opt.signcolumn=yes


-- Use comma for leader
vim.g.mapleader = ','

-- Double backslash for local leader - FIXME: not sure I love this
vim.g.maplocalleader ="\\"

-- " line numbering
vim.opt.number = true
-- " vim.opt.relativenumber

-- " Fixes mouse issue with alacritty
-- " if has("mouse_sgr")
-- " vim.opt.ttymouse=sgr
-- " else

-- TODO fix
vim.opt.encoding = 'utf-8'
vim.opt.background=dark

-- " Highlight search results
vim.opt.hlsearch = true

-- " Incremental search, search as you type
vim.opt.incsearch = true

-- " Ignore case when searching
vim.opt.ignorecase = true

-- " Ignore case when searching lowercase
vim.opt.smartcase = true
-- " Stop highlighting on Enter

-- " Set the title of the iterm tab
vim.opt.title = true

vim.opt.laststatus=2

-- " highlight cursor position
-- " vim.opt.cursorline
-- " vim.opt.cursorcolumn

