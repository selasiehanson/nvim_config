local lspconfig = require("lspconfig");

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())



local ocaml_lsp_command = { 'ocamllsp', '--fallback-read-dot-merlin' } -- fallback-read-dot-merlin  is needed for melange
-- local ocaml_lsp_command = { 'ocamllsp' }   -- fallback-read-dot-merlin  is needed for melange
lspconfig.ocamllsp.setup {
  capabilities = capabilities,
  cmd = ocaml_lsp_command,
  -- on_attach = on_attach,
}

-- Mason does not support odin so we have to do it manually
local util = require 'lspconfig.util'

lspconfig['ols'].setup {
  -- on_attach = on_attach,
  filetypes = { "odin" },
  rootPatterns = { "ols.json" },
  settings = {
  }
}



-- golangci
lspconfig.gopls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
}


-- gleam
lspconfig.gleam.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gleam", "lsp" },
}

-- lspconfig.metals.setup{}

