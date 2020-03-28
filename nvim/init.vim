set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" lsp config
lua << EOF
local nvim_lsp = require'nvim_lsp'

nvim_lsp.pyls.setup{
    root_dir = nvim_lsp.util.root_pattern(".git");
    plugins = {
        yapf = { enabled = true; };
        pycodestyle = {
            enabled = true;
            maxLineLength = 120;
        };
        pyflakes = { enabled = true; };
        autopep8 = { enabled = false; };
    };
}
require'nvim_lsp'.gopls.setup{}
EOF

let g:LspDiagnosticsErrorSign = 'E'
let g:LspDiagnosticsWarningSign = 'W'
let g:LspDiagnosticsInformationSign = 'I'
let g:LspDiagnosticsHintSign = 'H'

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" statusline
" Statusline colors
" hi Base guibg=#212333 guifg=#212333
" hi Mode guibg=#82aaff guifg=#181824 gui=bold
hi Mode gui=bold
" hi Git guibg=#292d3e guifg=#929dcb
" hi Filetype guibg=#292d3e guifg=#929dcb
" hi LineCol guibg=#82aaff guifg=#181824 gui=bold
" Get current mode
let g:currentmode={
      \'n' : 'N ',
      \'no' : 'N·Operator Pending ',
      \'v' : 'V ',
      \'V' : 'V·Line ',
      \'^V' : 'V·Block ',
      \'s' : 'Select ',
      \'S': 'S·Line ',
      \'^S' : 'S·Block ',
      \'i' : 'I ',
      \'R' : 'R ',
      \'Rv' : 'V·Replace ',
      \'c' : 'C ',
      \'cv' : 'Vim Ex ',
      \'ce' : 'Ex ',
      \'r' : 'Prompt ',
      \'rm' : 'More ',
      \'r?' : 'Confirm ',
      \'!' : 'Shell ',
      \'t' : 'Terminal '
      \}

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Get current git branch
function! GitBranch(git)
    if a:git == ""
        return ''
    endif
    return ' '.a:git
endfunction

" Get current filetype
function! CheckFT(filetype)
    if a:filetype == ''
        return '-'
    endif
    return tolower(a:filetype)
endfunction

" Check modified status
function! CheckMod(modi)
    if a:modi == 1
        " hi Modi guifg=#efefef guibg=#212333
        " hi Filename guifg=#efefef guibg=#212333
        return expand('%:t').'*'
    else
        " hi Modi guifg=#929dcb guibg=#212333
        " hi Filename guifg=#929dcb guibg=#212333
        return expand('%:t')
    endif
endfunction

function! LspStatus() abort
    let sl = ''
    if luaeval('vim.lsp.buf.server_ready()')
        let sl.='%#MyStatuslineLSP#E:'
        let sl.='%#MyStatuslineLSPErrors#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")}'
        let sl.='%#MyStatuslineLSP# W:'
        let sl.='%#MyStatuslineLSPWarnings#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")}'
    else
        let sl.=''
    endif
    return sl
endfunction
" Set active statusline
function! ActiveLine()
    " Set empty statusline and colors
    let statusline = ""
    let statusline .= "%#Base#"

    " Current mode
    let statusline .= "%#Mode# %{ModeCurrent()}"

    " Current git branch
    let statusline .= "%#Git# %{GitBranch(fugitive#head())} %)"

    " lsp status
    " spawns lots of warnings in vim-lsp.log
    " let statusline .= LspStatus()

    let statusline .= "%#Base#"

    " Align items to right
    let statusline .= "%="

    " Current modified status and filename
    let statusline .= "%#Modi# %{CheckMod(&modified)} "


    " Current filetype
    let statusline .= "%#Filetype# %{CheckFT(&filetype)} "

    " Current line and column
    let statusline .= "%#LineCol# %l:%c "
    return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Full path of the file
  let statusline .= "%#Filename# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END
