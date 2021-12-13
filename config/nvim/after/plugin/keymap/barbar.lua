local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files({ hidden = true, find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } })
end);

local bufopts = { noremap=true, silent=true, buffer=bufnr }

nnoremap('<A-Tab>', '<Cmd>BufferNext<CR>', bufopts);
nnoremap('<leader>b', '<Cmd>BufferPick<CR>', bufopts);
nnoremap('<C-b>', '<Cmd>BufferPick<CR>', bufopts);
inoremap('<C-b>', '<Cmd>BufferPick<CR>', bufopts);
nnoremap('<leader>x', '<Cmd>BufferClose<CR>', bufopts);

nnoremap('<A-&>', '<Cmd>BufferGoto 1<CR>', bufopts);
nnoremap('<A-é>', '<Cmd>BufferGoto 2<CR>', bufopts);
nnoremap('<A-">', '<Cmd>BufferGoto 3<CR>', bufopts);
nnoremap('<A-\'>', '<Cmd>BufferGoto 4<CR>', bufopts);
nnoremap('<A-(>', '<Cmd>BufferGoto 5<CR>', bufopts);
nnoremap('<A-->', '<Cmd>BufferGoto 6<CR>', bufopts);
nnoremap('<A-è>', '<Cmd>BufferGoto 7<CR>', bufopts);
nnoremap('<A-_>', '<Cmd>BufferGoto 8<CR>', bufopts);
nnoremap('<A-ç>', '<Cmd>BufferGoto 9<CR>', bufopts);

