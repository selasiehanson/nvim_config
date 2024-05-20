vim.opt_local.expandtab = false


require("go").setup()

vim.keymap.set("n", "<space>td", function()
  require("dap-go").debug_test()
end, { buffer = 0 })
