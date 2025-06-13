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


-- clangd
-- I'm using this because of an error with the default clangd config
-- "Multiple different client offset_encodings detected" reappearing after 0.9.0 update.
-- solutiion from https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
lspconfig.clangd.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

-- golangci
lspconfig.gopls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.templ.setup {
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
--
--
lspconfig.denols.setup {
  capabilities = capabilities,
  -- on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.ts_ls.setup {
  -- lspconfig.vtsls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
  -- root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
if not configs.kotlin_ls then
  configs.kotlin_ls = {
    default_config = {
      cmd = { 'kotlin-ls', '--stdio' },
      single_file_support = true,
      filetypes = { 'kotlin' },
      root_markers = { 'build.gradle', 'build.gradle.kts', 'pom.xml' },
    },
  }
end

lspconfig.kotlin_ls.setup {
  capabilities = capabilities
}

if not configs.onys then
  configs.onyx = {
    default_config = {
      cmd = { "onyx", "lsp" },
      filetypes = { "onyx" },
      root_dir = lspconfig.util.root_pattern("onyx-pkg.kdl"),
      settings = {}
    }
  }
end

lspconfig.onyx.setup {
  capabilities = capabilities
}
