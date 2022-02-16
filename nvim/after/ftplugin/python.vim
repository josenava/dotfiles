setlocal autoindent
" setlocal shiftwidth=4
setlocal expandtab
" setlocal softtabstop=4
setlocal fileformat=unix
setlocal textwidth=120
" setlocal tabstop=4
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/


nnoremap <leader>f :!black -t py38 -l 120 %<cr>
