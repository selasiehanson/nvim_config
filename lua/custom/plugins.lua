local custom_plugins = function(use)
    local local_plugin_directory = vim.fn.getenv("MY_NVIM_PLUGINS")
    -- local Plug = vim.fn['plug#']


    print(local_plugin_directory)
    if local_plugin_directory then

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

    use { 'ziglang/zig.vim' }
end

function plugins(use)
    other_plugins(use)
    custom_plugins(use)
end

return plugins
