if has('nvim')
    let plug_dir = '~/.nvim/plugged'
else
    let plug_dir = '~/.vim/plugged'
endif

call plug#begin(plug_dir)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
if has('nvim')
    Plug 'neovim/nvim-lsp'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
endif
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
"   themes
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'dracula/vim'
Plug 'jaredgorski/spacecamp'
Plug 'hardselius/warlock'
call plug#end()

filetype plugin indent on    " required

syntax on

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set background=dark
" colorscheme peachpuff
let ayucolor="dark"
colorscheme ayu
" colorscheme spacecamp_lite
" colorscheme one
" colorscheme dracula
" colorscheme warlock

let g:python3_host_prog='/usr/bin/python'

set fillchars+=vert:\ 

set encoding=utf-8
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set number " relativenumber
set showmatch
set hlsearch
set incsearch
" set cursorline
set noshowmode
set laststatus=2
set lazyredraw
set smartcase ignorecase
set autoread

set clipboard+=unnamedplus
set undofile
set undodir=~/.vim/undo

let mapleader=" "

let g:netrw_winsize=20
" split files
set splitbelow splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile * match BadWhitespace /\s\+$/

" maps
nmap \q :nohlsearch<CR>
" vmap <C-c> "+y
nmap <leader>gt :bnext<CR>
nmap <leader>gT :bprevious<CR>
nnoremap <leader>vt :vsp +term<CR>

if has('nvim')
    nnoremap <leader>t :sp +term<CR>
else
    nnoremap <leader>t :term<CR>
endif

set mouse=a
