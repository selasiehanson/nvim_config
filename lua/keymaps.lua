local options = { silent = true }

-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local loptions = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", loptions, opts)
    end
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, loptions)
end

--------------------------------------------
--------------------------------------------
-- NAVIGATION
--------------------------------------------
--------------------------------------------

-- my custom configuration
map("n", "<C-n>",     ":NERDTreeToggle<CR>", options)
map("n", "<leader>n", ":NERDTreeToggle<CR>", options)
map("n", "]q", ":cnext <CR>",     options)
map("n", "[q", ":cprevious <CR>", options)


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
map("n", "??",  ":Telescope grep_string search=", options)


function IncreasePane()
    vim.cmd([[
        execute ":vertical res +5"
    ]])
end

function DecreasePane()
    vim.cmd([[
        execute ":vertical res -5"
    ]])
end

map("n", '<leader>e', IncreasePane, options)
map("n", '<leader>d', DecreasePane, options)



--
-- local ocaml_lsp_command = { 'ocamllsp', '--fallback-read-dot-merlin' } -- fallback-read-dot-merlin  is needed for melange
-- nvim_lsp['ocamllsp'].setup {
--   cmd = ocaml_lsp_command,
--   on_attach = on_attach
--
-- }
