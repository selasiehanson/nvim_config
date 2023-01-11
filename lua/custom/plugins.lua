function plugins(use)
    local local_plugin_directory = vim.fn.getenv("MY_NVIM_PLUGINS")
    -- local Plug = vim.fn['plug#']


    print (local_plugin_directory)
    if local_plugin_directory then

        local local_plugins = { "greeter.nvim", "gitbrowser.nvim", "evaluator.nvim" }

        for _, plugin in ipairs(local_plugins) do
                local pl = local_plugin_directory .. "/" .. plugin
            -- print(pl .. " loaded ....")
            use { pl , event = 'VimEnter'}
        end

    end
end

return plugins
