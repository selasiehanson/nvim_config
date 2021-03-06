let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>


"NerdTree
let g:NERDTreeGitStatusShowIgnored=0
"Show current file in directory
" nmap <silent> <C-I> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction


"" FZF
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
nmap ??? :Rg <c-r>=expand("<cword>")<cr><CR>
nmap <leader>w :s/\(<c-r>=expand("<cword>")<cr>\)/
nmap cc :Commands!<CR>


