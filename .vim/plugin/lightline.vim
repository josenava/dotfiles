" lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'coc_status' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'coc_status': 'coc#status'
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
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2
