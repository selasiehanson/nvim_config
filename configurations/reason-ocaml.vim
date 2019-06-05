" let g:opamshare = substitute(system('opam config var bin'),'\n$','','''')
" execute "set rtp+=" . g:opamshare
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/selasiehanson/Engine/lang-servers/reason-language-server/reason-language-server.exe'],
    \ 'ocaml': ['/Users/selasiehanson/Engine/lang-servers/reason-language-server/reason-language-server.exe']
    \ }
" ['ocaml-language-server', '--stdio'],

autocmd FileType reason silent! call merlin#Register()
autocmd FileType reason nnoremap <silent> gf :ReasonPrettyPrint<CR>
autocmd FileType ocaml,reason nnoremap <silent> <localleader>d :MerlinDocument<CR>

let g:reasonml_project_airline = 1
let g:reasonml_syntastic_airline = 1
let g:reasonml_clean_project_airline = 1
let g:syntastic_reason = 1
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_reason_checkers = ['merlin']
let g:airline#extensions#esy#enabled = 1
let g:airline#extensions#reason#enabled = 1

" Neoformat
let g:neoformat_ocaml_ocamlformat = {
  \ 'exe': 'ocamlformat',
  \ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-'],
  \ 'no_append': 1,
  \ 'stdin': 1,
  \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']


" enable deoplete
let g:deoplete#enable_at_startup = 1

" this is the default, make sure it is not set to "omnifunc" somewhere else in your vimrc
let g:deoplete#complete_method = "complete"

" other completion sources suggested to disable
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" no delay before completion
let g:deoplete#auto_complete_delay = 0
