local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap

nnoremap('gD', function () vim.lsp.buf.declaration() end);
nnoremap('gd', function () vim.lsp.buf.definition() end);
nnoremap('gu', function () vim.lsp.buf.references() end);
nnoremap('K', function () vim.lsp.buf.hover() end);

