let g:zig_fmt_autosave = 0
augroup format_zig
  autocmd!
  autocmd BufWritePre *.zig Neoformat
augroup end


