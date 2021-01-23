
" aurora theme needs this
" set termguicolors

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    " colorscheme elflord
    " color space-vim-dark
    " colorscheme spacegray
    " colorscheme onedark
    colorscheme molokai
    " colorscheme gruvbox
    " colorscheme aurora
    " colorscheme ayu
  else
    " colorscheme fu
    " colorscheme spacegray
    " color space-vim-dark
    " colorscheme onedark
    colorscheme onedark
    " colorscheme gruvbox
    " colorscheme aurora
    " colorscheme ayu
  endif
endif

" --- THEME CUSTOMIZATION---
" call one#highlight('vimLineComment', 'cccccc', '', 'none')
" let g:space_vim_dark_background = 234
" let g:spacegray_underline_search = 1
" let g:spacegray_use_italics = 1
" let g:spacegray_low_contrast = 1

let g:space_vim_dark_background = 234

" --- END THEME CUSTOMIZATION---
" POWER LINE CUSTOMIZATION
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17


