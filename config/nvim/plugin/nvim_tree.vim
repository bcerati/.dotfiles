"let g:nvim_tree_ignore = ['.git']

let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>

lua require("bobo_dev/nvim-tree")

