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


" find search for a word and type in it's replacement
nnoremap <leader>w :s/\(<c-r>=expand("<cword>")<cr>\)/


"" Telescope
" Show all telescope bindings
nnoremap <Leader>pp :lua require'telescope.builtin'.builtin{}<CR>

" Find all files
nnoremap <Leader>te :lua require'telescope.builtin'.find_files{}<CR>

"Find files under git
nnoremap <Leader>t :lua require'telescope.builtin'.git_files{}<CR>

" show files currentyly opened in buffers
nnoremap ; :lua require'telescope.builtin'.buffers{}<CR>

" fuzzy find a piece of text in the currently opened buffer
nnoremap // :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" pick a color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>

" ripgrep like grep through dir
nnoremap ?? :lua require'telescope.builtin'.live_grep{}<CR>

" find word under cursor
nnoremap ??? :lua require 'telescope.builtin'.live_grep{ default_text = vim.fn.expand("<cword>") }<CR>
