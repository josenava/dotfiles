" ale config
let b:ale_enabled = 1
let b:ale_linters = ['flake8']
let b:ale_fixers = ['autopep8', 'isort']

setlocal autoindent
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal fileformat=unix
setlocal textwidth=100
setlocal tabstop=4
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

let b:python_highlight_all = 1
