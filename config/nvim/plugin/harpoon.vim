nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>ha :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hb :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hc :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>hd :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>he :lua require("harpoon.ui").nav_file(5)<CR>

