local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.t_co = 256
vim.opt.hlsearch = false
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.background='dark'
vim.opt.colorcolumn = '120'
vim.opt.smartindent = true
vim.opt.scrolloff = 4
vim.opt.encoding = 'utf8'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local map = vim.api.nvim_set_keymap
local opts = {silent = true, noremap = true}

map('i', 'jk','<Esc><Right>', opts)
map('n', '<leader>t','<cmd>bnext<Cr>',opts)
map('n', '<leader>T','<cmd>bprevious<Cr>',opts)
map('i', '{<Cr>', '{<Cr>}<Esc>O',opts)
map('n', '<C-u>', '<C-u>zz',opts)
map('n', '<C-d>', '<C-d>zz',opts)
map('t', '<C-l>', [[<C-\><C-n>:b#<Cr>]], {silent = true, noremap = true})
--Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

require"lazy".setup("plugins")
