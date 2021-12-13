set pyxversion=3

call plug#begin('~/.vim/plugged')
    "Plug 'file:///home/boris/Documents/Dev/Perso/nvim-php'
    "Plug 'bcerati/nvim-php'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'kabouzeid/nvim-lspinstall'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'ryanoasis/vim-devicons'

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'romgrk/barbar.nvim'

    Plug 'gruvbox-community/gruvbox'

    Plug 'tpope/vim-fugitive'
    Plug 'SirVer/ultisnips'

    Plug 'nelsyeung/twig.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'bling/vim-bufferline'
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'

    Plug 'Pocco81/HighStr.nvim'

    Plug 'simrat39/rust-tools.nvim'
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

"lua require("nvim-php")
