local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- broadcast cmp capabilities to every server
vim.lsp.config("*", { capabilities = capabilities })

-- servers with shipped defaults: override only what's needed
vim.lsp.config("ocamllsp", {
  cmd = { "ocamllsp", "--fallback-read-dot-merlin" }, -- fallback-read-dot-merlin is needed for melange
})

-- clangd
-- I'm using --offset-encoding=utf-16 because of an error with the default clangd config
-- "Multiple different client offset_encodings detected" reappearing after 0.9.0 update.
-- solution from https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

vim.lsp.config("ts_ls", {
  -- root_markers replaces the deprecated single_file_support: ts_ls only attaches
  -- inside a project that has one of these markers.
  root_markers = { "package.json", "tsconfig.json" },
})

-- gleam
vim.lsp.config("gleam", {
  cmd = { "gleam", "lsp" },
})

-- ols: native default exists; Mason does not support odin so it's installed manually
vim.lsp.config("ols", {
  filetypes = { "odin" },
})

-- gopls, templ: shipped defaults are fine (capabilities come from the "*" config)

-- servers WITHOUT shipped defaults: full definition
vim.lsp.config("kotlin_ls", {
  cmd = { "kotlin-ls", "--stdio" },
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
})

vim.lsp.config("onyx", {
  cmd = { "onyx", "lsp" },
  filetypes = { "onyx" },
  root_markers = { "onyx-pkg.kdl" },
})

vim.lsp.enable({
  "ocamllsp",
  "clangd",
  "gopls",
  "templ",
  "gleam",
  "ts_ls",
  "ols",
  "kotlin_ls",
  "onyx",
  "clojure_lsp",
})

-- lspconfig.metals.setup{}
--
-- lspconfig.denols.setup {
--   capabilities = capabilities,
--   -- on_attach = on_attach,
--   root_dir = lspconfig.util.root_pattern({"deno.json", "deno.jsonc"}),
-- }

-- lspconfig.serve_d.setup {}

-- lspconfig.serve_d.setup {
--   init_options = {
--     settings = {
--       d = {
--         dcdClientPath = vim.fn.exepath "dcd-client",
--         dcdServerPath = vim.fn.exepath "dcd-server",
--       },
--     },
--   },
--   settings = {
--     dcdServerPath = vim.fn.exepath "dcd-server",
--     dcdClientPath = vim.fn.exepath "dcd-client",
--     -- Disable DCD
--     -- useDCD = false,
--   },
-- }
-- vim.lsp.enable "serve_d"
--
-- vim.lsp.config("serve_d", {
--   cmd = { "serve-d" },
--   -- filetypes = { "jte" },
--   -- Optional: explicitly configure DCD paths
--   init_options = {
--     configuration = {
--       d = {
--         dcdClientPath = vim.fn.exepath "dcd-client",
--         dcdServerPath = vim.fn.exepath "dcd-server",
--       },
--     },
--   },
--   -- root_dir = function()
--   --   return vim.loop.cwd()
--   -- end,
--   -- root_markers = { "jte.txt", "package.json" }, -- where to set the root directory
--   -- cmd_cwd = vim.fs.root(0, { "jte.txt" }),
--   -- root_dir = vim.fs.root(0, { "jte.txt" }),
--   root_dir = vim.fs.dirname(vim.fs.find({ "dub.json", "dub.sdl", ".git" }, { upward = true })[1]),
-- })
-- vim.lsp.enable "serve_d"
