" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .mypy_cache -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" fzf maps
nmap <C-p> :Files<CR>
nmap <C-n> :Ag<CR>
