" Scala config
" au BufRead,BufNewFile *.sbt set filetype=scala
" autocmd FileType json syntax match Comment +\/\/.\+$+ "for json

augroup lsp
  au!
  au FileType scala,sbt lua require('metals').initialize_or_attach({})
augroup end
