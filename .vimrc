set nocompatible
filetype off

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('airblade/vim-gitgutter')
call dein#add('roxma/nvim-yarp')
call dein#add('davidhalter/jedi-vim', {'on_ft': ['python']})
call dein#add('majutsushi/tagbar', {'on_map': {'n': '<Plug>'}})
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-dispatch')
call dein#add('sheerun/vim-polyglot')
call dein#add('scrooloose/nerdtree')
call dein#add('nvie/vim-flake8', {'on_ft': ['python']})
call dein#add('vim-python/python-syntax', {'on_ft': ['python']})
call dein#add('janko/vim-test', {'on_ft': ['python']})
call dein#add('fatih/vim-go', {'on_ft': ['go']})
call dein#add('elzr/vim-json', {'on_ft': ['json']})
call dein#add('itchyny/lightline.vim')
call dein#add('mengelbrecht/lightline-bufferline')
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
call dein#add('hashivim/vim-terraform', {'on_ft': ['terraform']})
"" snippets
call dein#add('SirVer/ultisnips', {'on_ft': ['go', 'python']})
call dein#add('honza/vim-snippets', {'on_ft': ['go', 'python']})
"" themes
call dein#add('ryanoasis/vim-devicons')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('sainnhe/vim-color-forest-night')
call dein#add('ayu-theme/ayu-vim')
call dein#add('joshdick/onedark.vim')
call dein#add('josenava/flatland')
call dein#add('gruvbox-community/gruvbox')
call dein#add('wsdjeg/dein-ui.vim')
"" end themes

call dein#add('godlygeek/tabular')

call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('junegunn/fzf.vim')

call dein#end()

filetype plugin indent on    " required

syntax on

" color scheme
set termguicolors
set fillchars+=vert:\ 

colorscheme gruvbox
" colorscheme flatland
" let ayucolor="mirage"
" colorscheme ayu
" let g:PaperColor_Theme_Options = {
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins' : 1
"   \     }
"   \   }
"   \ }

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

let g:python3_host_prog='/usr/bin/python'

let test#strategy = "dispatch"

" maps
nmap \q :nohlsearch<CR>
vmap <C-c> "+y
nmap <leader>gt :bnext<CR>
nmap <leader>gT :bprevious<CR>

set mouse=a
