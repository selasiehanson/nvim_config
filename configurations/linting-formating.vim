" Run Neomake when I save any buffer
augroup localneomake
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
"End Syntastic configuration

"Javascript Config
let g:syntastic_javascript_checkers = ['prettier']
 " autocmd BufWritePre *.js Neoformat
"" Strip whitespace on save
"let g:strip_whitespace_on_save = 1

""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
""""  FORMATTERS
""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_ocaml = ['ocamlformat']


"" ** note that clangformat can also format typescript so make sure prettier
"" is installed globally via npm i -g prettier, else clangformat/tslint/fmt
"" will be used
let g:neoformat_enabled_typescript = ['prettier']

""""""""" END FORMATTERS
""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""

" Auto format these files on save
" autocmd BufWritePre *.js Neoformat
"

augroup format_purescript
  autocmd!
  autocmd BufWritePre *.purs Neoformat
augroup end

augroup format_ocaml
  autocmd!
  autocmd BufWritePre *.ml Neoformat
  autocmd BufWritePre *.mli Neoformat
augroup end


