vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-W>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-S-Up>", 'copilot#Next()', { silent = true, expr = true })
vim.g.copilot_filetypes = { yaml = true }

