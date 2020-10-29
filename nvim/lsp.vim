" lsp config


" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" " nnoremap <silent> <leader><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd Filetype javascript setlocal omnifunc=v:lua.vim.lsp.omnifunc

" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'
