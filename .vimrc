set nocompatible
filetype off

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('deoplete-plugins/deoplete-jedi')
call dein#add('vim-scripts/indentpython.vim', {'on_ft': ['python']})
call dein#add('w0rp/ale')
call dein#add('davidhalter/jedi-vim')
call dein#add('majutsushi/tagbar')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-dispatch')
call dein#add('sheerun/vim-polyglot')
call dein#add('nvie/vim-flake8')
call dein#add('vim-python/python-syntax', {'on_ft': ['python']})
call dein#add('janko/vim-test')
call dein#add('fatih/vim-go', {'on_ft': ['go']})
call dein#add('deoplete-plugins/deoplete-go', { 'do': 'make' })
call dein#add('elzr/vim-json')
call dein#add('tpope/vim-vinegar')
call dein#add('hashivim/vim-terraform')
"" snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
"" themes
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('ayu-theme/ayu-vim')
call dein#add('joshdick/onedark.vim')
call dein#add('vivkin/flatland.vim')
call dein#add('wsdjeg/dein-ui.vim')
"" end themes

call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')

call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('junegunn/fzf.vim')

call dein#end()

filetype plugin indent on    " required

syntax on

" color scheme
set termguicolors

colorscheme flatland

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = '│'
let g:airline_right_alt_sep = '│'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1

set tabstop=4
set softtabstop=4
set number relativenumber
set showmatch
set hlsearch
set incsearch
set cursorline
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

set encoding=utf-8

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
