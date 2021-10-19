"search inside nvim config file
nnoremap <leader>cf <cmd>lua require('telescope.builtin').find_files({ cwd = "/home/boris/.config/nvim" })<CR>

"search inside project files
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>

"list all files in the root directory ignore .gitignore ones
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>

"list all files in the root directory wth those that are ignored
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<cr>

nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

