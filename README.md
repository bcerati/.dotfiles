Here are the dotfiles I am using on my machines.

In here you'll find my:

* i3 conf ;
* tmux conf ;
* neovim conf.

# Mappings

Here are the mapping I'm using:

```vim
  #coc mappings
  nmap <silent> gd <Plug>(coc-definition)
  nmap <leader>rn <Plug>(coc-rename)
  nmap <silent><leader>mu <Plug>(coc-references)
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  "harpoon mappings
  nmap <leader>hm <cmd>lua require("harpoon.mark").add_file()<CR>
  nmap <leader>ha <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
  nmap <leader>ht <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>

  "NERDTree mappings
  nmap <leader>nn <cmd>NERDTreeToggle<CR>
  nmap <leader>nf <cmd>NERDTreeFind<CR>

  "telescope mappings
  nnoremap <leader>cf <cmd>lua require('telescope.builtin').find_files({ cwd = "/home/boris/.config/nvim" })<CR>
  nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
  nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

  "global mappings
  nnoremap <silent><A-Tab> :BufferNext<CR>
  nnoremap <silent><A-,> :BufferPrevious<CR>
  nnoremap <silent><A-.> :BufferNext<CR>
  nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
  nnoremap <leader>ms :lua vim.lsp.buf.hover()<CR>
  nnoremap <SPACE> <Nop>
  nnoremap <leader>x <cmd>bd<CR>
  nnoremap <leader>j <C-w>j<CR>
  nnoremap <leader>k <C-w>k<CR>
  nnoremap <leader>h <C-w>h<CR>
  nnoremap <leader>l <C-w>l<CR>
  nnoremap <leader>b :b<space>
  nnoremap <C-k> :cprev<CR>zz
  nnoremap <C-j> :cnext<CR>zz
  nnoremap <C-q> :call ToggleQFList(1)<CR>
  nnoremap <leader>q :call ToggleQFList(0)<CR>
  nmap <C-F> :vimgrep %
```

# Installation machine

This part is a reminder part for the things I need to install when reinstalling my machine. I'll delete that part when
I have the motivation to write an Ansible script. :D

--------------

- sudo apt-get install ripgrep => for telescope find files
- npm install -g typescript-language-server typescript intelephense

Inside of vim :
    CocInstall coc-json coc-tsserver
    :CocInstall coc-snippets


Other things to do :

    python3 -m pip install --user --upgrade pynvim
