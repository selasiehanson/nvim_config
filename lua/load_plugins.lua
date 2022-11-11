--  Vum Lua References
--
--
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
--
local local_plugin_directory = vim.fn.getenv("MY_NVIM_PLUGINS")
local Plug = vim.fn['plug#']

-- print (local_plugin_directory)
if local_plugin_directory then

  local local_plugins= {"greeter.nvim", "gitbrowser.nvim", "evaluator.nvim"}

  for _, plugin in ipairs(local_plugins) do
    local pl = local_plugin_directory .. "/" .. plugin
    -- print(pl)
    Plug(pl)
  end

end
