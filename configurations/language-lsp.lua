-- Lsps can be found here https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

require'lspconfig'.bashls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.ocamllsp.setup{}
require'lspconfig'.elmls.setup{}
require'lspconfig'.metals.setup{} --scala
require'lspconfig'.cssls.setup{}
-- require'lspconfig'.hie.setup{}
-- require'lspconfig'.hls.setup{}
require'lspconfig'.nimls.setup{}
require'lspconfig'.purescriptls.setup{}
require'lspconfig'.intelephense.setup{} --php

