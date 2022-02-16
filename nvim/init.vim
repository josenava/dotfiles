let g:python3_host_prog='/usr/bin/python3'
let plug_dir = '~/.nvim/plugged'

call plug#begin(plug_dir)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-dirvish'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'dense-analysis/ale', { 'for': 'javascript' }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  " themes
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'adigitoleo/vim-mellow'
Plug 'humanoid-colors/vim-humanoid-colorscheme'
Plug 'tjdevries/colorbuddy.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'sainnhe/sonokai'
Plug 'mhartington/oceanic-next'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

filetype plugin indent on    " required

syntax on

set termguicolors
" set background=light
set background=dark
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme mellow
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_current_word = 'bold'
" lua require('colorbuddy').colorscheme('onebuddy')
" colorscheme tokyonight
" colorscheme spaceduck
" let g:moonflyUnderlineMatchParen = 1
" colorscheme moonfly
" let g:nightflyUnderlineMatchParen = 1
" colorscheme nightfly
" let g:onedark_terminal_italics = 1
colorscheme onedark
" let ayucolor="light"
" colorscheme ayu
" colorscheme PaperColor
" colorscheme OceanicNext
set fillchars+=vert:\ 

set encoding=utf-8
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showmatch
set hlsearch
set incsearch
set noshowmode
set laststatus=2
set lazyredraw
set smartcase ignorecase
set autoread
set spelllang=en,es

set clipboard+=unnamedplus
set undofile
set undodir=~/.local/share/nvim/undo
set inccommand=nosplit

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
nmap <leader>gt :tabnext<CR>
nmap <leader>gT :tabprevious<CR>
nnoremap <leader>vt :vsp +term<CR>
nnoremap <silent><leader>t :10sp +term<CR>
tnoremap <silent>jj <C-\><C-n><CR>

set mouse=a

" testing ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-;>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
lua require('lsp')
" set completeopt=menuone,noinsert,noselect
set completeopt=menu,menuone,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
set foldnestmax=1
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
