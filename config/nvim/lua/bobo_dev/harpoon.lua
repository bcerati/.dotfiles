local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap

-- add a file in harpoon
nnoremap("<leader>a", function()
    require('harpoon.mark').add_file();
end);

-- toggle harpoon floating menu
nnoremap("<leader>ha", function()
    require('harpoon.ui').toggle_quick_menu();
end);

-- toggle harpoon floating menu
nnoremap("<leader>hh", "<cmd>Telescope harpoon marks<CR>");

require("telescope").load_extension('harpoon')

