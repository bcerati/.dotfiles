vim.keymap.set('n', '<C-d>', '<C-d>zz');
vim.keymap.set('n', '<C-u>', '<C-u>zz');
vim.keymap.set('n', 'n', 'nzzzv');
vim.keymap.set('n', 'N', 'Nzzzv');

-- resize with arrows
vim.keymap.set('n', '<A-Right>', '<cmd>:vertical resize +5<CR>');
vim.keymap.set('n', '<A-Left>', '<cmd>:vertical resize -5<CR>');
