setlocal autoindent
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2
setlocal fileformat=unix
setlocal textwidth=120
setlocal tabstop=2

au BufRead,BufNewFile *.js,*.ts match BadWhitespace /^\t\+/

let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']
let b:ale_lint_on_text_changed = 'never'
let b:ale_lint_on_insert_leave = 0

nnoremap <leader>cf <Plug>(ale_fix)
