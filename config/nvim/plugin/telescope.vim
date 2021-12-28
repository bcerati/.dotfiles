lua require("bobo_dev/telescope")

"search inside nvim config file
nnoremap <leader>cf <cmd>lua require('telescope.builtin').find_files({ cwd = "/home/boris/.config/nvim" })<CR>

"search inside project files
function LiveGrepAdditional_args()
  return ["--no-ignore"]
endfunction

nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep({additional_args = LiveGrepAdditional_args})<CR>
nnoremap <leader>vs <cmd>lua require('telescope.builtin').live_grep({ additional_args = LiveGrepAdditional_args, cwd = "/home/boris/.config/nvim"})<CR>

"list all files in the root directory ignore .gitignore ones
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true, find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } })<cr>

"list all files in the root directory wth those that are ignored
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<cr>

nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

