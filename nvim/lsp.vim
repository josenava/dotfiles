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
        pyls_mypy = { enabled = true; };
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
