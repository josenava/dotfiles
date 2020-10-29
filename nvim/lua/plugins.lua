vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

return packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'airblade/vim-gitgutter'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'mattn/emmet-vim'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'justinmk/vim-dirvish'
    use 'simnalamburt/vim-mundo'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
    use 'haorenW1025/completion-nvim'

    use { 'junegunn/fzf', run = './install --all' }
    use 'junegunn/fzf.vim'

    use { 'dense-analysis/ale', ft = 'javascript' }

    -- themes
    use 'ryanoasis/vim-devicons'
    use 'ayu-theme/ayu-vim'
    use 'joshdick/onedark.vim'
    use 'ghifarit53/tokyonight-vim'
    use 'adigitoleo/vim-mellow'

end)
