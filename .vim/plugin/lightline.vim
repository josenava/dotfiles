" lightline
if !has('nvim')
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
	  \   'cocstatus': 'coc#status',
      \ },
      \ 'mode_map': {
			\ 'n' : 'N',
			\ 'i' : 'I',
			\ 'R' : 'R',
			\ 'v' : 'V',
			\ 'V' : 'V-L',
			\ "\<C-v>": 'V-BLOCK',
			\ 'c' : 'COMMAND',
			\ 's' : 'SELECT',
			\ 'S' : 'S-LINE',
			\ "\<C-s>": 'S-BLOCK',
			\ 't': 'TERMINAL',
      \ }
\ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {
	\ 'buffers': 'lightline#bufferline#buffers',
	\}
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
endif
