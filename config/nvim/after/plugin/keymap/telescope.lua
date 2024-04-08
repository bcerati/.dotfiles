local Remap = require("bobo_dev.keymap");
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- fuzzy find all files in the project
nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files({ hidden = true, find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } })
end);

-- fuzzy find all files in the project
nnoremap("<C-p>", function()
    require('telescope.builtin').find_files({ hidden = true, find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } })
end);

-- fuzzy find all files in the project (including git ignore files)
nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
end);

-- fuzzy find open buffers
nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers();
end);

-- fuzzy find a search in all files (including git ignore ones)
nnoremap("<leader>sf", function()
    require('telescope.builtin').live_grep()
end);

-- fuzzy find a search in all files (including git ignore ones)
nnoremap("<leader>ps", function()
    require('telescope.builtin').live_grep({ hidden = true, additional_args = function(opts) return { "--no-ignore" } end })
end);

-- fuzzy find in diagnostics
nnoremap("<leader>di", function()
    require('telescope.builtin').diagnostics();
end);

