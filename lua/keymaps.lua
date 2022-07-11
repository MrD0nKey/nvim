vim.g.mapleader = ' '
vim.g.localleader = ','

local map = vim.api.nvim_set_keymap
local opts ={silent = true, noremap=true}

map('i','jk','<esc><right>',opts)

map('n','<leader>ss','<cmd>so %<CR>',opts)

map('n','t','<cmd>BufferNext<CR>',opts)
map('n','T','<cmd>BufferPrevious<CR>',opts)

