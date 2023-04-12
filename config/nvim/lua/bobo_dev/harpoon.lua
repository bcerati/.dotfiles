local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap

-- add a file in harpoon
nnoremap("<leader>a", function()
    require('harpoon.mark').add_file();
end);

-- toggle harpoon floating menu
nnoremap("<leader>hh", function()
    require('harpoon.ui').toggle_quick_menu();
end);

-- toggle harpoon floating menu
nnoremap("<leader>ha", "<cmd>Telescope harpoon marks<CR>");

nnoremap("<C-Down>", function () 
  require('harpoon.ui').nav_next();
end);

nnoremap("<C-Up>", function () 
  require('harpoon.ui').nav_prev();
end);

require("telescope").load_extension('harpoon')

