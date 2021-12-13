local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  reload_on_bufenter = false,
  view = {
    --adaptive_size = true,
    width = "20%",
    side = 'left',
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  filters = {
    exclude = { ".gitignore" }
  }
})

nnoremap('<leader>mm', '<cmd>NvimTreeToggle<CR>')
nnoremap('<leader>mr', '<cmd>NvimTreeRefresh<CR>')
nnoremap('<leader>mo', '<cmd>NvimTreeClose<CR><cmd>NvimTreeOpen<CR>')
nnoremap('<leader>mc', '<cmd>NvimTreeClose<CR>')
nnoremap('<leader>mf', '<cmd>NvimTreeFindFile<CR>')
