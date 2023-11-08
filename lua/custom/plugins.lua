local custom_plugins = function(use)
    local local_plugin_directory = vim.fn.getenv("MY_NVIM_PLUGINS")


    -- print(local_plugin_directory)
    if local_plugin_directory ~= vim.NIL then
        local local_plugins = { "greeter.nvim", "gitbrowser.nvim", "evaluator.nvim" }

        for _, plugin in ipairs(local_plugins) do
            local pl = local_plugin_directory .. "/" .. plugin
            use { pl, event = 'VimEnter' }
        end
    end
end

local function other_plugins(use)
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.setup({
                -- your configuration
            })
        end,
    })

    use {
        'szw/vim-maximizer'
    }

    use {
        'ntpeters/vim-better-whitespace'
    }

    use {
        'alaviss/nim.nvim'
    }

    use {
        'Tetralux/odin.vim'
    }

    use { 'tikhomirov/vim-glsl' }

    use { 'dmmulroy/tsc.nvim' }
    -- use { 'rcarriga/nvim-notify' }

    use {
        "folke/noice.nvim", requires = {
            { "MunifTanjim/nui.nvim" },
            { "rcarriga/nvim-notify" },
            { "nvim-lua/plenary.nvim" }
        }
    }
    --
    -- use {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --     }
    -- }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use { 'ziglang/zig.vim' }
    use { "Nymphium/vim-koka" }
    use({
        "mfussenegger/nvim-dap",
        -- config = function(_, _)
        --     require("core.utils").load_mappings("dap")
        -- end
    })
    use(
        {
            "rcarriga/nvim-dap-ui",
            -- event = "VeryLazy",
            requires = { "mfussenegger/nvim-dap" },
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end
        }
    )
    use { '~/Engine/source_code/jakt/editors/vim', as = 'Jakt' }


    -- syntax highlighting for c3
    use { 'Airbus5717/c3.vim' }
end

local function plugins(use)
    other_plugins(use)
    custom_plugins(use)

    -- call setup for various plugins
    require('tsc').setup()
    -- vim.notify = require("notify")
end

return plugins
