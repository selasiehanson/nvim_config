-- " aurora theme needs this
-- " set termguicolors

-- " gui settings
-- if (&t_Co == 256 || has('gui_running'))
  -- if ($TERM_PROGRAM == 'iTerm.app')
    -- " colorscheme elflord
    -- " color space-vim-dark
    -- " colorscheme spacegray
    -- " colorscheme onedark
    -- " colorscheme molokai
    -- " colorscheme sitruuna
    -- colorscheme tokyonight
    -- " colorscheme gruvbox
    -- " colorscheme aurora
    -- " colorscheme ayu
  -- else
    -- " colorscheme fu
    -- " colorscheme spacegray
    -- " color space-vim-dark
    -- " colorscheme onedark
    -- " colorscheme onedark
    -- " colorscheme gruvbox
    -- " colorscheme aurora
    -- " colorscheme ayu
    -- colorscheme sitruuna
  -- endif
-- endif

-- vim.opt.colorscheme =  "tokyonight"
-- vim.g.colors_name = "tokyonight"
local color_scheme  = "tokyonight"
vim.opt.termguicolors = true
vim.cmd('colorscheme ' .. color_scheme)

-- " --- END THEME CUSTOMIZATION---
-- " POWER LINE CUSTOMIZATION
-- let g:airline_powerline_fonts = 1
-- let g:airline#extensions#branch#displayed_head_limit = 17
-- let g:sitruuna_fzf = 0


