-- copied from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/globals.lua
--

local ok, plenary_reload = pcall(require, "plenary.reload")
local reloader = require
if ok then
  reloader = plenary_reload.reload_module
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return reloader(...)
end

-- how to use
-- in neovim can do the following
-- :lua R("greeter")
-- where greeter is lua file/module
R = function(name)
  RELOAD(name)
  return require(name)
end
