nmap <leader>nt <cmd>NERDTreeToggle<CR>
nmap <leader>nf <cmd>NERDTreeFind<CR>

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

let NERDTreeShowLineNumbers=1

"makes sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

let g:NERDTreeGitStatusIndicatorMapCustom = {
 \ 'Modified'  :'✹',
 \ 'Staged'    :'✚',
 \ 'Untracked' :'✭',
 \ 'Renamed'   :'➜',
 \ 'Unmerged'  :'═',
 \ 'Deleted'   :'✖',
 \ 'Dirty'     :'✗',
 \ 'Ignored'   :'☒',
 \ 'Clean'     :'✔︎',
 \ 'Unknown'   :'?',
 \ }

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

