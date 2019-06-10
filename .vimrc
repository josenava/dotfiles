set nocompatible
filetype off

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('deoplete-plugins/deoplete-jedi', {'on_ft': ['python']})
call dein#add('vim-scripts/indentpython.vim', {'on_ft': ['python']})
call dein#add('w0rp/ale')
call dein#add('davidhalter/jedi-vim', {'on_ft': ['python']})
call dein#add('majutsushi/tagbar', {'on_map': {'n': '<Plug>'}})
call dein#add('tpope/vim-surround', {'on_map': {'n': '<Plug>'}})
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary', {'on_map': {'n': '<Plug>'}})
call dein#add('tpope/vim-dispatch')
call dein#add('sheerun/vim-polyglot')
call dein#add('nvie/vim-flake8', {'on_ft': ['python']})
call dein#add('vim-python/python-syntax', {'on_ft': ['python']})
call dein#add('janko/vim-test')
call dein#add('fatih/vim-go', {'on_ft': ['go']})
call dein#add('deoplete-plugins/deoplete-go', {'on_ft': ['go']})
call dein#add('elzr/vim-json', {'on_ft': ['json']})
call dein#add('tpope/vim-vinegar')
call dein#add('itchyny/lightline.vim')
call dein#add('mengelbrecht/lightline-bufferline')
call dein#add('hashivim/vim-terraform', {'on_ft': ['terraform']})
"" snippets
call dein#add('SirVer/ultisnips', {'on_ft': ['go', 'python']})
call dein#add('honza/vim-snippets', {'on_ft': ['go', 'python']})
"" themes
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('sainnhe/vim-color-forest-night')
call dein#add('ayu-theme/ayu-vim')
call dein#add('joshdick/onedark.vim')
call dein#add('josenava/flatland')
call dein#add('wsdjeg/dein-ui.vim')
"" end themes

call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown', {'on_ft': ['markdown']})

call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('junegunn/fzf.vim')

call dein#end()

filetype plugin indent on    " required

syntax on

" color scheme
set termguicolors

colorscheme flatland

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2

set encoding=utf-8
set tabstop=4
set softtabstop=4
set number relativenumber
set showmatch
set hlsearch
set incsearch
set cursorline
set noshowmode
set laststatus=2

let mapleader=" "

let g:netrw_liststyle=3
let g:netrw_winsize=20

" vim-gutter
set updatetime=100

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" split files
set splitbelow splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufRead,BufNewFile *.c,*.h set tabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.c,*.h set fileformat=unix
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" fzf
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

" tagbar
nmap <F8> :TagbarToggle<CR>


let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:python3_host_prog='/usr/bin/python'

let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0

let test#strategy = "dispatch"

" terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" maps
nmap \q :nohlsearch<CR>
vmap <C-c> "+y
nmap <leader>gt :bnext<CR>
nmap <leader>gT :bprevious<CR>

set mouse=a
