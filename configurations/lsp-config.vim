" from https://www.chrisatmachine.com/Neovim/27-native-lsp/
" TODO move this into a lua file with a custom lua function like done in here
" https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" buf.hover is the one that actually shoes the signature
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [c <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]c <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>af <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>as <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>ff <cmd>lua vim.lsp.buf.code_action()<CR>



lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
 " autocmd BufWritePre *.purs lua vim.lsp.buf.formatting_sync(nil, 100)


 """ Using the old school way
" autocmd BufWritePre *.purs Neoformat
