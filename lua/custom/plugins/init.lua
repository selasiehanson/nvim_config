-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local custom_plugins = function(use)
	local local_plugin_directory = vim.fn.getenv("MY_NVIM_PLUGINS")
	--
	-- print(local_plugin_directory)
	local out = {}
	if local_plugin_directory ~= vim.NIL then
		local local_plugins = { "greeter.nvim", "gitbrowser.nvim", "evaluator.nvim", "flix.nvim" }

		for _, plugin in ipairs(local_plugins) do
			local pl = { dir = local_plugin_directory .. "/" .. plugin }
			table.insert(out, pl)
		end
	end

	return out
end
local all_plugins = {
	-- Git related plugins
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	{ 'lewis6991/gitsigns.nvim' },
	{
		'nvimdev/lspsaga.nvim',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter' },
			{ 'nvim-tree/nvim-web-devicons' },
		}
	},
	{
		"folke/noice.nvim",

		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
			{ "nvim-lua/plenary.nvim" },
		},
		--
	},
	{ "gleam-lang/gleam.vim" },

	{ "tikhomirov/vim-glsl" },
	{
		"szw/vim-maximizer",
	},

	{
		"ntpeters/vim-better-whitespace",
	},

	{
		"alaviss/nim.nvim",
	},

	{ "b4winckler/vim-objc" },

	{ "ziglang/zig.vim" },
	{ "Nymphium/vim-koka" },
	{
		"Tetralux/odin.vim",
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{ 'github/copilot.vim' },
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()
			metals_config.on_attach = function(client, bufnr)
				-- your on_attach function
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end
	},
	{ 'ovikrai/mojo-syntax' },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			-- require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		-- build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
		'joerdav/templ.vim'
	},

	-- Colors
	{ "catppuccin/nvim",     name = "catppuccin", priority = 1000 },
	{ "Mofiqul/dracula.nvim" },

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
		"shaunsingh/nord.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here

			-- You can configure highlights by doing something like
			-- vim.cmd.hi("Comment gui=none")
		end,
	},




	-- {
	-- 	"christoomey/vim-tmux-navigator"
	-- }
}

local all_custom_plugins = custom_plugins()

for index, value in ipairs(all_custom_plugins) do
	table.insert(all_plugins, value)
end

return all_plugins
