" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
"End Syntastic configuration

"Javascript Config
let g:syntastic_javascrtipt_checkers = ['prettier']
 " autocmd BufWritePre *.js Neoformat
"" Strip whitespace on save
"let g:strip_whitespace_on_save = 1

let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': [ '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']
" Auto format these files on save
" autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.purs Neoformat
autocmd BufWritePre *.ml Neoformat
autocmd BufWritePre *.mli Neoformat


