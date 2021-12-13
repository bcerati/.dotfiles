lua require("bobo_dev.lsp")

set completeopt=menu,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ms :lua vim.lsp.buf.hover()<CR>
nmap <silent><leader>mu <Plug>(coc-references)


