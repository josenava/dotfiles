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
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'haorenW1025/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
endif
" else
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
"   themes
" Plug 'hardcoreplayers/spaceline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

filetype plugin indent on    " required

syntax on

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1

colorscheme tokyonight
" let g:one_allow_italics = 1
" let g:onedark_terminal_italics = 1
" colorscheme onedark
" let g:gruvbox_filetype_hi_groups = 1
" let g:gruvbox_plugin_hi_groups = 1
" colorscheme gruvbox8_hard
" colorscheme peachpuff
" let ayucolor="dark"
" colorscheme ayu
" colorscheme dracula
" colorscheme nord
" colorscheme night-owl
" colorscheme monokai

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
set spelllang=en,es

set clipboard+=unnamedplus
set undofile
set undodir=~/.vim/undo

let mapleader=" "

let g:netrw_winsize=20
let g:netrw_list_hide= '\.\./,\./'

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
    nnoremap <silent><leader>t :10sp +term<CR>
    tnoremap <silent>kk <C-\><C-n><CR>
else
    nnoremap <leader>t :term<CR>
endif

set mouse=a

" testing ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-;>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
