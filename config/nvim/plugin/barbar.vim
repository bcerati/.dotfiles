let fg_target = 'blue'

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'numbers'

nnoremap <silent><A-Tab> :BufferNext<CR>
nnoremap <leader>b :BufferPick<CR>
