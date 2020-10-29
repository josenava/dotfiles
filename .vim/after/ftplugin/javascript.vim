setlocal autoindent
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal fileformat=unix
setlocal textwidth=120
setlocal tabstop=4

au BufRead,BufNewFile *.js,*.ts match BadWhitespace /^\t\+/
