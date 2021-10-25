vim.o.completeopt = "menuone,noselect"

local cmp = require "cmp"
local lspkind = require('lspkind')
local symbols = {
  -- Class = '🅒',
  Class = '∴',
  -- Color = '☀',
  -- Color = '⛭',
  Color = '🖌',
  -- Constant = 'π',
  Constant = '𝜋',
  Constructor = '⬡',
  -- Constructor = '⌬',
  -- Constructor = '⎔',
  -- Constructor = '⚙',
  -- Constructor = 'ᲃ',
  Enum = '',
  EnumMember = '',
  Event = '',
  -- Field = '→',
  -- Field = '∴',
  Field = '🠶',
  File = '',
  Folder = '',
  -- Function = 'ƒ',
  Function = 'λ',
  Interface = '',
  Keyword = '🗝',
  Method = 'ƒ',
  -- Method = 'λ',
  Module = '📦',
  Operator = '≠',
  -- Operator = '±',
  -- Property = '::',
  Property = '∷',
  -- Reference = '⌦',
  Reference = '⊷',
  -- Reference = '⊶',
  -- Reference = '⊸',
  -- Snippet = '',
  -- Snippet = '↲',
  -- Snippet = '♢',
  -- Snippet = '<>',
  Snippet = '{}',
  Struct = '',
  Text = '#',
  -- Text = '♯',
  -- Text = 'ⅵ',
  -- Text = "¶",
  -- Text = "𝒯",
  -- Text = "𝓣",
  -- Text = "𐄗",
  TypeParameter = '×',
  Unit = '()',
  -- Value           =
  Variable = '𝛼',
  -- Variable = 'χ',
  -- Variable = '𝓧',
  -- Variable = '𝛸',
  -- Variable = 'α',
  -- Variable = '≔',
}
-- other symbols that might be useful for something: -- ⊕ † ፨ ᯾ ⁂ ∎ ∹ ☖ ⚐ 🕮 🗈 🗉 🗈 🗉 ⬠  ⬡  ⮺  ⮻ ⯐  ⯒ ⟡ ✐  ✎ ꒾꙳ ꥟ ⤙ ⤚ ⤛ ⤜

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,


    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer'},
      }),
    formatting = {
      format = lspkind.cmp_format({
          with_text = true,
          -- preset = 'codicons',
          symbol_map = symbols,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
          }
        }),
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    },
  })


