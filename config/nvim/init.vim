set pyxversion=3

call plug#begin('~/.vim/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-lua/completion-nvim'

    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'romgrk/barbar.nvim'

    Plug 'gruvbox-community/gruvbox'

    Plug 'tpope/vim-fugitive'
    Plug 'SirVer/ultisnips'

    Plug 'nelsyeung/twig.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'

    Plug 'Pocco81/HighStr.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'MunifTanjim/nui.nvim'

    Plug 'nvim-neo-tree/neo-tree.nvim'

    Plug 'simrat39/rust-tools.nvim'
    Plug 'folke/which-key.nvim'

    Plug 'tomlion/vim-solidity'

call plug#end()

let mapleader=" "

"source current file
noremap <leader>so <cmd>source %<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BOBO_DEV
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType twig setlocal shiftwidth=4 softtabstop=4 expandtab
"lua require("nvim-php")
