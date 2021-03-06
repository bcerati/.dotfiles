" this file contains all my "set" that customize wy f* vim experience

set timeoutlen=500
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set mouse+=a

set exrc
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

set relativenumber
set ignorecase
set number
set nohlsearch
set inccommand=nosplit
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=20

set signcolumn=yes
set colorcolumn=120

nnoremap <SPACE> <Nop>

nnoremap <leader>x <cmd>bd<CR>
nnoremap <leader>j <C-w>j<CR>
nnoremap <leader>k <C-w>k<CR>
nnoremap <leader>mm <cmd>NeoTreeFocusToggle<CR>
nnoremap <leader>fm <cmd>NeoTreeRevealToggle<CR>
nnoremap <leader>cm <cmd>NeoTreeClose<CR>
nnoremap <leader>mf <cmd>NeoTreeFloatToggle<CR>
nnoremap <leader>ri <C-w>l<CR>

"searching
nmap <C-F> :vimgrep %

"navigate the quickfixlist
nnoremap <C-k> :cprev<CR>zz
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

nnoremap <C-b> :BufferNext<CR>

" disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let g:bobo_dev_qf_l = 0
let g:bobo_dev_qf_g = 0
fun! ToggleQFList(global)
    if a:global
        if g:bobo_dev_qf_g == 1
            let g:bobo_dev_qf_g = 0
            cclose
        else
            let g:bobo_dev_qf_g = 1
            copen
        end
    else
        if g:bobo_dev_qf_l == 1
            let g:bobo_dev_qf_l = 0
            lclose
        else
            let g:bobo_dev_qf_l = 1
            lopen
        end
    endif
endfun

