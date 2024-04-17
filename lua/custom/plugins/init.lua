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
		local local_plugins = { "greeter.nvim", "gitbrowser.nvim", "evaluator.nvim" }

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
	}
}

local all_custom_plugins = custom_plugins()

for index, value in ipairs(all_custom_plugins) do
	table.insert(all_plugins, value)
end

return all_plugins

-- local function other_plugins(use)
--     use({
--         "glepnir/lspsaga.nvim",
--         branch = "main",
--         config = function()
--             local saga = require("lspsaga")

--             saga.setup({
--                 -- your configuration
--             })
--         end,
--     })

--     use {
--         'szw/vim-maximizer'
--     }

--     use {
--         'ntpeters/vim-better-whitespace'
--     }

--     use {
--         'alaviss/nim.nvim'
--     }

--     use {
--         'Tetralux/odin.vim'
--     }

--     use { 'tikhomirov/vim-glsl' }

--     use { 'dmmulroy/tsc.nvim' }
--     -- use { 'rcarriga/nvim-notify' }

--     use {
--         "folke/noice.nvim", requires = {
--         { "MunifTanjim/nui.nvim" },
--         { "rcarriga/nvim-notify" },
--         { "nvim-lua/plenary.nvim" }
--     }
--     }
--     --
--     -- use {
--     --     "nvim-neo-tree/neo-tree.nvim",
--     --     branch = "v3.x",
--     --     requires = {
--     --         "nvim-lua/plenary.nvim",
--     --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     --         "MunifTanjim/nui.nvim",
--     --     }
--     -- }

--     use {
--         'nvim-tree/nvim-tree.lua',
--         requires = {
--             'nvim-tree/nvim-web-devicons', -- optional
--         },
--     }

--     use { 'b4winckler/vim-objc' }

--     use { 'ziglang/zig.vim' }
--     use { "Nymphium/vim-koka" }
--     -------------------------------------------
--     -------------------------------------------
--     -------------------------------------------
--     -------------------------------------------
--     ------- DEBUGGING
--     -------------------------------------------
--     -------------------------------------------
--     -------------------------------------------
--     -------------------------------------------
--     use({
--         "mfussenegger/nvim-dap",
--         config = function(_, _)
--             -- require("core.utils").load_mappings("dap")
--         end
--     })
--     use({
--         "mfussenegger/nvim-dap-python",
--         requires = {
--             "mfussenegger/nvim-dap",
--         },
--         config = function(_, opts)
--             local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
--             require("dap-python").setup(path)
--             -- require("core.utils").load_mappings("dap_python")
--         end,
--     })
--     use({
--         "leoluz/nvim-dap-go",
--         requires = {
--             "mfussenegger/nvim-dap",
--         },
--     })
--     use('theHamsta/nvim-dap-virtual-text')
--     use(
--         {
--             "rcarriga/nvim-dap-ui",
--             -- event = "VeryLazy",
--             requires = { "mfussenegger/nvim-dap" },
--         }
--     )
--     use { '~/Engine/source_code/jakt/editors/vim', as = 'Jakt' }

--     -- syntax highlighting for c3
--     use { 'Airbus5717/c3.vim' }
-- end

-- local function plugins(use)
--     other_plugins(use)
--     custom_plugins(use)

--     -- call setup for various plugins
--     require('tsc').setup()
--     -- vim.notify = require("notify")
-- end
