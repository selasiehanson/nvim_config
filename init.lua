require('my_plugins')
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

