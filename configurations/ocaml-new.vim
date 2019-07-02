" if executable('opam')
" 	let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
" 	if isdirectory(g:opamshare."/merlin/vim")
" 		execute "set rtp+=" . g:opamshare."/merlin/vim"
" 	endif
" endif

" let g:merlin_completion_with_doc = 1


" Plug 'copy/deoplete-ocaml'
" " enable deoplete
" let g:deoplete#enable_at_startup = 1

" " this is the default, make sure it is not set to "omnifunc" somewhere else in your vimrc
" let g:deoplete#complete_method = "complete"

" " other completion sources suggested to disable
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" " no delay before completion
" let g:deoplete#auto_complete_delay = 0


"===============================================
"
"


