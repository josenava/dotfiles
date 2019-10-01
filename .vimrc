if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('airblade/vim-gitgutter')
  " call dein#add('davidhalter/jedi-vim', {'on_ft': ['python']})
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch', {'on_ft': ['python', 'go']})
  call dein#add('sheerun/vim-polyglot')
  call dein#add('janko/vim-test', {'on_ft': ['python']})
  call dein#add('fatih/vim-go', {'on_ft': ['go']})
  call dein#add('itchyny/lightline.vim')
  call dein#add('mengelbrecht/lightline-bufferline')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
  "" themes
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('ayu-theme/ayu-vim')
  call dein#add('joshdick/onedark.vim')
  " call dein#add('wsdjeg/dein-ui.vim')
  "" end themes
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add('junegunn/fzf.vim')

  call dein#end()
  call dein#save_state()
endif
" end plugins

filetype plugin indent on    " required

syntax on

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme dracula
colorscheme onedark
" let ayucolor="mirage"
" colorscheme ayu
" colorscheme nord

let g:python3_host_prog='/usr/bin/python'

let test#strategy = "dispatch"

set fillchars+=vert:\ 

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

" maps
nmap \q :nohlsearch<CR>
vmap <C-c> "+y
nmap <leader>gt :bnext<CR>
nmap <leader>gT :bprevious<CR>

set mouse=a
