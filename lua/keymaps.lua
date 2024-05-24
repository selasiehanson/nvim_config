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
local navigation = {
	nerdtree = false,
	neotree = false,
	nvimtree = true,
}

local tmux_navigation_enabled = false

if navigation.nvimtree then
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

if navigation.nerdtree then
	map("n", "<C-n>", ":NERDTreeToggle<CR>", options)
	map("n", "<leader>f", ":NERDTreeFind<CR>", options)
end

if navigation.neotree then
	map("n", "<C-n>", ":Neotree toggle<CR>", options)
	map("n", "<leader>f", ":Neotree focus<CR>", options)
end

if navigation.nvimtree then
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	map("n", "<C-n>", ":NvimTreeToggle toggle<CR>", options)
	map("n", "<leader>f", ":NvimTreeFindFile <CR>", options)

	local function nvim_tree_on_attach(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- custom mappings
		map("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
		map("n", "?", api.tree.toggle_help, opts("Help"))
		-- TODO fix this since it messes with going to the beginning of the line
		-- map("n", "I", api.tree.toggle_hidden_filter, opts("Toggle Git Ignore"))
	end

	-- pass to setup along with your other options
	require("nvim-tree").setup({
		on_attach = nvim_tree_on_attach,
		filters = {
			git_ignored = false,
			dotfiles = false,
			git_clean = false,
			no_buffer = false,
			custom = {},
			exclude = {},
		},
	})
end

map("n", "]q", ":cnext <CR>", options)
map("n", "[q", ":cprevious <CR>", options)
map("n", "ff", ":lua  vim.lsp.buf.format()<CR>", options)

----------------------------------------
----------------------------------------
-- MOVEMENT
-----------------------------------------
-- map <CR> :nohlsearch<CR>
map("n", "<CR>", ":nohlsearch<CR>", options)
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

-- Copilot
-- use <C-J> to accept the suggestion. Tab is used by another plugin
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Telescope
-- Show all telescope bindings
local builtin = require("telescope.builtin")

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
map("n", "??", ":FindMeText <CR>", options)

local find_word = function(word_to_search)
	builtin.grep_string({ search = word_to_search })
end

vim.api.nvim_create_user_command("FindMeText", function()
	local text_to_search = vim.fn.input("Search ?: ")
	find_word(text_to_search)
end, { nargs = 0, desc = "Find words with spaces" })

-- resume last command/search sent to telescope
map("n", "<leader>re", ":Telescope resume<CR>", options)

map("n", "<leader>ff", ":Lspsaga code_action<CR>", options)
map("v", "<leader>ff", ":<C-U>Lspsaga range_code_action<CR>", options)

map("n", "<leader>af", function()
	vim.diagnostic.open_float({ scope = "line" })
end, options)

local function get_buf_name()
	local buf_name = vim.fn.expand("%")
	return buf_name
end

local function is_nvim_tree()
	local buf_name = string.lower(get_buf_name())
	return string.match(buf_name, 'nvimtree')
end

local function IncreasePane()
	if is_nvim_tree() then
		vim.cmd([[
			execute "NvimTreeResize +5"
		]])
	else
		vim.cmd([[
			execute "vertical res +5"
	       ]])
	end
end

function DecreasePane()

	if is_nvim_tree() then
		vim.cmd([[
			execute "NvimTreeResize -5"
		]])
	else
		vim.cmd([[
			execute "vertical res -5"
	       ]])
	end
end

map("n", "<leader>e", IncreasePane, options)
map("n", "<leader>d", DecreasePane, options)

-- map('n', '<M-e>','<c-w>5>', options)
-- map('n', '<M-d>','<c-w>6<', options)

----------------------------
----------------------------
----------------------------
-- DEBUGGING ---------------
----------------------------
----------------------------
----------------------------

map("n", "<leader>dt", ':lua require("dapui").toggle()<CR>', options)
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", options)
map("n", "<leader>dpr", function()
	require("dap-python").test_method()
end, options)

----------------------------
----------------------------
----------------------------
------ BUILD ---------------
----------------------------
----------------------------
----------------------------
--
--  References
--  1. https://unix.stackexchange.com/questions/416453/run-build-command-from-vim-send-output-to-another-tmux-pane
--  2. https://github.com/DarioHett/tvp-repl (LOOK INTO)
--  3. https://github.com/slarwise/vim-tmux-send/tree/master (LOOK INTO)
function nv_test()
	vim.cmd([[
        execute ":!tmux send -t 1 'make test' Enter"
    ]])
end

function nv_build()
	vim.cmd([[
        execute ":!tmux send -t 1 'make build' Enter"
    ]])
end

function nv_run()
	vim.cmd([[
        execute ":!tmux send -t 1 'make run' Enter"
    ]])
end

map("n", "<leader>bb", ":lua nv_build()<CR><C-L>", options)
map("n", "<leader>rr", ":lua nv_run()<CR><C-L>", options)
map("n", "<leader>tt", ":lua nv_test()<CR><C-L>", options)

----------------------------
----------------------------
--
-- yanking
------------------------------
------------------------------
-- yank to clipboard

map('n', '<leader>y', [["+y"]], options)


----------------------------
----------------------------
----------------------------
-- VIM TMUX NAVIGATOR
----------------------------
----------------------------
----------------------------
----------------------------
if tmux_navigation_enabled then
	map('n', "<C-h>", ":TmuxNavigateLeft<cr>", options)
	map('n', "<C-j>", ":TmuxNavigateDown<cr>", options)
	map('n', "<C-k>", ":TmuxNavigateUp<cr>", options)
	map('n', "<C-l>", ":TmuxNavigateRight<cr>", options)
end
