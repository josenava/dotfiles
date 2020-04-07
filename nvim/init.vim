set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc
" source ~/.config/nvim/statusline.vim
" still not ready, using coc instead
" source ~/.config/nvim/lsp.vim

set inccommand=nosplit
