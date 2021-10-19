set pyxversion=3

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'kabouzeid/nvim-lspinstall'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'

    Plug 'gruvbox-community/gruvbox'

    Plug 'nelsyeung/twig.vim'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'bling/vim-bufferline'
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'
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

lua require("bobo_dev")
