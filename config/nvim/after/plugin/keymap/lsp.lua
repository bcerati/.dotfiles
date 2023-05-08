local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap

nnoremap('gi', function () vim.lsp.buf.implementation() end);
nnoremap('gD', function () vim.lsp.buf.declaration() end);
nnoremap('gd', function () vim.lsp.buf.definition() end);
--nnoremap('gu', function () vim.lsp.buf.references() end);
nnoremap('gu', '<cmd>References<CR>');
nnoremap('K', function () vim.lsp.buf.hover() end);

