local keymap = vim.keymap.set
local options = { silent = true }

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','
----------------------------------------
----------------------------------------
-- MOVEMENT
-----------------------------------------
-- map <CR> :nohlsearch<CR>
map("n", "<CR>",  ":nohlsearch<CR>", options)
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)


-- allow ability to hit esc when in teminal mode
-- TODO fix this
-- :tnoremap <Esc> <C-\><C-n> "allow ability to hit esc when in teminal mode
--
-- map("t", "<Esc>",  "<C-\/><C-n>", options)
-- map <CR> :nohlsearch<CR>
----------------------------------------
----------------------------------------
-- LSP CONFIGURATION
-----------------------------------------

-- " from https://www.chrisatmachine.com/Neovim/27-native-lsp/
-- " https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html

-- " LSP config (the mappings used in the default file don't quite work right)
-- TODO clean these up so we use lua commands
map("n", "gd", vim.lsp.buf.definition, options)
map("n", "gD", vim.lsp.buf.declaration, options)
map("n", "gr", vim.lsp.buf.references, options)
map("n", "gi", vim.lsp.buf.implementation, options)
-- " buf.hover is the one that actually shoes the signature
map("n", "K", vim.lsp.buf.hover, options)

map("n", "[c", vim.diagnostic.goto_prev, options)
map("n", "]c", vim.diagnostic.goto_next, options)

map("n", "<leader>rn", vim.lsp.buf.rename, options)
map("n", "<leader>af",
        function()
            vim.diagnostic.open_float({scope="line"})
        end
, options)

map("n", "<leader>as", vim.lsp.buf.document_symbol, options)
-- " map("n", "<leader>ff", vim.lsp.buf.code_action,

-- " map("n", <leader>ff "<cmd>Lspsaga code_action<CR>
-- " xnoremap "n", <leader>ff "<cmd>Lspsaga range_code_action<CR>
map("n", "gs", ":Lspsaga signature_help<CR>", options)


map("n","<leader>ff", ":Lspsaga code_action<CR>", options)
map("v","<leader>ff", ":<C-U>Lspsaga range_code_action<CR>", options)

--------------------------------------------
--------------------------------------------
-- NAVIGATION
--------------------------------------------
--------------------------------------------

map("n", "<C-n>",     ":NERDTreeToggle<CR>", options)
map("n", "<leader>n", ":NERDTreeToggle<CR>", options)
map("n", "]q", ":cnext <CR>",     options)
map("n", "[q", ":cprevious <CR>", options)

-- Telescope
-- Show all telescope bindings
local builtin = require('telescope.builtin')

map("n", "<leader>pp", builtin.builtin, options)

-- " Find all files
map("n", "<leader>te", builtin.find_files, options)

-- "Find files under git
map("n", "<leader>t", builtin.git_files, options)

-- " show files currentyly opened in buffers
map("n", ";", builtin.buffers, options)

-- " fuzzy find a piece of text in the currently opened buffer
map("n", "//", builtin.current_buffer_fuzzy_find, options)

-- " pick a color scheme
map("n", "<leader>cs", builtin.colorscheme, options)
-- " Add . and @ to iskeyword else they don't get selected when trying to find
-- " expressions such as this.doSomething
-- " Withouth these sets only this or doSomething will be selected
-- " TODO only enable these when in visual mode
-- " set iskeyword+=.
-- " set iskeyword+=@-@



-- " This version is a bit slow due to how telescope performs the search
-- " map("n", ??? :lua require 'telescope.builtin'.live_grep{ default_text = vim.fn.expand("<cword>") }<CR>
-- " we use this instead
map("n", "???", ":lua require 'telescope.builtin'.grep_string{ search = vim.fn.expand('<cword>') }<CR>", options)
map("v", "???", ":lua require 'telescope.builtin'.grep_string{ search = vim.fn.expand('<cword>') }<CR>", options)



-- " HAS THE SAME Problem as above
-- " ripgrep like grep through dir
-- " map("n", ?? :lua require'telescope.builtin'.live_grep{}<CR>
-- " This allows you to type what you want to search for
map("n", "??",  ":Telescope grep_string search=", options)


function IncreasePane()
end

function DecreasePane()
end

map("n", '<leader>e', IncreasePane, options)
map("n", '<leader>d', DecreasePane, options)


-- " Increase the current pane
-- function! IncreasePane()
--     execute ":vertical res +5"
--     endfunction

--     -- " Decrease the current pane
--     function! DecreasePane()
--         execute ":vertical res -5"
--         endfunction

--         map(<leader>e :call IncreasePane() <CR>
--         map(<leader>d :call DecreasePane() <CR>


