set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
" execute pathogen#infect()
" plugin conf
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'sheerun/vim-polyglot'
Plugin 'nvie/vim-flake8'
Plugin 'vim-python/python-syntax'
Plugin 'janko/vim-test'
Plugin 'fatih/vim-go'
" themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ayu-theme/ayu-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'ryanoasis/vim-devicons'
" end themes

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" color scheme
set termguicolors
colorscheme PaperColor

let g:airline_theme='ayu_dark'
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
set relativenumber
set showmatch
set hlsearch
set incsearch
set cursorline
set laststatus=2

let mapleader=" "


" Nerdtree
" Open it when there is no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-k>b :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1

" vim-gutter
set updatetime=100

" Enable folding
" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za

" autocomplete
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


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

let test#strategy = "dispatch"


" maps
nmap \q :nohlsearch<CR>
vmap <C-c> "+y
nmap <leader>gt :bnext<CR>
nmap <leader>gT :bprevious<CR>
