
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
---- NOT USED
local function custom_code_action_callback (_, _, action)
  print(vim.inspect(action))
end
-- vim.lsp.handlers['textDocument/codeAction'] = custom_codeAction_callback
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol';

local on_attach = function(client, bufnr)
    --protocol.SymbolKind = { }
  -- protocol.CompletionItemKind = {
  --   '', -- Text
  --   '', -- Method
  --   '', -- Function
  --   '', -- Constructor
  --   '', -- Field
  --   '', -- Variable
  --   '', -- Class
  --   'ﰮ', -- Interface
  --   '', -- Module
  --   '', -- Property
  --   '', -- Unit
  --   '', -- Value
  --   '', -- Enum
  --   '', -- Keyword
  --   '﬌', -- Snippet
  --   '', -- Color
  --   '', -- File
  --   '', -- Folder
  --   '', -- EnumMember
  --   '', -- Constant
  --   '', -- Struct
  --   '', -- Event
  --   'ﬦ', -- Operator
  --   '', -- TypeParameter
  -- }
end

-- Lsps can be found here https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- require'lspconfig'.metals.setup{} --scala
-- require'lspconfig'.hie.setup{}
-- require'lspconfig'.hls.setup{}
-- require'lspconfig'.zls.setup{}



-- require'lspconfig'.bashls.setup{}
-- require'lspconfig'.gopls.setup{}
-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.ocamllsp.setup{}
-- require'lspconfig'.elmls.setup{}
-- -- require'lspconfig'.metals.setup{} --scala
-- require'lspconfig'.cssls.setup{}
-- -- require'lspconfig'.hie.setup{}
-- -- require'lspconfig'.hls.setup{}
-- require'lspconfig'.nimls.setup{}
-- require'lspconfig'.purescriptls.setup{}
-- require'lspconfig'.intelephense.setup{} --php
-- require'lspconfig'.clangd.setup{}

local servers =  {
  "bashls",
  -- "gopls",
  "tsserver",
  "ocamllsp",
  -- "elmls",
  "cssls",
  "nimls",
  "purescriptls",
  "intelephense", --php
  "clangd",
  "clojure_lsp",
  -- "zls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- require "lspconfig".efm.setup {
--     init_options = {documentFormatting = true, codeAction = true},
--     filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact"},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             javascript = {eslint},
--             javascriptreact = {eslint},
--         }
--     }
-- }
